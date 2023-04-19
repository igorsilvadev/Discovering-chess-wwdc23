//
//  PawnPromotion.swift
//  
//
//  Created by Igor Silva on 17/04/23.
//

import SwiftUI
import SpriteKit

struct PawnPromotionView: View {
    @StateObject var scene = PawnScene(size: CGSize(width: 320, height: 320))
    @EnvironmentObject var navigation: NavigationCoordinator
    @State private var step = 1
    
    init() {
        UINavigationBar.setAnimationsEnabled(false)
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color.gray
                    .ignoresSafeArea()
                VStack(spacing: 0) {
                    SpriteView(scene: scene)
                        .overlay(alignment: .center) {
                            if step > 0 {
                                MessageView(finalText: "Quando um peão chega ao final do tabuleiro, ele pode se transformar em uma peça mais poderosa, como uma rainha.", fontSize: .system(size: geometry.size.height * 0.05))
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
                                        scene.pawnPromotion(step)
                                    }
                                }
                            }
                            
                            ActionButton(image: "next_button") {
                                if step <= 2 {
                                    step = step + 1
                                }
                                scene.pawnPromotion(step)
                                switch step {
                                case 3:
                                    step = 2
                                    navigation.pushScene(scene: .aboutChess)
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
                    scene.hidePieces(hide: step == 1)
                }
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}

struct PawnPromotionView_Previews: PreviewProvider {
    static var previews: some View {
        PawnPromotionView()
    }
}
