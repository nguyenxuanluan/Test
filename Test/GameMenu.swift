//
//  GameMenu.swift
//  Test
//
//  Created by LuanNX on 12/9/16.
//  Copyright © 2016 LuanNX. All rights reserved.
//

import Foundation
import SpriteKit
class GameMenu : SKScene {
    var label: SKLabelNode!
    let START_GAME_LABEL = "Start game"
    override func didMove(to view: SKView) {
        addGameMenuBackground()
        addLabel()
        
    }
    
    func addGameMenuBackground(){
        let background = SKSpriteNode(texture: Textures.GAME_MENU_BG)
        background.size = self.frame.size
        background.anchorPoint = CGPoint(x: 0, y: 0)
        background.position = CGPoint(x: 0, y: 0)
        background.zPosition = -1
        self.addChild(background)
    }
    func addLabel(){
        label = SKLabelNode(text: START_GAME_LABEL)
        label.position = CGPoint(x: self.frame.size.width/2, y: self.frame.size.height/5*2)
        label.fontName = FontName.AMERICA
        label.fontSize = 40
        //label.fontColor = UIColor.init(hexString: "#07042e")
        label.fontColor = UIColor.green
        self.addChild(label)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let position = touch.location(in: self)
            if label.contains(position){
                changeScene()
            }
        }
    }
    func changeScene(){
        if let view = self.view as SKView? {
            let scene = GameScene(size: view.frame.size)
            view.presentScene(scene)
        }
    }
    
}



