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
                                    MessageView(finalText: "Hi, I would love to teach you how to play chess!", fontSize: .system(size: geometry.size.height * 0.05))
                                        .padding(.top, 100)
                                        .padding(.leading, 60)
                                }
                  
                            }
                            .overlay(alignment: .center) {
                                if step > 1 {
                                    MessageView(finalText: "Chess is a very fun game that can help improve your strategic thinking and decision-making skills.", fontSize: .system(size: geometry.size.height * 0.05))
                                        .padding(.top, 100)
                                        .padding([.trailing, .leading], 100)
                                }
                            }
                            .ignoresSafeArea()
                    ZStack {
                        Rectangle()
                            .fill(.clear)
                        HStack {
                            ActionButton(image: "back_button") {
                                if step > 0 {
                                    step = step - 1
                                }
                            }
                            .disabled(step <= 1)
                            .opacity(step > 1 ? 1 : 0.2)
                            
                            ActionButton(image: "next_button") {
                                if step <= 2 {
                                    step = step + 1
                                }
                                if step > 2 {
                                    navigation.pushScene(scene: .aboutChess)
                                    step = step - 1
                                }
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
