//
//  GlobalDefinitions.swift
//  DiscoveringChess
//
//  Created by Igor Silva on 15/04/23.
//

import Foundation
import SpriteKit

struct GlobalDefinitions {
    static let tileSize: Int = 40
    static let spriteSize = CGSize(width: 40, height: 40)
    static let spriteOffset: Int = 20
    static let boardWidth = 8
    static let boardRange = 0..<8
    static let tileRange = 0..<64
    static let invalidTile = (-1, -1)
    static let moveSpeed = 0.25
    static let moveColor = SKColor(red: 0, green: 0, blue: 1, alpha: 0.3)
    static let checkColor = SKColor(red: 1, green: 0, blue: 0, alpha: 0.3)
    static let darkTile = SKColor(red: 209 / 255, green: 139 / 255, blue: 71 / 255, alpha: 1)
    static let lightTile = SKColor(red: 255 / 255, green: 206 / 255, blue: 158 / 255, alpha: 1)
    static let boardZPosition: CGFloat = 1
    static let checkHintZPosition: CGFloat = 2
    static let pieceZPosition: CGFloat = 3
    static let hintZPosition: CGFloat = 4
    static let initialDepth: Int = 1
    static let easyDepth: Int = 1
    static let normalDepth: Int = 2
    static let hardDepth: Int = 3
    static let impossibleDepth: Int = 4
    static let initialAlpha: Int = -10000
    static let initialBeta: Int = 10000
}
