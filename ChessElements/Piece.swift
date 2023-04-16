//
//  Piece.swift
//  DiscoveringChess
//
//  Created by Igor Silva on 15/04/23.
//

import Foundation
import SpriteKit

enum PlayerType: String {
    case light, dark

    var opposite: PlayerType { (self == .light) ? .dark : .light }
    
    mutating func toggle() {
        self = self.opposite
    }
}


enum PieceType: String {
    case pawn, rook, knight, bishop, king, queen
}

class Piece: Equatable, Identifiable {
    static func == (lhs: Piece, rhs: Piece) -> Bool {
        lhs.sprite == rhs.sprite
    }
    
    var moveCount: Int = 0
    var type: PieceType
    var sprite: SKSpriteNode
    var player: PlayerType
    var value: Int = 0
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
        value = pieceValue(type: type, player: player)
    }
    
    init(_ existingPiece: Piece) {
        moveCount = existingPiece.moveCount
        type = existingPiece.type
        sprite = existingPiece.sprite
        player = existingPiece.player
        value = existingPiece.value
        canTakeEnPassant = existingPiece.canTakeEnPassant
        tile = existingPiece.tile
    }
    
    func copy() -> Piece { Piece(self) }
    
    private func pieceValue(type: PieceType, player: PlayerType) -> Int {
        let value: Int
        switch type {
        case .pawn:
            value = 1
        case .knight, .bishop:
            value = 3
        case .rook:
            value = 5
        case .queen:
            value = 9
        case .king:
            value = 999
        }
        return player == .light ? value : -value
    }
}
