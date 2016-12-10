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
    func config(position: CGPoint, parent: SKNode, speed: CGFloat) {
        super.config(position: position, parent: parent)
<<<<<<< HEAD
        //view.anchorPoint=CGPoint(x: 0, y: 1)
        configMove(speed: speed)
=======
        configMove()
>>>>>>> ab3bab3250c411913607a61baababc4a05f37cb0
        configAction()
    }
    func configMove(speed: CGFloat){
        let moveAction = SKAction.sequence([.moveToBottom(position: view.position, speed: speed),.removeFromParent()])
        view.run(moveAction)
    }
    func configAction(){
    
    }
    
}
