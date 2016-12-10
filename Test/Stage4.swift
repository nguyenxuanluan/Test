//
//  Stage4.swift
//  Test
//
//  Created by LuanNX on 12/9/16.
//  Copyright © 2016 LuanNX. All rights reserved.
//

import Foundation
import SpriteKit
class Stage4 : Frame {
    override func configAction() {
        view.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        addEnemy(radius: 50, angle: 0)
        addEnemy(radius: 50, angle: CGFloat(M_PI))
    }
    func addEnemy(radius: CGFloat,angle: CGFloat){
        let enemy=EnemyController(texture: Textures.CIRCLE, resize: 4)
        enemy.config(position: CGPoint(x: 0, y: 0), parent: self.view)
            enemy.view.moveHalfCircle(radius: radius, startAngle: angle)  
    }
}
