//
//  ChessScene.swift
//  DiscoveringChess
//
//  Created by Igor Silva on 15/04/23.
//

import Foundation
import SpriteKit
                  //Line, Col
typealias Tile = (Int, Int)

enum ChessSceneMode {
    case pawnTutorial
}

class ChessScene: SKScene, ObservableObject {
    
    var board = Board()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(size: CGSize) {
        super.init(size: size)
        scaleMode = .fill
        resetGame()
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    func resetGame() {
        removeAllChildren()
        board = Board()
        drawChessGrid()
        drawChessPieces()
    }
    

    
    func drawChessGrid(forImage: Bool = true) {
        for tileNo in GlobalDefinitions.tileRange {
            let tile = squareNode(
                at: (tileNo % GlobalDefinitions.boardWidth, tileNo / GlobalDefinitions.boardWidth),
                color: tileColor(tileNo: tileNo, forImage: forImage)
            )
            tile.zPosition = GlobalDefinitions.boardZPosition
            addChild(tile)
        }
    }
    
    private func tileColor(tileNo: Int, forImage: Bool) -> SKColor {
        return (tileNo + (tileNo / GlobalDefinitions.boardWidth)) % 2 == 0 ? GlobalDefinitions.darkTile : GlobalDefinitions.lightTile
    }
    
    private func drawChessPieces() {
        for row in GlobalDefinitions.boardRange {
            for column in GlobalDefinitions.boardRange {
                board.board[row][column]?.sprite.position = CGPoint(
                    x: column * GlobalDefinitions.tileSize + GlobalDefinitions.spriteOffset,
                    y: row * GlobalDefinitions.tileSize + GlobalDefinitions.spriteOffset
                )
                if board.board[row][column] != nil {
                    addChild(board.board[row][column]!.sprite)
                }
            }
        }
    }
    
    
    
    func hidePieces(hide: Bool = true, showPieces: [PieceType], color: [PlayerType]) {
        guard hide else { return }
        board.board.forEach { rows in
             rows.forEach { piece in
                 piece?.sprite.isHidden = !showPieces.contains(piece?.type ?? .none) || !color.contains(piece?.player ?? .none)
             }
         }
    }
    
    func animateMove(piece: Piece, to: Tile, completion: @escaping () -> Void = {}) {
        piece.sprite.run(moveAnimation(to: CGPoint(
            x: to.1 * GlobalDefinitions.tileSize + GlobalDefinitions.spriteOffset,
            y: to.0 * GlobalDefinitions.tileSize + GlobalDefinitions.spriteOffset
        )), completion: completion)
    }
    
    
    private func locationToTile(_ location: CGPoint) -> Tile {
        (Int(floor(location.y / CGFloat(GlobalDefinitions.tileSize))),
                Int(floor(location.x / CGFloat(GlobalDefinitions.tileSize))))
    }
    
    private func moveAnimation(to point: CGPoint) -> SKAction {
        let moveAction = SKAction.move(to: point, duration: GlobalDefinitions.moveSpeed)
        moveAction.timingMode = SKActionTimingMode.easeInEaseOut
        return moveAction
    }
    
    private func squareNode(at tile: Tile, color: SKColor) -> SKShapeNode {
        let squareNode = SKShapeNode(
            rect: CGRect(
                x: tile.1 * GlobalDefinitions.tileSize,
                y: tile.0 * GlobalDefinitions.tileSize,
                width: GlobalDefinitions.tileSize,
                height: GlobalDefinitions.tileSize)
        )
        squareNode.fillColor = color
        squareNode.strokeColor = .clear
        return squareNode
    }
    
}
