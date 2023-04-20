//
//  KnightScene.swift
//  
//
//  Created by Igor Silva on 18/04/23.
//

import Foundation

class KnightScene: ChessScene {
    
    private let positions = [(0,1),(2,2), (4, 1)]
    
    /// Move Knight to positions
    /// - Parameter step: step position 
    func moveKnight(_ step: Int) {
        guard let knight = board.pieces[0][1], let position = positions[safe: step - 1] else { return }
        animateMove(piece: knight, to: position)
    }
    
    
}
