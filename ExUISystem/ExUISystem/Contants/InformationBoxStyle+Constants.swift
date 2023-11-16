//
//  InformationBoxStyle+Constants.swift
//  ExUISystem
//
//  Created by 강동영 on 11/17/23.
//

import Foundation

extension InformationBoxStyle {
    public static let success = InformationBoxStyle(
        titleColor: .successDark,
        iconColor: .successDark,
        frameStyle: .boxSuccess(radius: .zero)
    )
    
    public static let warning = InformationBoxStyle(
        titleColor: .warningPrimary,
        iconColor: .warningPrimary,
        frameStyle: .boxWarning(radius: .zero)
    )
    
    public static let highlight = InformationBoxStyle(
        titleColor: .brandPrimary,
        iconColor: .brandPrimary,
        frameStyle: .boxHighlight(radius: .zero)
    )
    
    public static let caution = InformationBoxStyle(
        titleColor: .cautionPrimary,
        iconColor: .cautionPrimary,
        frameStyle: .boxCaution(radius: .zero)
    )
}
