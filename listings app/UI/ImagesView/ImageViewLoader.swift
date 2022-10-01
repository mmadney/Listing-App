//
//  imageViewLoader.swift
//  listings app
//
//  Created by Madney on 22/06/2022.
//

import SwiftUI

struct ImageViewCache: View {
    
    // MARK:- Subscribers
    @ObservedObject var imageLoader: ImageLoader
    private let PlaceHolderIamge: UIImage?
    
    init(urls: (urlString: String?, lowResURLString: String?),_ PlaceHolderImage: UIImage? = nil) {
        imageLoader = ImageLoader(urls: urls, errorImage: PlaceHolderImage, loading: true)
        self.PlaceHolderIamge = PlaceHolderImage
    }
    
    var body: some View {
        if imageLoader.loading ?? true {
            imgLoader()
        } else {
            if let image = imageLoader.image {
                Image(uiImage: image)
                    .resizable()
            } else {
                if let PlaceHolderIamge = PlaceHolderIamge {
                    Image(uiImage: PlaceHolderIamge)
                        .resizable()
                }
            }
        }
    }
    
    
    @ViewBuilder func imgLoader() -> some View {
        VStack {
            Spacer()
            
            HStack {
                Spacer()
                
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .black))
                    .scaleEffect(1)
                
                Spacer ()
            }
            
            Spacer()
        }
        .background(Color.gray)
    }

    
}
