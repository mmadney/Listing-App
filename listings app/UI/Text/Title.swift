//
//  Title.swift
//  listings app
//
//  Created by Madney on 22/06/2022.
//

import SwiftUI

struct Title: View {
    var text: String
    var body: some View {
        Text(text)
            .font(.headline)
            .fontWeight(.bold)
            .foregroundColor(Color.black)
    }
}

struct Title_Previews: PreviewProvider {
    static var previews: some View {
        Title(text: "")
    }
}
