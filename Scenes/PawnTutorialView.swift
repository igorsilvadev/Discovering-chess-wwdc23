import SwiftUI
import SpriteKit

struct PawnTutorialView: View {
    var scene = ChessScene(size: CGSize(width: 320, height: 320), sceneMode: .pawnTutorial)
    @State private var canReset = false
    var body: some View {
        GeometryReader { geometry in 
            ZStack {
                SpriteView(scene: scene)
                    .overlay(alignment: .topLeading) {
                        MessageView(finalText: "Os peões só podem se mover para frente, uma casa de cada vez, exceto no seu primeiro movimento, quando pode mover duas casas.", fontSize: .system(size: geometry.size.height * 0.05))
                            .padding(.top, 100)
                            .padding(.leading, 100)
                            .padding(.trailing, 100)
                    }
                    .overlay(alignment: .bottomTrailing) {
                        VStack {
                            Spacer()
                            if canReset {
                                ActionButton(title: "Restart", titleFont: .system(size: geometry.size.height * 0.05)) {
                                    scene.resetGame()
                                    scene.showOnlyLightPawns()
                                    canReset = false
                                }
                            }
                            if !canReset {
                                ActionButton(title: "Move", titleFont: .system(size: geometry.size.height * 0.05)) {
                                    scene.movePawn()
                                    canReset = true
                                }
                                ActionButton(title: "Move 2", titleFont: .system(size: geometry.size.height * 0.05)) {
                                    scene.movePawn(isTwoTile: true)
                                    canReset = true
                                }
                            }
                            
                            NextButton {
                                
                            }
                            Spacer()
                        }
                       
                    }
                    .ignoresSafeArea()
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}
