//
//  FirstSceneView.swift
//  DiscoveringChess
//
//  Created by Igor Silva on 16/04/23.
//

import SwiftUI

struct IntroView: View {
    @State var step = 0
    @EnvironmentObject var navigation: NavigationCoordinator
    var body: some View {
        GeometryReader { geometry in
            Image("board_background")
                .resizable()
                    .overlay(alignment: .topLeading) {
                        if step > 0 {
                            MessageView(finalText: "Olá, hoje você irá aprender como jogar xadrez!", fontSize: .system(size: geometry.size.height * 0.05))
                                .padding(.top, 100)
                                .padding(.leading, 60)
                        }
          
                    }
                    .overlay(alignment: .center) {
                        if step > 1 {
                            MessageView(finalText: "O xadrez é um jogo muito divertido que pode ajudar a melhorar o seu pensamento estratégico e sua habilidade de tomar decisões.", fontSize: .system(size: geometry.size.height * 0.05))
                                .padding(.top, 100)
                                .padding([.trailing, .leading], 100)
                        }
                    }
                    .overlay(alignment: .bottomTrailing) {
                        NextButton {
                            step = step + 1
                            if step > 2 {
                                navigation.pushScene(scene: .aboutChess)
                            }
                        }
                    }
                    .ignoresSafeArea()
                    .onAppear {
                        step = 1
                }
        }
        
    }
}

extension String {
    subscript(offset: Int) -> Character {
        self[index(startIndex, offsetBy: offset)]
    }
}

struct FirstSceneView_Previews: PreviewProvider {
    static var previews: some View {
        IntroView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
