//
//  Stage7.swift
//  Test
//
//  Created by Admin on 12/10/16.
//  Copyright © 2016 LuanNX. All rights reserved.
//

import SpriteKit
class Stage7 : Frame{
    
    override func configAction() {
        view.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        addEnemy(position: CGPoint(x: -100, y: 0), radius: 50, angle: CGFloat(M_PI_2))
        addEnemy(position: CGPoint(x: -100, y: 0), radius: 50, angle: CGFloat(-M_PI_2))
        
        addEnemy(position: CGPoint(x: 100, y: 0), radius: 50, angle: CGFloat(M_PI))
        addEnemy(position: CGPoint(x: 100, y: 0), radius: 50, angle: CGFloat(0))
     
    }
    
    func addEnemy(position: CGPoint, radius: CGFloat,angle: CGFloat){
        let enemy = EnemyController(texture: Textures.CIRCLE, resize: 3)
        enemy.config(position: position, parent: self.view)
        enemy.view.moveCircle(radius: radius, startAngle: angle, rotate: -0.01)
    }
    
   

}
