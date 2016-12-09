//
//  ScoreFrame.swift
//  Test
//
//  Created by Admin on 12/10/16.
//  Copyright © 2016 LuanNX. All rights reserved.
//

import SpriteKit

class ScoreFrame: Controller{

    init(size: CGSize){
        super.init(view: View(color: UIColor.clear, size: size))
        self.view.anchorPoint = CGPoint(x: 0, y: 0)
        //addScore()
    }
    
    override func config(position: CGPoint, parent: SKNode) {
        super.config(position: position, parent: parent)
    }
    
    }
