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

        let frame=Stage2(size: CGSize(width: self.frame.width, height: self.frame.height/2))
        frame.config(position: CGPoint(x: 0, y: self.frame.height), parent: self)
        
    }
   
    func addBackground(){
        let background = SKSpriteNode(imageNamed: "background")
        background.anchorPoint = CGPoint(x: 0, y: 0)
        background.position = CGPoint(x: 0, y: 0)
        background.zPosition = -1
        self.addChild(background)
        
    }
  
}
