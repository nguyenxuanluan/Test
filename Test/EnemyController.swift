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
    static let instance = EnemyController(texture: Textures.CIRCLE)
    init(texture: SKTexture) {
        super.init(view: View(texture: texture,size:CGSize(width: 40, height: 40)))
        view.physicsBody=SKPhysicsBody(texture: texture, size: texture.size())
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
