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
let SHIELD_MASK = UInt32( 1 << 2)
struct Textures{
    
  static let  CIRCLE = SKTexture(imageNamed: "circle1")
    static let BG = SKTexture(imageNamed: "gameover")
    static let SQUARE = SKTexture(imageNamed: "square")
    static let STICK = SKTexture(imageNamed: "thanhngang2")
    static let GAME_MENU_BG = SKTexture(imageNamed: "gamemenu")
    static let SHIELD = SKTexture(imageNamed: "shield")
}
struct FontName {
    static let AMERICA = "AmericanTypewriter-Bold"
}
struct Speed {
    static let SM_SPEED : CGFloat = 100
    static let NO_SPEED : CGFloat = 200

    static let LAR_SPEED : CGFloat = 300
    
    static let VLAR_SPEED : CGFloat = 400

}
struct Sound {
    static let  GAME_OVER = "goSound"
    static let BREAK_100 = "breakrecord.wav"
}
//let PLAYER_TEXTURE=SKTexture(imageNamed: "6")
let midPoint=CGPoint(x: 160, y: 300)

