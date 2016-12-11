//
//  Stage8.swift
//  Test
//
//  Created by Admin on 12/10/16.
//  Copyright © 2016 LuanNX. All rights reserved.
//

import SpriteKit
class Stage8 : Frame {
    
    override func configAction() {
        addEnemy(position: CGPoint(x: -100, y: 100), radius: 50, angle: CGFloat(-M_PI_2))
        addEnemy(position: CGPoint(x: -100, y: 100), radius: 50, angle: CGFloat(M_PI_2))
        
        addEnemy(position: CGPoint(x: 100, y: 100), radius: 50, angle: CGFloat(M_PI_2))
        addEnemy(position: CGPoint(x: 100, y: 100), radius: 50, angle: CGFloat(-M_PI_2))
    }
    
    func addEnemy(position: CGPoint, radius: CGFloat,angle: CGFloat){
        let enemy = EnemyController(texture: Textures.CIRCLE, resize: 3)
        enemy.config(position: position, parent: self.view)
        enemy.view.moveCircle(radius: radius, startAngle: angle, rotate: -0.01)
    }
}
