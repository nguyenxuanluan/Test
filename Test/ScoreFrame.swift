//
//  ScoreFrame.swift
//  Test
//
//  Created by Admin on 12/10/16.
//  Copyright © 2016 LuanNX. All rights reserved.
//

import SpriteKit

class ScoreFrame: Controller{
    
    var scoreLabel:SKLabelNode!
    var score = 0 {
        didSet {
            scoreLabel.text = "\(score)"
        }
    }

    init(size: CGSize){
        super.init(view: View(color: UIColor.clear, size: size))
        addScore()
    }
    
    override func config(position: CGPoint, parent: SKNode) {
        super.config(position: position, parent: parent)
    }
    
    func addScore(){
       
        self.scoreLabel = SKLabelNode(text: "0")
        self.scoreLabel.position = self.position
        self.scoreLabel.fontName = "AmericanTypewriter-Bold"
        self.scoreLabel.fontSize = 36
        self.scoreLabel.fontColor = UIColor.white
        self.score = 0
        self.view.addChild(scoreLabel)
    }
    
    func increase(){
        return self.score += 1
    }
    
    
    
    
    

    
}
