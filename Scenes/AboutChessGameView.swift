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
                                MessageView(finalText: "Chess is played on a board with 64 squares, \n32 light-colored and 32 dark-colored.", fontSize: .system(size: geometry.size.height * 0.05))
                                    .padding(.top, 100)
                                    .padding(.trailing, 100)
                            }
                        }
                        .overlay(alignment: .center) {
                            if step >= 1 {
                                MessageView(finalText: "Each player has 16 pieces, consisting of 8 pawns,\n 2 knights, 2 bishops, 2 rooks, 1 queen, and 1 king.", fontSize: .system(size: geometry.size.height * 0.05))
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
