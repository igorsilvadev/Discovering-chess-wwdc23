//
//  AboutChessGameView.swift
//  
//
//  Created by Igor Silva on 16/04/23.
//

import SwiftUI

struct AboutChessGameView: View {
    @EnvironmentObject var navigation: NavigationCoordinator
    @State private var step = 0
    
    init() {
        UINavigationBar.setAnimationsEnabled(false)
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color.gray
                    .ignoresSafeArea()
                VStack(spacing: 0){
                    Image("board_background")
                        .resizable()
                        .overlay(alignment: .topTrailing) {
                            if step >= 0 {
                                MessageView(finalText: "O xadrez é jogado em um tabuleiro com\n 64 casas,sendo 32 claras e 32 escuras.", fontSize: .system(size: geometry.size.height * 0.05))
                                    .padding(.top, 100)
                                    .padding(.trailing, 100)
                            }
                        }
                        .overlay(alignment: .center) {
                            if step >= 1 {
                                MessageView(finalText: "Cada jogador tem 16 peças, sendo 8 \npeões, 2 cavalos, 2 bispos, 2 torres,\n 1 rainha e 1 rei.", fontSize: .system(size: geometry.size.height * 0.05))
                                    .padding(.trailing, 200)
                            }
                        }
                    .ignoresSafeArea()
                    ZStack {
                        Rectangle()
                            .fill(.clear)
                        HStack {
                            ActionButton(image: "back_button") {
                                if step == 0 {
                                    navigation.popScene()
                                } else {
                                    if step > 0 {
                                        step = step - 1
                                    }
                                }
                            }
                            ActionButton(image: "next_button") {
                                if step <= 2 {
                                    step = step + 1
                                }
                                if step >= 2 {
                                    navigation.pushScene(scene: .pawnTutorial)
                                }
                            }
                        }
                    }
                    .frame(height: geometry.size.height * 0.25)
                }
            }
            .navigationBarBackButtonHidden(true)
        }
        
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        AboutChessGameView()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
