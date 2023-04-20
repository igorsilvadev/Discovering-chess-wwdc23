//
//  SwiftUIView.swift
//  
//
//  Created by Igor Silva on 19/04/23.
//

import SwiftUI

struct FinalView: View {
    @State var step = 1
    @EnvironmentObject var navigation: NavigationCoordinator
    
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
                        .overlay(alignment: .topLeading) {
                            if step > 0 {
                                MessageView(finalText: "Now that you know how each piece moves, the objective of the game is to capture your opponent's king. \nTo do this, you need to carefully plan your moves so that you can capture your opponent's pieces and eventually reach the king.", fontSize: .system(size: geometry.size.height * 0.04))
                                    .padding(.top, 30)
                                    .padding([.leading, .trailing], 50)
                            }
                            
                        }
                        .overlay(alignment: .center) {
                            if step > 1 {
                                MessageView(finalText: "But be careful! If your king is in danger, you need to protect it immediately or you will lose the game..", fontSize: .system(size: geometry.size.height * 0.04))
                                    .padding(.top, 100)
                                    .padding([.trailing, .leading], 100)
                            }
                        }
                        .overlay(alignment: .bottom) {
                            if step > 2 {
                                MessageView(finalText: "Now you are ready to play chess! Remember to have fun and always think before making your moves. Good luck!", fontSize: .system(size: geometry.size.height * 0.04))
                                    .padding(.bottom, 30)
                                    .padding([.trailing, .leading], 100)
                            }
                        }
                        .ignoresSafeArea()
                    ZStack {
                        Rectangle()
                            .fill(.clear)
                        HStack {
                            ActionButton(image: "back_button") {
                                if step == 1 {
                                    navigation.popScene()
                                } else {
                                    if step > 1 {
                                        step = step - 1
                                    }
                                }
                            }
                            
                            ActionButton(image: step > 2 ? "restart_button" : "next_button" ) {
                                if step > 2 {
                                    navigation.goToRoot()
                                }
                                step += 1
                            }
                        }
                    }
                    .frame(height: geometry.size.height * 0.25)
                    
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}
