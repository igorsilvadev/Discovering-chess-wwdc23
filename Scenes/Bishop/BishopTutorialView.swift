//
//  SwiftUIView.swift
//  
//
//  Created by Igor Silva on 19/04/23.
//

import SwiftUI
import SpriteKit

struct BishopTutorialView: View {
    @StateObject  var scene = BishopScene(size: CGSize(width: 320, height: 320))
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
                                MessageView(finalText: "Os bispos só podem se mover na diagonal.", fontSize: .system(size: geometry.size.height * 0.05))
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
                                        scene.moveBishop(step)
                                    }
                                }
                            }
                            
                            ActionButton(image: "next_button") {
                                if step <= 3 {
                                    step = step + 1
                                }
                                scene.moveBishop(step)
                                switch step {
                                case 4:
                                    step -= 1
                                    navigation.pushScene(scene: .rookTutorial)
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
                    scene.hidePieces(showPieces: [.knight, .pawn, .bishop], color: [.light])
                    scene.hideMidPawns()
                }
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}

struct BishopTutorialView_Previews: PreviewProvider {
    static var previews: some View {
        BishopTutorialView()
    }
}
