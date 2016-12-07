//
//  EnemyController.swift
//  Test
//
//  Created by LuanNX on 12/1/16.
//  Copyright © 2016 LuanNX. All rights reserved.
//

import SpriteKit
class EnemyController:Controller {
    let SPEED:CGFloat=100
    var frameNode:SKShapeNode!
    static let instance=EnemyController(texture: Textures.ENEMY)
    init(texture: SKTexture) {
        super.init(view: View(texture: texture,size:CGSize(width: 40, height: 40)))
        view.zPosition=3
//        view.anchorPoint=CGPoint(x: 0.5, y: 0.5)
//        view.physicsBody=SKPhysicsBody(texture: texture, size: texture.size())
//        view.physicsBody?.categoryBitMask=ENEMY_MASK
//        view.physicsBody?.contactTestBitMask=PLAYER_MASK
//        view.physicsBody?.collisionBitMask=0
//        view.hanleContact = {
//            otherView in
//            otherView.removeFromParent()
//        }
        
        //addFrameNode()
        
    }
     func config(position: CGPoint, parent: SKNode,radius: CGFloat,angle: CGFloat) {
        super.config(position: position, parent: parent)
        //view.moveRec()
        //view.moveToAndReverse(startPoint: CGPoint(x:0,y:0), endPoint: CGPoint(x:-200,y:0 ))
        view.moveCircle(radius: radius, angle: angle)
    }
    func configMove(){
        let moveAction=SKAction.moveToBottom(position: view.position, speed: SPEED)
        view.run(SKAction.sequence([moveAction,SKAction.removeFromParent()]))
    }
    func rec(){
        let path = CGMutablePath()
        path.move(to:CGPoint(x: 150 ,y: 100))
        
        path.addCurve(to: CGPoint(x: 30, y: 239), control1:  CGPoint(x: 136, y: 373), control2: CGPoint(x: 178, y: 110))
        let followLine = SKAction.follow(path, asOffset: true, orientToPath: true, duration: 2.0)
        let serv=followLine.reversed()
        view.run(SKAction.sequence([followLine,serv]))
        
    }

}
