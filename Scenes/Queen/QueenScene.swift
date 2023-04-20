//
//  QueenScene.swift
//  
//
//  Created by Igor Silva on 19/04/23.
//

import Foundation

class QueenScene: ChessScene {
    
    private let positions = [(7,3), (5, 3), (5, 6), (2,3), (5,3), (3,1)]
    
    func moveQueen(_ step: Int) {
        guard let queen = board.board[7][3], let position = positions[safe: step - 1] else { return }
        animateMove(piece: queen, to: position)
    }
    
    
}
