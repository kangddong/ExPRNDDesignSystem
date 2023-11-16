//
//  ShadowAsset.swift
//  ExUISystem
//
//  Created by 강동영 on 11/16/23.
//

import SwiftUI

struct ShadowAsset {
    var color: Color
    var opacity: Double
    var x: Double
    var y: Double
    var blurRadius: Double
    var spread: Double
}

extension ShadowAsset {
    static let blue32 = ShadowAsset(color: Color(.blue), opacity: 1.0, x: 0.0, y: 0.0, blurRadius: 0.0, spread: 0.0)
}
