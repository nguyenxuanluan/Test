//
//  Stage1.swift
//  Test
//
//  Created by LuanNX on 12/7/16.
//  Copyright © 2016 LuanNX. All rights reserved.
//

import Foundation
import SpriteKit
class Frame :Controller {
    let SPEED:CGFloat = 50
    init() {
        super.init(view: View(color: UIColor.clear, size: CGSize(width: 100, height: 100)))
    }
    override func config(position: CGPoint, parent: SKNode) {
        super.config(position: position, parent: parent)
        view.anchorPoint=CGPoint(x: 0.5, y: 0.5)
        
        addEnemy(radius:50,angle: CGFloat(M_PI))
        addEnemy(radius: 50, angle: CGFloat(0))
        configMove()
    }
    func configMove(){
        let moveAction = SKAction.sequence([.moveToBottom(position: view.position, speed: SPEED)])
        view.run(moveAction)
    }
    func addEnemy(radius: CGFloat,angle: CGFloat){
        let enemy=EnemyController(texture: Textures.ENEMY)
        enemy.config(position: CGPoint(x: 0, y: 0), parent: self.view,radius:radius,angle:angle)
    }
}
