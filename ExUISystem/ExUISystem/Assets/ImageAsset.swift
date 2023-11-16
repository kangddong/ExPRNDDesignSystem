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
//    static let image: ImageAsset.Format(fileExtension: "assets") {
//        UIImage(named: $0.named, in: $0.bundle, with: nil)!
//    }
    
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

extension ImageAsset {
    static let sampleImage = ImageAsset("sample_image", in: .designSystem, format: .image)
    static let sampleAnimatedImage = ImageAsset("sample_gif", in: .designSystem, format: .gif)
}

extension UIImage {
    enum AssetName: String{
        case arrowUpWhite
    }
    
//    static func asset(_ type: AssetName) -> ImageAsset {
//        let imageName = type.rawValue
//        
//        return ImageAsset(imageName, in: .designSystem, format: .image)
//    }
    
    static func asset(_ type: AssetName) -> UIImage {
        let imageName = type.rawValue
        
        return UIImage(named: imageName, in: .main, with: nil)!
    }
    
    static func gif(data: Data) -> UIImage {
        return UIImage(data: data)!
    }
}

// TODO: - Bundle Initializer
extension Bundle {
    static var designSystem: Bundle {
        Bundle()
    }
}
