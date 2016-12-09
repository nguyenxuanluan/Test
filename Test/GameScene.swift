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
    
    var startGameScene : Bool = false
    
    var scoreController = ScoreFrame(size: CGSize.zero)
    var mainController = MainFrame(size: CGSize.zero)
         
    let positionScoreFrame : CGPoint! = nil
    
    
    override func didMove(to view: SKView) {
        scoreFrame()
        mainFrame()
        configPhysics()
     
    }
    
    func addStage(){
        let frameNode = FrameController(parent: self)
        frameNode.runRandomStage()

    func scoreFrame(){
        scoreController = ScoreFrame(size: CGSize(width: self.size.width, height: self.size.height / 12))
        let positionScoreFrame = CGPoint(x: self.size.width/2, y: (self.size.height - self.size.height/24))
        scoreController.config(position: positionScoreFrame , parent: self)
    }
    
    func mainFrame(){
        let frame = MainFrame(size: CGSize(width: self.size.width, height: self.size.height*11/12))
        let positionScore = CGPoint(x: self.size.width/2, y: self.size.height*11/24)
        frame.config(position: positionScore , parent: self)
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
        viewA.hanleContact?(viewB)
        viewB.hanleContact?(viewA)
        
        
    }
    
    func addPlayer(location: CGPoint){
        playerController.config(position: location, parent: self)
        playerController.touchesBegan(location: location)
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {

            startGameScene = true
            let location = touch.location(in: self)
            addPlayer(location: location)
            mainController.round1()
            mainController.test()
 
            
            }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        playerController.touchesEnded()
        changeScene()
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
        if startGameScene == true{
        if lastTimeUpdate == -1 {
            lastTimeUpdate = currentTime
        }
        if currentTime - lastTimeUpdate > 0.1 {
            lastTimeUpdate = currentTime
            scoreController.increase()
            }
        }
    }
    
    func changeScene(){

        if let view = self.view as SKView? {
            let defaults = UserDefaults.standard
            defaults.set(score, forKey: "Score")
             var highestScore = UserDefaults.standard.integer(forKey: "highestScore")
            print(highestScore)
            print(score)
            if highestScore < score {
                highestScore = score
            }
            defaults.set(highestScore, forKey: "highestScore")
            
            let scene = GameOverScene(size: view.frame.size)
            view.presentScene(scene)
        }
    }
    deinit {
        print("Game Scene deinit")
    }
  
}
