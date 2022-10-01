//
//  Loader.swift
//  listings app
//
//  Created by Madney on 22/06/2022.
//


import SwiftUI

struct Loader: View {
    var body: some View {
        VStack {
            Spacer()
            
            HStack {
                Spacer()
                
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .black))
                    .scaleEffect(2)
                
                Spacer()
            }
            
            Spacer()
        }
        
    }
}

struct Loader_Previews: PreviewProvider {
    static var previews: some View {
        Loader()
    }
}
