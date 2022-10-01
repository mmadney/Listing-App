//
//  ProductDetails.swift
//  listings app
//
//  Created by Madney on 22/06/2022.
//

import SwiftUI

struct ProductDetails: View {
    var product: ProductModel
    var body: some View {
        VStack {
            ImageViewCache(urls: (urlString: product.imageUrls[0], lowResURLString: product.imageUrls[0]))
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .aspectRatio(contentMode: .fit)
                .frame(height: 300)

            VStack {
                Title(text: product.name)

                SubTitle(text: product.price)
            }

            Spacer()

            ScrollView(.horizontal) {
                LazyHStack(spacing: 0) {
                    ForEach(product.imageUrlsThumbnails, id: \.self) { img in
                        ImageViewCache(urls: (urlString: img, lowResURLString: img))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100, height: 100)
                    }
                }
            }
            .padding([.leading, .trailing], 15)
            .frame(height: 100)

            Spacer()
        }
        .navigationBarTitleDisplayMode(.large)
        .navigationTitle(product.name)
        .onAppear {
            print(product.imageUrls[0])
            print(product.imageUrlsThumbnails[0])
        }
    }
}

struct ProductDetails_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetails(product: ProductModel(product: Product(createdAt: "2019-02-24 04:04:17.566515", price: "AED 5", name: "Notebook", uid: "4878bf592579410fba52941d00b62f94", imageIDS: [
            "9355183956e3445e89735d877b798689",
        ], imageUrls: [
            "https://demo-app-photos-45687895456123.s3.amazonaws.com/9355183956e3445e89735d877b798689?AWSAccessKeyId=ASIASV3YI6A477OPR4GR&Signature=LcDjG99pob45q6SeVDhBBbypTtY%3D&x-amz-security-token=IQoJb3JpZ2luX2VjEEYaCXVzLWVhc3QtMSJHMEUCIB1MRzQ6IUAO%2FDWGCxAmuFQzlLHxZNAbVVbq8%2Fzs%2BAppAiEAtT7WcXwpOzbTfjDzkGqqLOHYna4oG6Ofyy%2FEHXoXRyIqlAIIXxADGgwxODQzOTg5NjY4NDEiDOPBUGbFoiPDR5uN1SrxAdB789RHsfqeEB04WeTj8tfo2Am0sPpDC%2FyR5WbB4k13srTS%2B5GOz5Tc2D9%2BJ29nMQJhmpswQZDlogAAognf%2Bvq8keviFF3YTlqAEgNry7U19Tjr7LygyxYx%2FCOQqRGZGUGYMcXhwful4ivZts2sWIKy7xdjCV0Z1SvJDtv3KYelM%2BL2NthG0fifuuxjycIG28%2F7bQxjDJ3pwFXitr4AU4ZrBPbBwwhlwtmoYmBELyDJ8mHlKiUX3ds24ch85EEMIb6tvehqz%2F90lRM2o7FRrZL84gS22zVJEukAh4O7E5SO06TcpLYwuVz5OvuSbM%2Fe3Qsw%2BrbMlQY6mgGoCZwCF4eedodojDepnW7je%2B99ShaZAxfT49r%2B3VSCdnrM6mnQtQiqjDyZt8mvrGQ4vV6yMUCBtWOetcDtENKgMZUk8P6nkqjtPKZG6%2F2TOSLy84VfFPoTJ1mXtl8V3fxYOBTVYpFG71shmLBoOfRKDdvCgH0eAnbKrrItOnlrTdsQ2dYrexWH0xyZ7YWOctD3uib2L%2BigmPKN&Expires=1655908748",
        ], imageUrlsThumbnails: [
            "https://demo-app-photos-45687895456123.s3.amazonaws.com/9355183956e3445e89735d877b798689-thumbnail?AWSAccessKeyId=ASIASV3YI6A477OPR4GR&Signature=u2d4CzaUnrDws4VffCureWGf%2F3A%3D&x-amz-security-token=IQoJb3JpZ2luX2VjEEYaCXVzLWVhc3QtMSJHMEUCIB1MRzQ6IUAO%2FDWGCxAmuFQzlLHxZNAbVVbq8%2Fzs%2BAppAiEAtT7WcXwpOzbTfjDzkGqqLOHYna4oG6Ofyy%2FEHXoXRyIqlAIIXxADGgwxODQzOTg5NjY4NDEiDOPBUGbFoiPDR5uN1SrxAdB789RHsfqeEB04WeTj8tfo2Am0sPpDC%2FyR5WbB4k13srTS%2B5GOz5Tc2D9%2BJ29nMQJhmpswQZDlogAAognf%2Bvq8keviFF3YTlqAEgNry7U19Tjr7LygyxYx%2FCOQqRGZGUGYMcXhwful4ivZts2sWIKy7xdjCV0Z1SvJDtv3KYelM%2BL2NthG0fifuuxjycIG28%2F7bQxjDJ3pwFXitr4AU4ZrBPbBwwhlwtmoYmBELyDJ8mHlKiUX3ds24ch85EEMIb6tvehqz%2F90lRM2o7FRrZL84gS22zVJEukAh4O7E5SO06TcpLYwuVz5OvuSbM%2Fe3Qsw%2BrbMlQY6mgGoCZwCF4eedodojDepnW7je%2B99ShaZAxfT49r%2B3VSCdnrM6mnQtQiqjDyZt8mvrGQ4vV6yMUCBtWOetcDtENKgMZUk8P6nkqjtPKZG6%2F2TOSLy84VfFPoTJ1mXtl8V3fxYOBTVYpFG71shmLBoOfRKDdvCgH0eAnbKrrItOnlrTdsQ2dYrexWH0xyZ7YWOctD3uib2L%2BigmPKN&Expires=1655908749",
        ])))
    }
}
