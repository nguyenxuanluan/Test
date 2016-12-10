//
//  Stage2.swift
//  Test
//
//  Created by LuanNX on 12/7/16.
//  Copyright © 2016 LuanNX. All rights reserved.
//

import Foundation
import SpriteKit
class Stage2: Frame {
    override func configAction() {
        
        let midPoint1=CGPoint(x: self.view.frame.width/2, y: -100)
        let midPoint2=CGPoint(x: self.view.frame.width/2, y: -130)
        view.anchorPoint=CGPoint(x: 0, y: 1)
        let run=SKAction.sequence([.run(addEnemy),.wait(forDuration: 1)])
            view.run(.repeat(run, count: 4))
        
        addEnemy2(position:midPoint1.add(x: -10, y: 0),startPoint: CGPoint(x: 00, y: 0), endPoint: CGPoint(x: -100, y: 0))
        addEnemy2(position:midPoint1.add(x: 10, y: 0),startPoint: CGPoint(x: 0, y: 0), endPoint: CGPoint(x: 100, y: 0))
        addEnemy2(position:midPoint2.add(x: -10, y: 0),startPoint: CGPoint(x: 00, y: 0), endPoint: CGPoint(x: -100, y: 0))
        addEnemy2(position:midPoint2.add(x: 10, y: 0),startPoint: CGPoint(x: 0, y: 0), endPoint: CGPoint(x: 100, y: 0))
    }
    func addEnemy() {
        let enemy=EnemyController(texture: Textures.SQUARE, resize: 5)
        //let origin=CGPoint(x: 0, y: -200)
        let origin=CGPoint(x: enemy.witdth/2, y: -200)
        let size=CGSize(width: self.parent.frame.width-enemy.witdth, height: 200)
        
        
        enemy.config(position: CGPoint(x:0 , y: 0), parent: self.view)
        enemy.view.moveRec(origin: origin, size: size)
    }
    func addEnemy2(position: CGPoint,startPoint: CGPoint, endPoint: CGPoint){
            let enemy=EnemyController(texture: Textures.SQUARE ,resize: 5)
            enemy.config(position: position, parent: self.view)
            enemy.view.moveToAndReverse(startPoint: startPoint, endPoint: endPoint)
        }
}
