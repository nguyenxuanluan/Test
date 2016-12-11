//
//  Views.swift
//  Test
//
//  Created by LuanNX on 12/1/16.
//  Copyright © 2016 LuanNX. All rights reserved.
//

import SpriteKit

typealias HandleContactType = (View) -> ()
typealias HandleShieldType = () -> ()

class View: SKSpriteNode {
    var hanleContact: HandleContactType?
    var handleShile: HandleShieldType?
}
