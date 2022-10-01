//
//  EndPoint.swift
//  listings app
//
//  Created by Madney on 22/06/2022.
//

import Foundation

protocol Endpoint {
    var base: String { get }
    var path: String { get }
}

extension Endpoint {
    var urlComponents: URLComponents {
        var components = URLComponents(string: base)!
        components.path = path
        return components
    }

    var request: URLRequest {
        let url = urlComponents.url!
        return URLRequest(url: url)
    }
}
