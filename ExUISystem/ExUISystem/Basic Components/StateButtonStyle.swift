//
//  StateButtonStyle.swift
//  ExUISystem
//
//  Created by 강동영 on 11/16/23.
//

import SwiftUI
import UIKit

struct StateButtonStyle: ButtonStyle {
    var backgroundColor: Color
    var foregroundColor: Color
    var buttonSize: ButtonSize
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
            .background(backgroundColor)
            .foregroundColor(foregroundColor)
            .cornerRadius(8)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(foregroundColor, lineWidth: 2)
            )
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
    }
    
    init(buttonSize: ButtonSize) {
        self.backgroundColor = .white
        self.foregroundColor = .white
        self.buttonSize = buttonSize
    }
    
    init(backgroundColor: Color, foregroundColor: Color) {
        self.backgroundColor = backgroundColor
        self.foregroundColor = foregroundColor
        self.buttonSize = ButtonSize(iconStyle: IconStyle(), fontSize: 10, insets: EdgeInsets())
    }
    
    func style(_ buttonConfigure: StateButtonConfigure, for state: UIButton.State) -> StateButtonStyle {
        
        return StateButtonStyle(buttonSize: ButtonSize(iconStyle: IconStyle(), fontSize: 10, insets: EdgeInsets()))
    }
}

extension UIButton.State {
    static var pressed: UIControl.State = .selected
}

extension StateButtonStyle {
    static func primary(_ buttonSize: ButtonSize) -> StateButtonStyle {
        StateButtonStyle(buttonSize: buttonSize)
            .style(
                StateButtonConfigure(fontConfig: .bold, foreground: Color(.white), background: Color(.black), shadow: .blue32),
                for: .normal
            )
            .style(
                StateButtonConfigure(fontConfig: .bold, foreground: Color(.white), background: Color(.dark)),
                for: .pressed
            )
            .style(
                StateButtonConfigure(fontConfig: .bold, foreground: Color(.gray4), background: Color(.gray)),
                for: .disabled
            )
        // 각 State에 따른 Configuration을 주입할 수 있게 해둠
    }
    
    static func textGray6(_ buttonSize: ButtonSize) -> StateButtonStyle {
        StateButtonStyle(buttonSize: buttonSize)
            .style(
                StateButtonConfigure(fontConfig: .bold, foreground: Color(.white), background: Color(.black), shadow: .blue32),
                for: .normal
            )
            .style(
                StateButtonConfigure(fontConfig: .bold, foreground: Color(.white), background: Color(.dark)),
                for: .pressed
            )
            .style(
                StateButtonConfigure(fontConfig: .bold, foreground: Color(.gray4), background: Color(.gray)),
                for: .disabled
            )
        // 각 State에 따른 Configuration을 주입할 수 있게 해둠
    }
    
//    static func dark(_ buttonSize: ButtonSize) -> StateButtonStyle {}
//    static func warning(_ buttonSize: ButtonSize) -> StateButtonStyle {}
//    static func white(_ buttonSize: ButtonSize) -> StateButtonStyle {}
}

struct StateButtonConfigure {
    var fontConfig: FontAsset
    var foreground: Color
    var background: Color
    var shadow: ShadowAsset?
}

struct ButtonSize {
    var iconStyle: IconStyle
    var fontSize: CGFloat
    var minWidth: CGFloat?
    var minHeight: CGFloat?
    var insets: EdgeInsets
}

extension ButtonSize {
    static let large = ButtonSize(iconStyle: IconStyle(), fontSize: 1.0, insets: EdgeInsets())
}

struct IconStyle {
}
