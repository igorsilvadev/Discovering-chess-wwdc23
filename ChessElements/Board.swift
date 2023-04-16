//
//  Board.swift
//  DiscoveringChess
//
//  Created by Igor Silva on 15/04/23.
//

import Foundation
import SpriteKit

class Board {
    var board: [[Piece?]] = []
    var player1Pieces: [Piece] = []
    var player2Pieces: [Piece] = []
    var player1King: Piece?
    var player2King: Piece?
    var enPassantPiece: Piece?
    

    init(initPieces: Bool = true) {
        initBoard()
        if initPieces {
            addPiecesFor(player: .light)
            addPiecesFor(player: .dark)
        }
    }
    
    func copy() -> Board {
        let boardCopy = Board(initPieces: false)
        for piece in player1Pieces + player2Pieces {
            let pieceCopy = piece.copy()
            boardCopy.addPiece(pieceCopy, at: pieceCopy.tile)
            if pieceCopy.type == .king {
                if pieceCopy.player == .light {
                    boardCopy.player1King = pieceCopy
                } else {
                    boardCopy.player2King = pieceCopy
                }
            }
            if enPassantPiece != nil && enPassantPiece == pieceCopy {
                boardCopy.enPassantPiece = pieceCopy
            }
        }
        return boardCopy
    }
    
    func initBoard() {
        var newBoard: [[Piece?]] = []
        for row in GlobalDefinitions.boardRange {
            newBoard.append([])
            for _ in GlobalDefinitions.boardRange {
                newBoard[row].append(nil)
            }
        }
        board = newBoard
    }

    func addPiecesFor(player: PlayerType) {
        let kingRowPieces: [PieceType] = [.rook, .knight, .bishop, .queen, .king, .bishop, .knight, .rook]
        for index in 0..<8 {
            let pawn = Piece(belongsTo: player, type: .pawn, tile: (player == .light ? 1 : 6, index))
            let piece = Piece(belongsTo: player, type: kingRowPieces[index], tile: (player == .light ? 0 : 7, index))
            addPiece(pawn, at: pawn.tile)
            addPiece(piece, at: piece.tile)
            if kingRowPieces[index] == .king {
                if player == .light {
                    player1King = piece
                } else {
                    player2King = piece
                }
            }
        }
    }
    
    
    
    func addPiece(_ piece: Piece, at tile: Tile) {
        if piece.player == .light {
            player1Pieces.append(piece)
        } else {
            player2Pieces.append(piece)
        }
        board[tile.0][tile.1] = piece;
    }
    
    private func setEnPassantStatus(for piece: Piece, from: Tile, to: Tile) {
        if piece.type == .pawn && abs(from.0 - to.0) == 2 {
            piece.canTakeEnPassant = true
            enPassantPiece = piece
        }
    }
    
    private func resetEnPassantStatus() {
        enPassantPiece?.canTakeEnPassant = false
    }
    

}
