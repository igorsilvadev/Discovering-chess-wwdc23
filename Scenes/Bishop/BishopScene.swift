//
//  BishopScene.swift
//  
//
//  Created by Igor Silva on 19/04/23.
//

import Foundation

class BishopScene: ChessScene {
    private let darkBishopPositions = [(0,2),(3,5)]
    private let lightBishopPosition = [2: (0,5), 3: (4,1)]
    
    func hideMidPawns() {
        guard let first = board.board[1][3], let second = board.board[1][4] else { return }
        first.sprite.isHidden = true
        second.sprite.isHidden = true
    }
    
    func moveBishop(_ step: Int) {
        if let bishop = board.board[0][2], let position = darkBishopPositions[safe: step - 1] {
            animateMove(piece: bishop, to: position)
        }
        
        if let lightBishop = board.board[0][5], let position = lightBishopPosition[step] {
            animateMove(piece: lightBishop, to: position)
        }
    }
    
}
