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
    var leading2: Leading1?
    
    init(_ config: FontConfig, fixedSize: CGFloat, leading: Leading? = nil, leading2: Leading1? = nil) {
        self.config = config
        self.size = fixedSize
        self.leading = leading
        self.leading2 = leading2
    }
    // TODO: - FontConfig
    struct FontConfig {
        static let bold = FontConfig()
        static let regular = FontConfig()
    }
    
    // FIXME: - What choose one ?
    enum Leading1 {
        case lineHeight(_ height: CGFloat)
    }
    
    struct Leading {
        static func lineHeight(_ height: CGFloat) {}
    }
}
