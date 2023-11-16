//
//  ImageAsset.swift
//  ExUISystem
//
//  Created by 강동영 on 11/16/23.
//

import UIKit
import SwiftUI

struct ImageAsset {
    var named: String
    var bundle: Bundle
    var format: Format
    
    struct Format {
        let fileExtension: String
        let convert: (ImageAsset) -> NSObjectProtocol
    }
    
    init(_ named: String, in bundle: Bundle, format: Format) {
        self.named = named
        self.bundle = bundle
        self.format = format
    }
}

extension ImageAsset {
    func toImage() -> Image {
        return Image(self.named, bundle: self.bundle)
    }
    
    func toUIImage() -> UIImage {
        return UIImage(named: named, in: bundle, with: nil)!
    }
}

// assets 기본 구현
extension ImageAsset.Format {
    static let image = ImageAsset.Format(fileExtension: "assets") {
        UIImage(named: $0.named, in: $0.bundle, with: nil)!
    }
    
    static let gif = ImageAsset.Format(fileExtension: "gif") {
        guard let fileURL = $0.bundle.url(forResource: $0.named, withExtension: "gif"),
              let gifData = try? Data(contentsOf: fileURL) else {
            fatalError("Failed to convert file to object")
        }
        // animatedImage로 custom 된 object로 변환
        return UIImage.gif(data: gifData)
    }
}
