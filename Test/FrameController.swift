//
//  FrameController.swift
//  Test
//
//  Created by LuanNX on 12/10/16.
//  Copyright © 2016 LuanNX. All rights reserved.
//

import Foundation
import SpriteKit
class FrameController {
    let TIME_DURATION:Double = 4
    weak var parent: SKNode!
    init(parent: SKNode) {
        self.parent = parent
    }
    func addArrayofStage() ->[SKAction]{
    let runStage1 = SKAction.run {
        let frameNode = Stage1(size: CGSize(width: self.parent.frame.width, height: self.parent.frame.height/2))
        frameNode.config(position: CGPoint(x: self.parent.frame.width/2, y: self.parent.frame.height), parent: self.parent, speed: Speed.SM_SPEED)

    }
    let runStage2 = SKAction.run {
        let frameNode = Stage2(size: CGSize(width: self.parent.frame.width, height: self.parent.frame.height/4))
        frameNode.config(position: CGPoint(x: 0, y: self.parent.frame.height), parent: self.parent, speed: Speed.SM_SPEED)
        
    }
    let runStage3 = SKAction.run {
        let frameNode1 = Stage3(size: CGSize(width: self.parent.frame.width, height: self.parent.frame.height/2))
        frameNode1.config(position: CGPoint(x: self.parent.frame.width/2, y: self.parent.frame.height), parent: self.parent, speed: Speed.SM_SPEED)
        
    }
    let runStage4 = SKAction.run {
        let frameNode1 = Stage4(size: CGSize(width: self.parent.frame.width, height: self.parent.frame.height/2))
        frameNode1.config(position: CGPoint(x: self.parent.frame.width/2, y: self.parent.frame.height), parent: self.parent, speed: Speed.SM_SPEED)
        
    }
    
    let runStage5 = SKAction.run{
            let frameNode = Stage5(size: CGSize(width: self.parent.frame.width, height: self.parent.frame.height/2))
            frameNode.config(position: CGPoint(x: self.parent.frame.width/2, y: self.parent.frame.height), parent: self.parent, speed: Speed.LAR_SPEED)
    }
    let runStage6 = SKAction.run{
            let frameNode = Stage6(size: CGSize(width: self.parent.frame.width, height: self.parent.frame.height/2))
            frameNode.config(position: CGPoint(x: self.parent.frame.width/2, y: self.parent.frame.height), parent: self.parent, speed: Speed.SM_SPEED)
    }
        var stageArr = [SKAction]()
        stageArr=[runStage1,runStage2,runStage3,runStage4,runStage5,runStage6]
        return stageArr
    }
    
    func runRandomStage(){
        let stageArr = addArrayofStage()
        let spawnFrame = SKAction.run {
            let random = Int(arc4random_uniform(6))
            self.parent.run(stageArr[random])
        }
        self.parent.run(.repeatForever(.sequence([spawnFrame,.wait(forDuration: TIME_DURATION )])))
        
    }


}
