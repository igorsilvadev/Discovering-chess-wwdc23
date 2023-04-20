//
//  RookScene.swift
//  
//
//  Created by Igor Silva on 19/04/23.
//

import Foundation

class RookScene: ChessScene {
    
    private let positions = [(0,0), (4,0), (4, 3)]
    
    func rookStartPosition() {
        guard let pawn = board.pieces[1][0] else { return }
        pawn.sprite.isHidden = true
    }
    
    func moveRook(_ step: Int) {
        guard let rook = board.pieces[0][0], let position = positions[safe: step - 1] else { return }
        animateMove(piece: rook, to: position)
    }
    
}
