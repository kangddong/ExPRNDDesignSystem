//
//  EnvironmentKey.swift
//  ExUISystem
//
//  Created by 강동영 on 11/17/23.
//

import SwiftUI

// key 정의
private struct IconTintEnvironmentKey: EnvironmentKey {
    static let defaultValue = ColorAsset(named: "pink", bundle: .main, alpha: 1.0)
}

private struct IconSizeEnvironmentKey: EnvironmentKey {
    static let defaultValue = IconSize.medium
}

private struct RenderingModeEnvironmentKey: EnvironmentKey {
    static let defaultValue = SymbolRenderingMode.hierarchical
}

// value 정의
extension EnvironmentValues {
    var icontTint: ColorAsset {
        get { self[IconTintEnvironmentKey.self] }
        set { self[IconTintEnvironmentKey.self] = newValue }
    }
    
    var iconSize: IconSize {
        get { self[IconSizeEnvironmentKey.self] }
        set { self[IconSizeEnvironmentKey.self] = newValue }
    }
    
    var renderingMode: SymbolRenderingMode {
        get { self[RenderingModeEnvironmentKey.self] }
        set { self[RenderingModeEnvironmentKey.self] = newValue }
    }
}
