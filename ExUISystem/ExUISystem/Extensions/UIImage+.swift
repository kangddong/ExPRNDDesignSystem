//
//  UIImage+.swift
//  ExUISystem
//
//  Created by 강동영 on 11/17/23.
//

import UIKit.UIImage

extension UIImage {
    enum AssetName: String{
        case arrowUpWhite
    }
    
    static func asset(_ type: AssetName) -> UIImage {
        let imageName = type.rawValue
        
        return ImageAsset(imageName, in: .designSystem, format: .image).toUIImage()
    }
    
    static func gif(data: Data) -> UIImage {
        return UIImage(data: data)!
    }
}
