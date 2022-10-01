//
//  imageLoader.swift
//  listings app
//
//  Created by Madney on 22/06/2022.
//

import Foundation
import Combine
import UIKit

final class ImageLoader: ObservableObject {
    
    // MARK:- Nested class
    final class ImageCache {
        static let shared = ImageCache()
        private init() {}
        private var cache = NSCache<NSString, UIImage>()
        func imageForKey(_ key: String) -> UIImage? {
            cache.object(forKey: NSString(string: key))
        }
        
        func setImageForKey(_ key: String, image: UIImage) {
            cache.setObject(image, forKey: NSString(string: key))
        }
    }
    
    // MARK:- Publisher
    @Published var image: UIImage?
    @Published var loading: Bool?
    // MARK:- Private Properties
    private let imageCache = ImageCache.shared
    private let urlString: String?
    private let urlLowResString: String?
    private let errorImage: UIImage?
    private let retries: Int
    
    // MARK:- Lifecycle
    init(urls: (urlString: String?, lowResURLString: String?),
         errorImage: UIImage?,loading:Bool, retries: Int = 1) {
        self.urlString = urls.urlString
        self.urlLowResString = urls.lowResURLString
        self.errorImage = errorImage
        self.retries = retries
        self.loading = loading
        self.load()
    }
    
    // MARK:- Private methods.
    private func load() {
        guard !loadImageFromCache() else { return }
        loadImageFromURL()
    }
    
    private func loadImageFromCache() -> Bool {
        guard let urlString = urlString,
        let cacheImage = imageCache.imageForKey(urlString)
        else { return false }
        image = cacheImage
        self.loading = false
        return true
    }
    
    private func loadImageFromURL() {
        guard let urlString = urlString, let url = URL(string: urlString) else { return }
        let request = URLRequest(url: url)
        self.loading = true
        URLSession.shared.dataTaskPublisher(for: request)
            .tryCatch { error -> URLSession.DataTaskPublisher in
                guard
                    error.networkUnavailableReason == .constrained,
                    let lowResURLString = self.urlLowResString,
                    let lowResURL = URL(string: lowResURLString) else {
                    throw error
                }
                return URLSession.shared.dataTaskPublisher(for: lowResURL)
            }
            .tryMap {
                guard let response = $0.response as? HTTPURLResponse,
                      response.statusCode == 200,
                      let image = UIImage(data: $0.data)
                else {
                    throw APIError.responseUnsuccessful
                }
                self.imageCache.setImageForKey(urlString, image: image)
                DispatchQueue.main.async {
                    self.loading = false
                }
                return image
            }
            .retry(retries)
            .replaceError(with: errorImage)
            .receive(on: DispatchQueue.main)
            .assign(to: &$image)
    }
}

