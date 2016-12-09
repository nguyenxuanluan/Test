//
//  Stage3.swift
//  Test
//
//  Created by LuanNX on 12/8/16.
//  Copyright © 2016 LuanNX. All rights reserved.
//

import Foundation
import SpriteKit
class Stage3: Frame {
    override func configAction() {
        view.anchorPoint=CGPoint(x: 0.5, y: 0.5)
        addEnemy(radius: 100, angle: 0)
        addEnemy(radius: 100, angle: CGFloat(M_PI))
    }
    func addEnemy(radius: CGFloat,angle: CGFloat){
        let enemy=EnemyController(texture: Textures.STICK, resize: 7)
        print(Textures.STICK.size().height/7)
        enemy.config(position: CGPoint(x: 0, y: 0), parent: self.view)
        enemy.view.moveCircle(radius: radius, startAngle: angle,rotate: -0.01)
    }
}
