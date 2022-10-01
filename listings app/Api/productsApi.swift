//
//  productsClient.swift
//  listings app
//
//  Created by Madney on 22/06/2022.
//

import Combine
import Foundation

enum ProductsNetwork {
    case getProducts
}

extension ProductsNetwork: Endpoint {
    var base: String {
        return "https://ey3f2y0nre.execute-api.us-east-1.amazonaws.com"
    }

    var path: String {
        switch self {
        case .getProducts: return "/default/dynamodb-writer"
        }
    }
}

final class ProductApi: CombineAPI {
    let session: URLSession

    init(configuration: URLSessionConfiguration) {
        session = URLSession(configuration: configuration)
    }

    convenience init() {
        self.init(configuration: .default)
    }

    func getProducts(_ feedKind: ProductsNetwork) -> AnyPublisher<Products, Error> {
        execute(feedKind.request, decodingType: Products.self, retries: 2)
    }
}
