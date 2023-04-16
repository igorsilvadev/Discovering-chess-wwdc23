//
//  NavigationCoordinator.swift
//  DiscoveringChess
//
//  Created by Igor Silva on 16/04/23.
//

import Foundation
import SwiftUI


enum SceneType: Hashable {
    case pawn
    case aboutChess
}

class NavigationCoordinator: ObservableObject {
    
    @Published var path: [SceneType] = []
    
    func pushScene(scene: SceneType) {
        path.append(scene)
    }
    
    func popScene() {
        path.removeLast()
    }
    
    func goToRoot() {
        path = []
    }
    
    
}
