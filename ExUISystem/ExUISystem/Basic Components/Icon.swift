//
//  Icon.swift
//  ExUISystem
//
//  Created by 강동영 on 11/17/23.
//

import SwiftUI

struct Icon: View {
    @Environment(\.icontTint) var iconTint
    @Environment(\.iconSize) var iconSize
    @Environment(\.renderingMode) var renderingMode
    
    var image: Image
    var tintColor: Color?
    
    var body: some View {
        image
            .resizable()
            .frame(width: iconSize.width, height: iconSize.height)
            .symbolRenderingMode(renderingMode)
            .foregroundColor(iconTint)
    }
}

struct IconSize {
    var width: CGFloat
    var height: CGFloat
}

#Preview {
    Icon(iconTint: .init(\.icontTint), iconSize: .init(\.iconSize), renderingMode: .init(\.renderingMode), image: Image(systemName: "square.and.arrow.up.fill"), tintColor: nil)
}

