//
//  AboutChessGameView.swift
//  
//
//  Created by Igor Silva on 16/04/23.
//

import SwiftUI

struct AboutChessGameView: View {
    @EnvironmentObject var navigation: NavigationCoordinator
    var body: some View {
        GeometryReader { geometry in
            Image("board_background")
                .resizable()
                .overlay(alignment: .topTrailing) {
                    MessageView(finalText: "O xadrez é jogado em um tabuleiro com\n 64 casas,sendo 32 claras e 32 escuras.", fontSize: .system(size: geometry.size.height * 0.05))
                        .padding(.top, 100)
                        .padding(.trailing, 100)
                }
                .overlay(alignment: .center) {
                    MessageView(finalText: "Cada jogador tem 16 peças, sendo 8 \npeões, 2 cavalos, 2 bispos, 2 torres,\n 1 rainha e 1 rei.", fontSize: .system(size: geometry.size.height * 0.05))
                        .padding(.trailing, 200)
                }
                .overlay(alignment: .bottomTrailing) {
                    NextButton {
                        navigation.pushScene(scene: .pawn)
                    }
                }
            .ignoresSafeArea()
        }
        
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        AboutChessGameView()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
