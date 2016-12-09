//
//  Utils.swift
//  follow path
//
//  Created by Admin on 11/27/16.
//  Copyright © 2016 Techkids. All rights reserved.
//

import Foundation
import SpriteKit

extension CGPoint{
    func add(other: CGPoint) -> CGPoint{
        return CGPoint(x: self.x + other.x, y: self.y + other.y)
    }
    
    func add(x: CGFloat, y: CGFloat) -> CGPoint {
        return CGPoint(x: self.x + x, y: self.y + y)
    }
    
    func subtract(other: CGPoint) -> CGVector {
        return CGVector(dx: self.x - other.x, dy: self.y - other.y)
    }
    
    func add(vector: CGVector) -> CGPoint {
        return CGPoint(x: self.x + vector.dx, y: self.y + vector.dy)
    }
    
    func distance(other: CGPoint) -> CGFloat{
        let dx = self.x - other.x
        let dy = self.y - other.y
        return sqrt(dx * dx + dy*dy)
    }
    
}

extension SKAction {
    static func moveToBottom (position: CGPoint, speed: CGFloat) -> SKAction {
        let distance = position.y
        let time = distance / speed
        return SKAction.moveTo(y: 0, duration: TimeInterval(time))
    }
}
extension View {
    func moveRec(origin:CGPoint,size: CGSize){
        let path=UIBezierPath(rect: CGRect(origin: origin, size: size))
        //let path=CGMutablePath()
        //path.addRect(( CGRect(origin: origin, size: size)))
//        let move=SKAction.follow(path.cgPath, speed: 200)
        let move = SKAction.follow(path.cgPath, asOffset: true, orientToPath: false, speed: 200)
        let reset=SKAction.run{self.position=CGPoint(x: 0, y: 0)}
        let sequence=SKAction.sequence([move,reset])
        self.run(SKAction.repeatForever(sequence))
    }
    func moveCircle(radius:CGFloat,startAngle: CGFloat,rotate: CGFloat){
        let position=self.position
         let circlePath=UIBezierPath(arcCenter: CGPoint(x: 0, y: 0), radius: radius, startAngle: startAngle, endAngle: startAngle+rotate, clockwise: true)
        let move =  SKAction.follow(circlePath.cgPath, asOffset: true, orientToPath: false, speed: 200)
       // let move=SKAction.follow(circlePath.cgPath, speed: 200)
        let reset=SKAction.run{self.position=position}
        let sequence=SKAction.sequence([move,reset])
        self.run(SKAction.repeatForever(sequence))
        
    }
    func moveHalfCircle(radius:CGFloat,startAngle: CGFloat){
        let position=self.position

        let circlePath=UIBezierPath(arcCenter: CGPoint(x: 0, y: 0), radius: radius, startAngle: startAngle, endAngle: (startAngle - CGFloat(M_PI)), clockwise: true)
        let move =  SKAction.follow(circlePath.cgPath, asOffset: true, orientToPath: false, speed: 100)
        let reversePath = move.reversed()
        // let move=SKAction.follow(circlePath.cgPath, speed: 200)
        let reset=SKAction.run{self.position=position}
        let sequence=SKAction.sequence([move,reversePath,reset])
        self.run(SKAction.repeatForever(sequence))
        
    }
    func moveToAndReverse(position: CGPoint,startPoint:CGPoint,endPoint:CGPoint){
        let path=CGMutablePath()
        path.move(to: startPoint)
        path.addLine(to: endPoint)
        let followPath=SKAction.follow(path, asOffset: true, orientToPath: false, speed: 100)
        let reversePath=followPath.reversed()
        let reset = SKAction.run {
            self.position = position
        }
        let action=SKAction.sequence([followPath,reversePath,reset])
        self.run(SKAction.repeatForever(action))
    }
    
}
