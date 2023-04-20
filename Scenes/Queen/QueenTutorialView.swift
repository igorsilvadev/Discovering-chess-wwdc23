//
//  QueenTutorialView.swift
//  
//
//  Created by Igor Silva on 19/04/23.
//

import SwiftUI
import SpriteKit

struct QueenTutorialView: View {
    
    @StateObject  var scene = QueenScene(size: CGSize(width: 320, height: 320))
    @State private var step = 1
    @EnvironmentObject var navigation: NavigationCoordinator
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color.gray
                    .ignoresSafeArea()
                VStack(spacing: 0) {
                    SpriteView(scene: scene)
                        .overlay(alignment: .bottom) {
                            if step > 0 {
                                MessageView(finalText: "The queen can move in any direction.", fontSize: .system(size: geometry.size.height * 0.05))
                                    .padding(.bottom, 50)
                            }
                        }
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
                                        scene.moveQueen(step)
                                    }
                                }
                            }
                            
                            ActionButton(image: "next_button") {
                                if step <= 6 {
                                    step = step + 1
                                }
                                scene.moveQueen(step)
                                switch step {
                                case 7:
                                    step -= 1
                                    navigation.pushScene(scene: .kingTutorial)
                                default:
                                    break
                                }
                            }
                        }
                    }
                    .frame(height: geometry.size.height * 0.25)
                }
                .ignoresSafeArea()
                .onAppear {
                    scene.hidePieces(showPieces: [.knight, .bishop, .rook, .queen], color: [.dark])
                }
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}
