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
}


enum PieceType: String {
    case pawn, rook, knight, bishop, king, queen, none
}

class Piece: Identifiable {

    var type: PieceType
    var sprite: SKSpriteNode
    var player: PlayerType
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
}
