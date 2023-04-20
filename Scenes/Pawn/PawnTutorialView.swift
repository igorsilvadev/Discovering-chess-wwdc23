import SwiftUI
import SpriteKit

struct PawnTutorialView: View {
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
                        .overlay(alignment: .topLeading) {
                            if step > 0 {
                                MessageView(finalText: "Os peões só podem se mover para frente, uma casa de cada vez, exceto no seu primeiro movimento, quando pode mover duas casas.", fontSize: .system(size: geometry.size.height * 0.05))
                                    .padding(.top, 100)
                                    .padding(.leading, 100)
                                    .padding(.trailing, 100)
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
                                        scene.movePawn(step)
                                    }
                                }
                            }
                            
                            ActionButton(image: "next_button") {
                                if step <= 3 {
                                    step = step + 1
                                }
                                scene.movePawn(step)
                                switch step {
                                case 4:
                                    navigation.pushScene(scene: .pawnPromotion)
                                    step = 3
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
                    scene.hidePieces(showPieces: [.pawn], color: [.light])
                }
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}
