//
//  GameScene.swift
//  Test
//
//  Created by LuanNX on 12/1/16.
//  Copyright © 2016 LuanNX. All rights reserved.
//

import SpriteKit
import GameplayKit
import  Foundation

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var positionPlayer : CGPoint!
    let playerController = PlayerController()
    var scoreLabel:SKLabelNode!
     var score = 0 {
        didSet {
            scoreLabel.text = "\(score)"
        }
    }
    
    override func didMove(to view: SKView) {

        let frame=Stage1(size: CGSize(width: self.frame.width, height: self.frame.height/2))
        frame.config(position: CGPoint(x: self.frame.size.width/2, y: self.frame.height), parent: self)
 //       let frame=Stage2(size: CGSize(width: self.frame.width, height: self.frame.height/2))
//        frame.config(position: CGPoint(x: 0, y: self.frame.height), parent: self)
       configPhysics()
        addScore()
        //print(playerController.position)
        
    }
    func addScore(){
        scoreLabel = SKLabelNode(text: "0")
        scoreLabel.position = CGPoint(x: self.frame.width/2, y: self.size.height - 40)
        scoreLabel.fontName = "AmericanTypewriter-Bold"
        scoreLabel.fontSize = 36
        scoreLabel.fontColor = UIColor.white
        score = 0
        self.addChild(scoreLabel)
    }
    func addBackground(){
        let background = SKSpriteNode(imageNamed: "background")
        background.anchorPoint = CGPoint(x: 0, y: 0)
        background.position = CGPoint(x: 0, y: 0)
        background.zPosition = -1
        self.addChild(background)
    
    }
    
    func configPhysics(){
        self.physicsWorld.gravity=CGVector(dx: 0, dy: 0)
        self.physicsWorld.contactDelegate=self
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        guard let viewA=contact.bodyA.node as? View,
            let viewB=contact.bodyB.node as? View else {
                return
        }
        changeScene()
        //viewA.hanleContact?(viewB)
        //viewB.hanleContact?(viewA)
        
        
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let location = touch.location(in: self)
            print(location)
            playerController.config(position: location, parent: self)
            playerController.touchesBegan(location: location)
            print(playerController.position)
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        playerController.touchesEnded()
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let location = touch.location(in: self)
            playerController.touchesMoved(location: location)
            let previousLocation = touch.previousLocation(in: self)
            
            let movementVector = CGVector(dx: location.x - previousLocation.x, dy: location.y - previousLocation.y)
            playerController.move(vector: movementVector)
        }
    }
     var lastTimeUpdate: TimeInterval = -1
    override func update(_ currentTime: TimeInterval) {
        if lastTimeUpdate == -1 {
            lastTimeUpdate = currentTime
        }
        if currentTime - lastTimeUpdate > 0.1 {
            lastTimeUpdate = currentTime
            score += 1
        }
    }
    
    func changeScene(){

        if let view = self.view as SKView? {
            let defaults = UserDefaults.standard
            defaults.set(score, forKey: "Score")
            let scene = GameOverScene(size: view.frame.size)
            view.presentScene(scene)
        }
    }
    deinit {
        print("Game Scene deinit")
    }
  
}
