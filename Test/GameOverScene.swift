//
//  GameOverScene.swift
//  Test
//
//  Created by LuanNX on 12/9/16.
//  Copyright © 2016 LuanNX. All rights reserved.
//

import SpriteKit
class GameOverScene : SKScene {
    var playAgainLabel: SKLabelNode!
    override func didMove(to view: SKView) {
        addBackground()
        addGameOverLabel()
        addPlayAgainLabel()
        addScoreLabel()
    }
    
    func addBackground(){
        let background = SKSpriteNode(texture: Textures.BG)
        background.zPosition = -1
        background.anchorPoint = CGPoint(x: 0, y: 0)
        background.position = CGPoint(x: 0, y: 0)
        self.addChild(background)
    }
    func addGameOverLabel(){
        let gameOverLabel = SKLabelNode(text: "Game Over")
        gameOverLabel.fontColor = UIColor.brown
        gameOverLabel.fontName = "Verdana-Bold"
        gameOverLabel.position = CGPoint(x: self.frame.width/2 , y: self.frame.height*3/4)
        gameOverLabel.fontSize = 40
        self.addChild(gameOverLabel)
    }
    func addPlayAgainLabel(){
        playAgainLabel = SKLabelNode(text: "Play Again")
        playAgainLabel.position = CGPoint(x: self.frame.width/2, y: self.frame.height/4)
        playAgainLabel.fontName = "AmericanTypewriter-Bold"
        playAgainLabel.color = UIColor.black
        playAgainLabel.fontSize = 30
        self.addChild(playAgainLabel)
    }
    func addScoreLabel(){
        let yourScore = UserDefaults.standard.integer(forKey: "Score")
    
        let scoreLabel = SKLabelNode(text: "Your score: \(yourScore)")
        scoreLabel.position = CGPoint(x: self.frame.width/2, y: self.frame.height/2)
        scoreLabel.fontName = "AmericanTypewriter-Bold"
        scoreLabel.color = UIColor.black
        scoreLabel.fontSize = 30
        self.addChild(scoreLabel)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first{
            let location = touch.location(in: self)
            if (playAgainLabel.contains(location)) {
                changeScene()
                }
            }
        }
    func changeScene(){
        if let view = self.view! as SKView? {
            let scene = GameScene(size: view.frame.size)
            view.presentScene(scene)
        }
    }
    deinit {
        print("destroy")
    }
    }

