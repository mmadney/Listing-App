//
//  ContentView.swift
//  listings app
//
//  Created by Madney on 22/06/2022.
//

import SwiftUI

struct ProductsView: View {
    @StateObject var viewModel = ProductsViewModel()
    @State var Selectproduct: ProductModel?

    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                if viewModel.isLoading {
                    Loader()
                } else {
                    if let error = viewModel.error {
                        DisplayError(error: error)
                    } else  {
                        ScrollView {
                            ForEach(self.viewModel.products, id: \.self) { product in
                                NavigationLink(destination: LazyNavigationView(ProductDetails(product: product))) {
                                    ProductItem(product: product)
                                        .padding([.leading, .trailing], 15)
                                }
                            }
                        }
                        .padding(.top, 20)
                    }
                }
            }
            .navigationBarTitleDisplayMode(.large)
            .navigationTitle("Products")
        }
    }

    func ProductItem(product: ProductModel) -> some View {
        VStack {
            HStack(spacing: 10) {
                ImageViewCache(urls: (urlString: product.imageUrls[0], lowResURLString: product.imageUrls[0]))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)

                HStack(spacing: 5) {
                    VStack(alignment: .leading) {
                        Title(text: "Name:")
                        Title(text: "price:")
                    }

                    VStack(alignment: .leading) {
                        SubTitle(text: product.name)
                        SubTitle(text: product.price)
                    }
                }

                Spacer()
            }

            Divider()
                .frame(height: 2)
        }
    }
    
    func DisplayError(error: String) -> some View {
        VStack(alignment: .center) {
            Text(error)
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ProductsView()
    }
}
