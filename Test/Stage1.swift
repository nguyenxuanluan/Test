//
//  Stage1.swift
//  Test
//
//  Created by LuanNX on 12/7/16.
//  Copyright © 2016 LuanNX. All rights reserved.
//

import Foundation
import SpriteKit
class Stage1:Frame {
    override func configAction() {
        addEnemy(radius: 50, angle: 0)
        addEnemy(radius: 50, angle: CGFloat(M_PI))
    }
    func addEnemy(radius: CGFloat,angle: CGFloat){
        let enemy=EnemyController(texture: Textures.CIRCLE)
        enemy.config(position: CGPoint(x: 0, y: 0), parent: self.view)
        enemy.view.moveCircle(radius: radius, angle: angle)
    }
}
