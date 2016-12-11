//
//  ShieldController.swift
//  Test
//
//  Created by LuanNX on 12/10/16.
//  Copyright © 2016 LuanNX. All rights reserved.
//

import Foundation
import SpriteKit
class ShiledConroller: Controller {
    let SPEED: CGFloat = 100
    init() {
        super.init(view: View(texture: Textures.SHIELD))
        view.size = CGSize(width: 30, height: 30)
    }
    override func config(position: CGPoint, parent: SKNode) {
        super.config(position: position, parent: parent)
        configPhysics()
        configMove()  
    }
    func configPhysics(){
        view.physicsBody = SKPhysicsBody(texture: Textures.SHIELD, size: view.size)
        view.physicsBody?.categoryBitMask = SHIELD_MASK
        view.physicsBody?.contactTestBitMask = PLAYER_MASK
        view.physicsBody?.collisionBitMask = 0
        view.hanleContact = {
            other in
            self.view.removeFromParent()
            other.handleShile?()
        }
        
    }
    func configMove(){
        let moveAction = SKAction.moveToBottom(position: self.view.position, speed: SPEED)
        let moveAndRemove = SKAction.sequence([moveAction,.removeFromParent()])
        view.run(moveAndRemove)
        
    }
   
}
