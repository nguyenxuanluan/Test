//
//  PlayerController.swift
//  Test
//
//  Created by Admin on 12/7/16.
//  Copyright © 2016 LuanNX. All rights reserved.
//

import SpriteKit
import UIKit


class PlayerController : Controller {
    
    var firstTouchLocation : CGPoint?
    var currentTouchPosition: CGPoint?
    var gameEnd = false
    init() {
        super.init(view: View(color: UIColor.clear, size: CGSize(width: 10, height: 10)))
           }
    
    override func config(position: CGPoint, parent: SKNode) {
        
        if !gameEnd {
            super.config(position: position, parent: parent)
            configParticle()
            configPhysics()
            handleEvent()
            //configConstrains()
        }
        
        
    }
    func configConstrains(){
        let xRange=SKRange(lowerLimit: 0, upperLimit: parent.frame.size.width)
        let yRange=SKRange(lowerLimit: 0, upperLimit: parent.frame.size.height)
        self.view.constraints=[SKConstraint.positionX(xRange),SKConstraint.positionY(yRange)]
    }
    func handleEvent(){
        
        view.hanleContact = {
            otherView in
            if ( otherView.physicsBody?.categoryBitMask != SHIELD_MASK){
            otherView.removeFromParent()
            print("BOom")
            self.configExplosion()
            self.particleEffect()
            }
            otherView.removeFromParent()
        }
        view.handleShile = {
            self.configShield(shield: true)
        }
    }
    func configPhysics()  {
        let texture=SKTexture(imageNamed: "point")
        view.physicsBody=SKPhysicsBody(texture: texture, size: texture.size())

        view.physicsBody?.categoryBitMask = PLAYER_MASK
        view.physicsBody?.contactTestBitMask = ENEMY_MASK | SHIELD_MASK
        view.physicsBody?.collisionBitMask=0
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
    var status : Mirror?
    func configParticle(){
        let particle=SKEmitterNode(fileNamed: "fire")
        particle?.position=CGPoint(x: 0, y: 0)
        particle?.name="rainParticle"
        particle?.targetNode=parent.scene
        particle?.particleTexture=SKTexture(imageNamed: "spark")
        status=particle.customMirror
        view.addChild(particle!)
    }
    func configExplosion(){
        let explosion = SKAction.playSoundFileNamed("goSound.mp3", waitForCompletion: false)
        self.view.run(explosion)
    }
     var count = 5
    var timer = Timer()
    let shieldNode = SKSpriteNode(texture: Textures.SHIELD, size: CGSize(width: 20, height: 20))

    func configShield(shield: Bool){
        if shield {
            view.physicsBody = nil
            addShield()
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateCount), userInfo: nil, repeats: true)
        }
        
    }
    func particleEffect(){
        let particle = SKEmitterNode(fileNamed: "explosion.sks")
        particle?.position = self.position
        let add=SKAction.run{self.parent.addChild(particle!)}
        let remove = SKAction.run{particle?.removeFromParent()}
        parent.run(.sequence([add,.wait(forDuration: 1),remove]))
        
    }
    func addShield(){
                shieldNode.position = CGPoint(x: (parent.frame.size.width - 30), y: (parent.frame.size.height - 30))
        parent.addChild(shieldNode)
            }
     @objc func updateCount() {
        if count > 0 {
           count -= 1
            print(count)
        } else {
            configPhysics()
            shieldNode.removeFromParent()
            timer.invalidate()
        }
    }
    
}
