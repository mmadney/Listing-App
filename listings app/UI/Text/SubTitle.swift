//
//  SubTitle.swift
//  listings app
//
//  Created by Madney on 22/06/2022.
//

import SwiftUI

struct SubTitle: View {
    var text: String
    var body: some View {
        Text(text)
            .font(.subheadline)
            .fontWeight(.light)
            .foregroundColor(Color.black)
    }
}

struct SubTitle_Previews: PreviewProvider {
    static var previews: some View {
        SubTitle(text: "")
    }
}
