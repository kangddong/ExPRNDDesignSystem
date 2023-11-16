//
//  ColorAsset.swift
//  ExUISystem
//
//  Created by 강동영 on 11/16/23.
//

import UIKit
import SwiftUI

struct ColorAsset {
    enum ColorType {
        case literal
        case asset(named: String, bundler: Bundle?)
    }
    
    var red: Double
    var green: Double
    var blue: Double
    var alpha: Double
    var colorType: ColorType
    
    init(red: Double, green: Double, blue: Double, alpha: Double, colorType: ColorType = .literal) {
        self.red = red
        self.green = green
        self.blue = blue
        self.alpha = alpha
        self.colorType = colorType
    }
    
    init(named: String, bundle: Bundle, alpha: Double) {
        self.red = 0.0
        self.green = 0.0
        self.blue = 0.0
        self.alpha = alpha
        self.colorType = ColorType.asset(named: named, bundler: bundle)
    }
    
    init(hex: String, alpha: Double = 0.0, colorType: ColorType = .literal) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")
        
        var rgb: UInt64 = 0
        
        let result = Scanner(string: hexSanitized).scanHexInt64(&rgb)
        
        self.red = Double((rgb & 0xFF0000) >> 16) / 255.0
        self.green = Double((rgb & 0x00FF00) >> 8) / 255.0
        self.blue = Double(rgb & 0x0000FF) / 255.0
        self.alpha = alpha
        self.colorType = colorType
    }
}

extension ColorAsset {
    // TODO: - What is Primary? May I think Initializer
    static let primary: ColorAsset = ColorAsset(hex: "")
    static let successDark: ColorAsset = ColorAsset(hex: "")
    static let warningPrimary: ColorAsset = ColorAsset(hex: "")
    static let brandPrimary: ColorAsset = ColorAsset(hex: "")
    static let cautionPrimary: ColorAsset = ColorAsset(hex: "")
}
extension ColorAsset {
    func toColor() -> Color {
        return Color(red: self.red, green: self.green, blue: self.blue)
    }
    
    func toUIColor() -> UIColor {
        return UIColor(red: self.red, green: self.green, blue: self.blue, alpha: self.alpha)
    }
    
    // TODO: - NSColor
//    func toNSColor() -> NSColor {
//        
//    }
}
