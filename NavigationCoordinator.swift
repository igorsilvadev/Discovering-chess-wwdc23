//
//  NavigationCoordinator.swift
//  DiscoveringChess
//
//  Created by Igor Silva on 16/04/23.
//

import Foundation
import SwiftUI


enum SceneType: Hashable {
    case pawnTutorial
    case pawnPromotion
    case aboutChess
    case knightTutorial
    case bishopTutorial
    case rookTutorial
    case queenTutorial
    case kingTutorial
    case final
}

class NavigationCoordinator: ObservableObject {
    
    @Published var path: [SceneType] = []
    
    
    /// Present a new scene
    /// - Parameter scene: scene type to present
    func pushScene(scene: SceneType) {
        path.append(scene)
    }
    
    /// Remove scene from stack
    func popScene() {
        path.removeLast()
    }
    
    /// Back to app start
    func goToRoot() {
        path = []
    }
    
    
}
