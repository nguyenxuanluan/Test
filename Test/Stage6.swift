//
//  Stage6.swift
//  Test
//
//  Created by LuanNX on 12/10/16.
//  Copyright © 2016 LuanNX. All rights reserved.
//

import Foundation
import SpriteKit
class Stage6 : Frame {
    
    override func configAction() {
        view.anchorPoint=CGPoint(x: 0.5, y: 0.5)
        addEnemy2(position: CGPoint(x: 0, y: 0),startPoint: CGPoint(x: -120, y: 0), endPoint: CGPoint(x: +200, y: 0))
        addEnemy2(position: CGPoint(x: 0, y: 0),startPoint: CGPoint(x: +120, y: 0), endPoint: CGPoint(x: -200, y: 0))
        
    }
    func addEnemy2(position: CGPoint,startPoint: CGPoint, endPoint: CGPoint){
        let enemy=EnemyController(texture: Textures.STICK ,resize: 8)
        enemy.config(position: position, parent: self.view)
        enemy.view.moveToAndReverse(startPoint: startPoint, endPoint: endPoint)
    }
}

