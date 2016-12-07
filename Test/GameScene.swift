//
//  GameScene.swift
//  Test
//
//  Created by LuanNX on 12/1/16.
//  Copyright © 2016 LuanNX. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    
    
    override func didMove(to view: SKView) {
//        addEnemy(radius:50,angle: CGFloat(M_PI))
//        addEnemy(radius: 50, angle: CGFloat(0))
        //addBackground()
        let frame=Stage()
        frame.config(position: CGPoint(x: 200, y: 200), parent: self)
        
    }
//    func addEnemy(radius: CGFloat,angle: CGFloat){
//        let enemy=EnemyController(texture: Textures.ENEMY)
//        enemy.config(position: midPoint, parent: self,radius:radius,angle:angle)
//        enemy.addFrameNode()
//    }
//    
//    
//    func addBackground(){
//        let background = SKSpriteNode(imageNamed: "background")
//        background.anchorPoint = CGPoint(x: 0, y: 0)
//        background.position = CGPoint(x: 0, y: 0)
//        background.zPosition = -1
//        self.addChild(background)
//        
//    }
  
}
