//
//  RookTutorialView.swift
//  
//
//  Created by Igor Silva on 19/04/23.
//

import SwiftUI
import SpriteKit

struct RookTutorialView: View {
    
    @StateObject  var scene = RookScene(size: CGSize(width: 320, height: 320))
    @State private var step = 1
    @EnvironmentObject var navigation: NavigationCoordinator
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color.gray
                    .ignoresSafeArea()
                VStack(spacing: 0) {
                    SpriteView(scene: scene)
                        .overlay(alignment: .top) {
                            if step > 0 {
                                MessageView(finalText: "Rooks can only move forward, backward, or sideways.", fontSize: .system(size: geometry.size.height * 0.05))
                                    .padding(70)
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
                                        scene.moveRook(step)
                                    }
                                }
                            }
                            
                            ActionButton(image: "next_button") {
                                if step <= 3 {
                                    step = step + 1
                                }
                                scene.moveRook(step)
                                switch step {
                                case 4:
                                    step -= 1
                                    navigation.pushScene(scene: .queenTutorial)
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
                    scene.hidePieces(showPieces: [.knight, .pawn, .bishop, .rook], color: [.light])
                    scene.rookStartPosition()
                }
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}

struct RookTutorialView_Previews: PreviewProvider {
    static var previews: some View {
        RookTutorialView()
    }
}
