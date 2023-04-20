import SwiftUI

@main
struct StartApp: App {
    @StateObject var navigation = NavigationCoordinator()
    var body: some Scene {
        WindowGroup {
            
            NavigationStack(path: $navigation.path) {
                IntroView()
                    .environmentObject(navigation)
                    .navigationDestination(for: SceneType.self) { scene in
                        switch scene {
                        case .pawnTutorial:
                            PawnTutorialView()
                                .environmentObject(navigation)
                        case .aboutChess:
                            AboutChessGameView()
                                .environmentObject(navigation)
                        case .pawnPromotion:
                            PawnPromotionView()
                                .environmentObject(navigation)
                        case .knightTutorial:
                            KnightTutorialView()
                                .environmentObject(navigation)
                        case .bishopTutorial:
                            BishopTutorialView()
                                .environmentObject(navigation)
                        case .rookTutorial:
                            RookTutorialView()
                                .environmentObject(navigation)
                        case .queenTutorial:
                            QueenTutorialView()
                                .environmentObject(navigation)
                        case .kingTutorial:
                            KingTutorialView()
                                .environmentObject(navigation)
                        case .final:
                            FinalView()
                                .environmentObject(navigation)
                        }
                    }
            }
 
        }
    }
}
