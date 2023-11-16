//
//  FontAsset.swift
//  ExUISystem
//
//  Created by 강동영 on 11/16/23.
//

import UIKit
import SwiftUI

struct FontAsset {
    /// FontFamily / Weight / Bundle / 확장자 (ex. otf, ttf..) 등
    var config: FontConfig
    /// 크기
    var size: CGFloat
    /// 행간
    var leading: Leading?
    
    struct FontConfig {
    }
    
    struct Leading {
    }
}

extension FontAsset {
    static let bold = FontAsset(config: FontConfig(), size: 10.0)
    static let header3 = FontAsset(config: FontConfig(), size: 10.0)
    static let body1 = FontAsset(config: FontConfig(), size: 10.0)
}

extension UIFont {
    enum AssetName: String{
        case body1
        
        var name: String {
            switch self {
            case .body1:
                return "body1"
            }
        }
        
        var size: CGFloat {
            switch self {
            case .body1:
                return 20.0
            }
        }
    }
    
    static func asset(_ type: AssetName) -> UIFont {
        return UIFont(name: type.name, size: type.size)!
    }
}

extension Text {
    func fontAsset(_ font: FontAsset) -> Text {
        return self
    }
}

