import SwiftUI

@main
struct MyApp: App {
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
                        }
                    }
            }
 
        }
    }
}
