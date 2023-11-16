//
//  UIFont+.swift
//  ExUISystem
//
//  Created by 강동영 on 11/17/23.
//

import UIKit.UIFont

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
