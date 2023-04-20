//
//  Board.swift
//  DiscoveringChess
//
//  Created by Igor Silva on 15/04/23.
//

import Foundation
import SpriteKit

class Board {
    var pieces: [[Piece?]] = []
    

    init(initPieces: Bool = true) {
        initBoard()
        if initPieces {
            addPiecesFor(player: .light)
            addPiecesFor(player: .dark)
        }
    }
    
    
    /// Create board
    func initBoard() {
        var newBoard: [[Piece?]] = []
        for row in GlobalDefinitions.boardRange {
            newBoard.append([])
            for _ in GlobalDefinitions.boardRange {
                newBoard[row].append(nil)
            }
        }
        pieces = newBoard
    }
    
    /// Add pieces in chess format
    /// - Parameter player: must be light or dark pieces
    func addPiecesFor(player: PlayerType) {
        let kingRowPieces: [PieceType] = [.rook, .knight, .bishop, .queen, .king, .bishop, .knight, .rook]
        for index in 0..<8 {
            let pawn = Piece(belongsTo: player, type: .pawn, tile: (player == .light ? 1 : 6, index))
            let piece = Piece(belongsTo: player, type: kingRowPieces[index], tile: (player == .light ? 0 : 7, index))
            addPiece(pawn, at: pawn.tile)
            addPiece(piece, at: piece.tile)
        }
    }
    
    
    func addPiece(_ piece: Piece, at tile: Tile) {
        pieces[tile.0][tile.1] = piece;
    }
    
}
