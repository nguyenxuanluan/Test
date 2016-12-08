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
    let SPEED:CGFloat = 20
    init(size: CGSize) {
        super.init(view: View(color: UIColor.clear, size: size))
    }
    override func config(position: CGPoint, parent: SKNode) {
        super.config(position: position, parent: parent)
        //view.anchorPoint=CGPoint(x: 0, y: 1)
        configMove()
        configAction()
    }
    func configMove(){
        let moveAction = SKAction.sequence([.moveToBottom(position: view.position, speed: SPEED),.removeFromParent()])
        view.run(moveAction)
    }
    func configAction(){
    
    }
    
}
