//
//  GameScene.swift
//  Test
//
//  Created by LuanNX on 12/1/16.
//  Copyright © 2016 LuanNX. All rights reserved.
//

import SpriteKit
import GameplayKit
import  AVFoundation

class GameScene: SKScene, SKPhysicsContactDelegate {
    let TIME_SPAWN_SHILED:Double = 8
    var backgroundSound: AVAudioPlayer!
    let path = Bundle.main.path(forResource: "BackgroundMusic", ofType: "mp3")!
 
    let playerController = PlayerController()
    var scoreLabel:SKLabelNode!
    var score:Int = 0 {
        didSet {
            scoreLabel.text = "\(score)"
        }
    }
    var startGameScene : Bool = false
    var scoreFrame: ScoreFrame!
    var mainFrame: MainFrame!
    var smallFrame: Frame!
    var time: Timer!
    func addScoreFrame(){
        scoreFrame = ScoreFrame(size: CGSize(width: self.frame.size.width, height: self.frame.size.height/12))
        scoreFrame.config(position: CGPoint(x: 0, y: self.size.height*11/12), parent: self)
        addScore()

    }
    func addMainFrame(){
        mainFrame = MainFrame(size: CGSize(width: self.frame.width, height: self.frame.size.height*11/12))
        mainFrame.config(position: CGPoint(x: 0, y: 0), parent: self)
    }
    
    func addSmallFrame(){
        smallFrame = Frame(size: CGSize(width: self.frame.width, height: self.frame.size.height/3))
        smallFrame.config(position: CGPoint(x: 0,y: 0), parent: self, speed: Speed.SM_SPEED)
    }
    func addShield(){
        let shield = ShiledConroller()
        let random = CGFloat(arc4random_uniform(9) + 1)/10
        shield.config(position: CGPoint(x: self.frame.width*random , y: self.frame.height), parent: self)
    }
    override func didMove(to view: SKView) {
        
        playMusicBackGround()
        addScoreFrame()
        addMainFrame()
        addSmallFrame()
        configPhysics()
        time = Timer.scheduledTimer(timeInterval: TIME_SPAWN_SHILED, target: self, selector: #selector(addShield), userInfo: nil, repeats: true)
    }
    
    func playMusicBackGround() {
        
        let url = URL(fileURLWithPath: path)
        do{
            let sound = try AVAudioPlayer(contentsOf: url)
            backgroundSound = sound
            sound.play()
        }catch{
            print(">>> No sound <<<<")
        }
    }
    
    func addStage(){
        let frameNode = FrameController(parent: mainFrame.view)
        frameNode.runRandomStage()
    }
    func addScore(){
        
        self.scoreLabel = SKLabelNode(text: "0")
        self.scoreLabel.position = CGPoint(x: self.frame.width/2, y: 10)
        self.scoreLabel.fontName = "AmericanTypewriter-Bold"
        self.scoreLabel.fontSize = 36
        self.scoreLabel.fontColor = UIColor.white
        self.score = 0
        scoreFrame.view.addChild(scoreLabel)
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
        if (contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask)
                == (PLAYER_MASK | SHIELD_MASK ){
            viewA.hanleContact?(viewB)
            viewB.hanleContact?(viewA)
        } else {
        viewA.hanleContact?(viewB)
            viewB.hanleContact?(viewA)
            changeScene()
        }
        
        
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
            addStage()

 
            
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
            score+=1
            if score % 100 == 0 {
                playSound(fileName: Sound.BREAK_100)
            }
            }
        }
    }
    
    func changeScene(){
        
        if backgroundSound != nil{
            backgroundSound.stop()
            backgroundSound = nil
            print("sound has been stopped")
        }

        if let view = self.view as SKView? {
            let defaults = UserDefaults.standard
            defaults.set(score, forKey: "Score")
             var highestScore = UserDefaults.standard.integer(forKey: "highestScore")
            if highestScore < score {
                highestScore = score
            }
            
            defaults.set(highestScore, forKey: "highestScore")
            let scene = GameOverScene(size: view.frame.size)
            view.presentScene(scene)
        }
        
    }
    deinit {
        print("ashajsakjkajskansaanajhsaakakjsa")
    }
   
    func playSound(fileName: String){
        let playSound = SKAction.playSoundFileNamed(fileName, waitForCompletion: false)
        self.run(playSound)
    }

  
}
