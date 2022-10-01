//
//  LazyNavgationView.swift
//  listings app
//
//  Created by Madney on 22/06/2022.
//

import Foundation
import SwiftUI

struct LazyNavigationView<Content: View>: View {
    let build: () -> Content
    
    init(_ build: @autoclosure @escaping () -> Content) {
        self.build = build
    }
    
    var body: Content {
        build()
    }
}
