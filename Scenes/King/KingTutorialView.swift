//
//  KingTutorialView.swift
//  
//
//  Created by Igor Silva on 19/04/23.
//

import SwiftUI
import SpriteKit

struct KingTutorialView: View {
    
    @StateObject  var scene = KingScene(size: CGSize(width: 320, height: 320))
    @State private var step = 1
    @EnvironmentObject var navigation: NavigationCoordinator
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color.gray
                    .ignoresSafeArea()
                VStack(spacing: 0) {
                    SpriteView(scene: scene)
                        .overlay(alignment: .center) {
                            if step > 0 {
                                MessageView(finalText: "The king is the most important piece and must be protected at all costs. The king can move in any direction, but only one square at a time.", fontSize: .system(size: geometry.size.height * 0.04))
                                    .padding(.top, 50)
                                    .padding([.leading, .trailing], 30)
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
                                        scene.moveKing(step)
                                    }
                                }
                            }
                            
                            ActionButton(image: "next_button") {
                                if step <= 4 {
                                    step = step + 1
                                }
                                scene.moveKing(step)
                                switch step {
                                case 4:
                                    step -= 1
                                    navigation.pushScene(scene: .final)
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
                    scene.hidePieces(showPieces: [.king], color: [.dark])
                    scene.kingSetupPieces(canSetup: step == 1)
                }
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}

