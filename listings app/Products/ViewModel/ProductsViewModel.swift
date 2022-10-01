//
//  ProductsViewModel.swift
//  listings app
//
//  Created by Madney on 22/06/2022.
//

import Combine
import Foundation

final class ProductsViewModel: ObservableObject {
    private var cancellable: AnyCancellable?
    @Published var products: [ProductModel] = []
    private let client = ProductApi()
    @Published private(set) var isLoading = true
    @Published var error : String?

    init() { getProducts() }

    func getProducts() {
        isLoading = true
        cancellable = client.getProducts(.getProducts)
            .sink(receiveCompletion: { [weak self] result in
                      guard let self = self else { return }
                      self.isLoading = false
                      switch result {
                      case .failure(let error):
                          self.error = error.localizedDescription
                      case .finished:
                          print("Finished")
                      }
                  },
                  receiveValue: {
                      self.products = $0.results.map { ProductModel(product: $0) }
                  })
    }
}
