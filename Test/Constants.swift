//
//  Constants.swift
//  Test
//
//  Created by LuanNX on 12/1/16.
//  Copyright © 2016 LuanNX. All rights reserved.
//



import SpriteKit
let ENEMY_MASK=UInt32(1<<0)
let PLAYER_MASK=UInt32(1<<1)
struct Textures{
    
  static let  CIRCLE = SKTexture(imageNamed: "circle1")
    static let BG = SKTexture(imageNamed: "background")
    static let SQUARE = SKTexture(imageNamed: "enemy1")
    static let STICK = SKTexture(imageNamed: "thanhngang2")
}
//let PLAYER_TEXTURE=SKTexture(imageNamed: "6")
let midPoint=CGPoint(x: 160, y: 300)



