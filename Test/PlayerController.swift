//
//  PlayerController.swift
//  Test
//
//  Created by Admin on 12/7/16.
//  Copyright © 2016 LuanNX. All rights reserved.
//

import SpriteKit

class PlayerController : Controller {
    
    var firstTouchLocation : CGPoint?
    var currentTouchPosition: CGPoint?
    var gameEnd = false
    
    init() {
        super.init(view: View(color: UIColor.red, size: CGSize(width: 10, height: 10)))
    }
    
    override func config(position: CGPoint, parent: SKNode) {
      
        if !gameEnd {
            super.config(position: position, parent: parent)
            configParticle()
            configPhysics()
        }
        
        
    }
    
    func configPhysics(){
        let texture=SKTexture(imageNamed: "point")
        view.physicsBody=SKPhysicsBody(texture: texture, size: texture.size())
        view.physicsBody?.categoryBitMask = PLAYER_MASK
        view.physicsBody?.contactTestBitMask=ENEMY_MASK
        view.physicsBody?.collisionBitMask=0
        view.hanleContact = {
            otherView in
            otherView.removeFromParent()
            print("BOom")
        }
    }
    
    func touchesBegan(location: CGPoint) {
        if self.firstTouchLocation == nil {
            
            self.firstTouchLocation = location
            
        }
    }
    
    func touchesMoved(location: CGPoint) {
       
        self.currentTouchPosition  = location
    }
    
    func touchesEnded() {
     
        self.gameEnd = true
       
        self.view.removeFromParent()
    }
    
    func move(vector: CGVector){
        view.position = view.position.add(vector: vector)
    }
    
    func configParticle(){
        let particle=SKEmitterNode(fileNamed: "fire")
        particle?.position=CGPoint(x: 0, y: 0)
        particle?.name="rainParticle"
        particle?.targetNode=parent.scene
        particle?.particleTexture=SKTexture(imageNamed: "spark")
        view.addChild(particle!)
    }
    
}