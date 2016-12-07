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
        let recPath=UIBezierPath(rect: ( CGRect(origin: origin, size: size)))
        let move=SKAction.follow(recPath.cgPath, speed: 200)
        let reset=SKAction.run{self.position=CGPoint(x: 0, y: 0)}
        let sequence=SKAction.sequence([move,reset])
        self.run(SKAction.repeatForever(sequence))
    }
    func moveCircle(radius:CGFloat,angle: CGFloat){
         let circlePath=UIBezierPath(arcCenter: CGPoint(x: 0, y: 0), radius: radius, startAngle: angle, endAngle: angle-0.01, clockwise: true)
        let move=SKAction.follow(circlePath.cgPath, speed: 200)
        let reset=SKAction.run{self.position=CGPoint(x: 0, y: 0)}
        let sequence=SKAction.sequence([move,reset])
        self.run(SKAction.repeatForever(sequence))
        
    }
    func moveToAndReverse(startPoint:CGPoint,endPoint:CGPoint){
        //.zRotation=CGFloat(M_PI/2)
        
        let path=CGMutablePath()
        path.move(to: startPoint)
        path.addLine(to: endPoint)
        let followPath=SKAction.follow(path, speed: 100)
        let reversePath=followPath.reversed()
        let action=SKAction.sequence([followPath,reversePath])
        self.run(SKAction.repeatForever(action))
    }
    
}
