//
//  KingScene.swift
//  
//
//  Created by Igor Silva on 19/04/23.
//

import Foundation

class KingScene: ChessScene {
    
    private let kingPositions = [(7,4),(6,3), (7,3)]
    private let lightQueenPositions = [(7,6), (6,6), (7,5)]
    
    /// Creates king´s check position
    /// - Parameter canSetup: true if can move queen to position
    func kingSetupPieces(canSetup: Bool = false) {
        
        guard let lightQueen = board.pieces[0][3] else { return }
        if canSetup {
            animateMove(piece: lightQueen, to: (7,6))
        }
        lightQueen.sprite.isHidden = false

    }
    
    /// Move king to positions
    /// - Parameter step: step to setup position
    func moveKing(_ step: Int) {
        guard let king = board.pieces[7][4], let queen = board.pieces[0][3],
              let kingposition = kingPositions[safe: step - 1],
              let queenPosition = lightQueenPositions[safe: step - 1]  else { return }
        animateMove(piece: king, to: kingposition) {
            self.animateMove(piece: queen, to: queenPosition)
        }
    }
   
}
