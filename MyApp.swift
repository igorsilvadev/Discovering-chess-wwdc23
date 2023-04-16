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
                        case .pawn:
                            PawnTutorialView()
                                .environmentObject(navigation)
                        case .aboutChess:
                            AboutChessGameView()
                                .environmentObject(navigation)
                        }
                    }
            }
 
        }
    }
}
