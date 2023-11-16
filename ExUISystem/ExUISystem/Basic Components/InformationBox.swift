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
    var iconAsset: Image = Image(systemName: "42.circle")
    @ViewBuilder var content: () -> Text
    
    var body: some View {
        VStack(alignment: .leading, spacing: nil, content: {
            HStack(alignment: .center, spacing: 10, content: {
                Icon(image: Image(systemName: "42.circle"))
                    .environment(\.iconSize, IconSize.large)
                    .environment(\.icontTint, Color(.blue))
                    .environment(\.renderingMode, .hierarchical)
                
                Text(title)
                    .font(.headline) // 헤드라인 스타일의 폰트를 사용하거나 필요에 따라 변경
                    .padding()
                    .foregroundColor(.black)
            })
            
            content()
        })
        .border(.black)
    }
}

extension InformationBox {
    func informationBoxStyle(_ style: InformationBoxStyle) -> InformationBox {
        return self
    }
}

struct InformationBoxStyle {
    enum InfomationState {
        case boxSuccess(radius: CGFloat)
        case boxWarning(radius: CGFloat)
        case boxHighlight(radius: CGFloat)
        case boxCaution(radius: CGFloat)
    }
    
    var titleColor: ColorAsset
    var iconColor: ColorAsset
    var frameStyle: InformationBoxStyle.InfomationState
}

#Preview {
    InformationBox(title: "참고", iconAsset: Image(systemName: "42.circle")) {
        Text("제가 첫 순서라 얼마나 다행인지 몰라요 빨리 끝내고 다음 세션 들어야징!")
    }
}
