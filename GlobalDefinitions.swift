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
    static let moveSpeed = 0.25
    static let darkTile = SKColor(red: 209 / 255, green: 139 / 255, blue: 71 / 255, alpha: 1)
    static let lightTile = SKColor(red: 255 / 255, green: 206 / 255, blue: 158 / 255, alpha: 1)
    static let boardZPosition: CGFloat = 1
    static let pieceZPosition: CGFloat = 3
}
