//
//  File.swift
//  
//
//  Created by Igor Silva on 17/04/23.
//

import Foundation
import SpriteKit

class PawnScene: ChessScene {
    
    /// Specific method to move pawn in promotion position
    /// - Parameter step: step to promote
    func pawnPromotion(_ step: Int) {
        guard let pawn = board.pieces[6][3] else { return }
        
        switch step {
        case 1:
            pawn.sprite.isHidden = false
            animateMove(piece: pawn, to: (1,3)) {
                pawn.sprite.texture = SKTexture(imageNamed: "pawn_dark")
            }
        case 2:
            animateMove(piece: pawn, to: (1,3)) {
                pawn.sprite.isHidden = false
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    self.animateMove(piece: pawn, to: (0,3)) {
                        pawn.sprite.texture = SKTexture(imageNamed: "queen_dark")
                    }
                }
            }
        default:
            break
        }
 
    }
    
    
    /// Move pawn to general positions
    /// - Parameter step: step specific to move
    func movePawn(_ step: Int) {
        guard let piece = board.pieces[1][4] else { return }
        
        switch step {
        case 1:
            animateMove(piece: piece, to: (1,4))
        case 2:
            animateMove(piece: piece, to: (1,4)) {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                    self.animateMove(piece: piece, to: (2,4))
                }
            }
 
        case 3:
            animateMove(piece: piece, to: (1,4)) {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                    self.animateMove(piece: piece, to: (3,4))
                }
            }
        default:
            break
        }
    
    }
    
}
