//
//  LetUsGoView.swift
//  ExUISystem
//
//  Created by 강동영 on 11/16/23.
//

import SwiftUI

struct LetUsGoView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            
            Image(.ghost)
                .resizable()
                .frame(width: 32, height: 32)
            
            Text("let us: Go! 2023 가을\n즐기고 계신가요?")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .fontAsset(.header3)
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
            })
            VStack(alignment: .leading, spacing: 16) {
                Text("뒷풀이 메뉴가 뭔지 너무 궁금하군요")
                    .fontAsset(.body1)
                Label(
                    title: { Text("Label") },
                    icon: { Image(systemName: "42.circle") }
                )
                
//                InformationBox(
//                    title: "참고",
//                    iconAsset: .icInfoInfomation
//                ) {
//                    Text("제가 첫 순서라 얼마나 다행인지 몰라요 빨리 끝내고 다음 세션 들어야징!")
//                        .fontAsset(.body1)
//                }
//                .informationBoxStyle(.success)
                
                InformationBox(
                    title: "참고",
                    iconAsset: Image(systemName: "42.circle")
                ) {
                    Text("제가 첫 순서라 얼마나 다행인지 몰라요 빨리 끝내고 다음 세션 들어야징!")
                        .fontAsset(.body1)
                }
                .informationBoxStyle(.success)
                
                Button(action: {}) {
                    Text("네! 재밌습니다")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(StateButtonStyle.primary(.large))

                Button(action: {}) {
                    Text("아뇨. 재미가 하나도 없어요.")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(StateButtonStyle.textGray6(.large))
                .disabled(true)
                
            }
        }
//        .foreGroundColor(Color(.basePrimary))
    }
}

#Preview {
    LetUsGoView()
}
