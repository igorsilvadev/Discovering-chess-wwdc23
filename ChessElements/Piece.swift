//
//  Piece.swift
//  DiscoveringChess
//
//  Created by Igor Silva on 15/04/23.
//

import Foundation
import SpriteKit

enum PlayerType: String {
    case light, dark, none

    var opposite: PlayerType { (self == .light) ? .dark : .light }
    
    mutating func toggle() {
        self = self.opposite
    }
}


enum PieceType: String {
    case pawn, rook, knight, bishop, king, queen, none
}

class Piece: Equatable, Identifiable {
    static func == (lhs: Piece, rhs: Piece) -> Bool {
        lhs.sprite == rhs.sprite
    }
    
    var moveCount: Int = 0
    var type: PieceType
    var sprite: SKSpriteNode
    var player: PlayerType
    var canTakeEnPassant: Bool = false
    var tile: Tile
    
    init(
        belongsTo player: PlayerType,
        type: PieceType,
        tile: Tile
    ) {
        self.type = type
        sprite = SKSpriteNode(imageNamed: "\(type.rawValue)_\(player == .light ? "light" : "dark")")
        sprite.zPosition = GlobalDefinitions.pieceZPosition
        sprite.size = GlobalDefinitions.spriteSize
        self.player = player
        self.tile = tile
    }
    
    init(_ existingPiece: Piece) {
        moveCount = existingPiece.moveCount
        type = existingPiece.type
        sprite = existingPiece.sprite
        player = existingPiece.player
        canTakeEnPassant = existingPiece.canTakeEnPassant
        tile = existingPiece.tile
    }
    
    func copy() -> Piece { Piece(self) }
}
