//
//  EnemyController.swift
//  Test
//
//  Created by LuanNX on 12/1/16.
//  Copyright © 2016 LuanNX. All rights reserved.
//

import SpriteKit
class EnemyController:Controller {
    let SPEED:CGFloat=100
    init(texture: SKTexture,resize: CGFloat) {
        let newWidth = texture.size().width/resize
        let newHeight = texture.size().height/resize
        super.init(view: View(texture: texture,size:CGSize(width: newWidth, height: newHeight)))
        view.physicsBody=SKPhysicsBody(texture: texture, size: CGSize(width: newWidth, height: newHeight))
        view.physicsBody?.categoryBitMask=ENEMY_MASK
        view.physicsBody?.contactTestBitMask=PLAYER_MASK
        view.physicsBody?.collisionBitMask=0
        
        view.hanleContact = {
            otherView in
            otherView.removeFromParent()
            
            print("contact")
        }
}
    
}

