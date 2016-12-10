//
//  Stage9.swift
//  Test
//
//  Created by Admin on 12/10/16.
//  Copyright © 2016 LuanNX. All rights reserved.
//

import SpriteKit
class Stage9 : Frame{
    
    override func configAction() {
        view.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
        
        addEnemy1(position: CGPoint(x: -70, y: 0 ), startPoint: CGPoint(x: -70, y: 100), endPoint: CGPoint(x: -70, y: -100))
        addEnemy1(position: CGPoint(x: -23, y: 0 ), startPoint: CGPoint(x: -23, y: -100), endPoint: CGPoint(x: -23, y: 100))
        addEnemy1(position: CGPoint(x: 70, y: 0), startPoint: CGPoint(x: 70, y: 100), endPoint: CGPoint(x: 70, y: -100))
        addEnemy1(position: CGPoint(x: 23, y: 0), startPoint: CGPoint(x: 23, y: -100), endPoint:  CGPoint(x: 23, y: 100))
       
   
        
    }
    
    func addEnemy1(position: CGPoint, startPoint: CGPoint, endPoint: CGPoint){
        let enemy = EnemyController(texture: Textures.SQUARE, resize: 3)
        enemy.config(position: position, parent: self.view)
        enemy.view.moveToAndReverse(startPoint: startPoint, endPoint: endPoint)
    }
    
}
