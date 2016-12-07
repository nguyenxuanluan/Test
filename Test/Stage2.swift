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
        
        addEnemy()
    }
    func addEnemy() {
        let enemy=EnemyController(texture: Textures.SQUARE)
        //view.anchorPoint=CGPoint(x: 0, y: 1)
        enemy.config(position: CGPoint(x:0 , y: 0), parent: self.view)
        enemy.view.moveRec(origin: .zero, size: self.size)
    }
}
