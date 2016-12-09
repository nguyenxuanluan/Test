//
//  MainFrame.swift
//  Test
//
//  Created by Admin on 12/10/16.
//  Copyright © 2016 LuanNX. All rights reserved.
//

import SpriteKit
class MainFrame: Controller {
    
    init(size: CGSize){
        super.init(view: View(color: UIColor.blue, size: size))
            }
    
    override func config(position: CGPoint, parent: SKNode) {
        super.config(position: position, parent: parent)
        round1()
    }
    
    func round1(){
        print("tesstttt")

        let frame = Stage1(size: CGSize(width: self.view.frame.width, height: self.view.frame.height/2))
        frame.config(position: CGPoint(x: 0, y: self.view.frame.height/2), parent: self.view)
        
        print("\(frame.position)")
    }
    
    func test(){
        return print("0000x0xxxxxx")
    }
    
    func addPlayer(location: CGPoint){
        let playerController = PlayerController()
        playerController.config(position: location, parent: parent)
    }
    
}
