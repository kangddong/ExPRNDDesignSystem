//
//  InformationBox.swift
//  ExUISystem
//
//  Created by 강동영 on 11/17/23.
//

import SwiftUI

struct InformationBox: View {
    // 사용자 정의 레이블에 표시될 텍스트
    var title: String
    var iconAsset: ImageAsset
    var titleColor: ColorAsset = .brandPrimary
    var iconColor: ColorAsset = .brandPrimary
    var borderInfo: (color: Color, width: CGFloat) = (.black, 1.0)
    
    @ViewBuilder var content: () -> Text
    
    var body: some View {
        VStack(alignment: .leading, spacing: nil, content: {
            
            HStack(alignment: .center, spacing: 10, content: {
                Icon(image: Image(systemName: "info.circle.fill"))
//                Icon(image: iconAsset.toImage())
                    .environment(\.iconSize, IconSize.medium)
                    .environment(\.icontTint, iconColor)
                    .environment(\.renderingMode, .hierarchical)
                
                Text(title)
                    .font(.headline) // 헤드라인 스타일의 폰트를 사용하거나 필요에 따라 변경
                    .padding()
//                    .foregroundColor(titleColor.toColor())
                
            })
            .foregroundColor(.blue)
            
            content()
        })
        .foregroundColor(.black)
    }
}

struct InformationBoxModifier: ViewModifier {
    
    var style: InformationBoxStyle
    
    func body(content: Content) -> some View {
        content
            .foregroundColor(style.titleColor.toColor())
            .background(style.frameStyle.color.0)
            .border(style.frameStyle.color.0, width: 1.0)
    }
    
    
}

extension InformationBox {
    func informationBoxStyle(_ style: InformationBoxStyle) -> some View {
        modifier(InformationBoxModifier(style: style))
    }
}

struct InformationBoxStyle {
    enum InfomationState {
        case boxSuccess(radius: CGFloat)
        case boxWarning(radius: CGFloat)
        case boxHighlight(radius: CGFloat)
        case boxCaution(radius: CGFloat)
        
        var color: (Color, CGFloat) {
            switch self {
            case .boxSuccess(let radius):
                return (Color(.blue), radius)
            case .boxWarning(let radius):
                return (Color(.yellow), radius)
            case .boxHighlight(let radius):
                return (Color(.pink), radius)
            case .boxCaution(let radius):
                return (Color(.red), radius)
            }
        }
    }
    
    var titleColor: ColorAsset
    var iconColor: ColorAsset
    var frameStyle: InformationBoxStyle.InfomationState
}

#Preview {
    InformationBox(title: "참고", iconAsset: .icInfoInfomation) {
        Text("제가 첫 순서라 얼마나 다행인지 몰라요 빨리 끝내고 다음 세션 들어야징!")
    }
}
