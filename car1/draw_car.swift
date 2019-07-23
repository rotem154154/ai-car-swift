//
//  draw_car.swift
//  car1
//
//  Created by rotem israeli on 22/07/2019.
//  Copyright © 2019 TandR. All rights reserved.
//
import Foundation
import SpriteKit

let pi = Float32(M_PI)

class draw_car{
  var cr : car
  var node : SKSpriteNode
  var back_wheel1 : SKSpriteNode
  var back_wheel2 : SKSpriteNode
  var front_wheel1 : SKSpriteNode
  var front_wheel2 : SKSpriteNode
  var scene : GameScene
  var wheel_base2 : Float32 = 30
  
  init(scene : GameScene) {
    cr = car()
    self.scene = scene
    self.node = SKSpriteNode(imageNamed: "car")
    node.zPosition = 100
    node.xScale = 0.2
    node.yScale = 0.2
    scene.addChild(node)
    
    self.back_wheel1 = SKSpriteNode(imageNamed: "wheel")
    self.back_wheel2 = SKSpriteNode(imageNamed: "wheel")
    self.front_wheel1 = SKSpriteNode(imageNamed: "wheel")
    self.front_wheel2 = SKSpriteNode(imageNamed: "wheel")
    back_wheel1.zPosition = 99
    front_wheel1.zPosition = 99
    back_wheel1.position = CGPoint(x: CGFloat(-cr.wheel_base/2), y: CGFloat(wheel_base2/2))
    front_wheel1.position = CGPoint(x: CGFloat(cr.wheel_base/2), y: CGFloat(wheel_base2/2))
    front_wheel1.xScale = 0.1
    front_wheel1.yScale = 0.2
    back_wheel1.xScale = 0.1
    back_wheel1.yScale = 0.2
    scene.addChild(front_wheel1)
    scene.addChild(back_wheel1)
    back_wheel2.zPosition = 99
    front_wheel2.zPosition = 99
    back_wheel2.position = CGPoint(x: CGFloat(-cr.wheel_base/2), y: CGFloat(-wheel_base2/2))
    front_wheel2.position = CGPoint(x: CGFloat(cr.wheel_base/2), y: CGFloat(-wheel_base2/2))
    front_wheel2.xScale = 0.1
    front_wheel2.yScale = 0.2
    back_wheel2.xScale = 0.1
    back_wheel2.yScale = 0.2
    scene.addChild(front_wheel2)
    scene.addChild(back_wheel2)
    
  }
  
  func update(){
    cr.update()
    
    let front_x = cr.x + cr.wheel_base/2 * cos(cr.rotation)
    let front_y = cr.y + cr.wheel_base/2 * sin(cr.rotation)
    let back_x = cr.x - cr.wheel_base/2 * cos(cr.rotation)
    let back_y = cr.y - cr.wheel_base/2 * sin(cr.rotation)
    node.position = CGPoint(x: CGFloat(cr.x),y: CGFloat(cr.y))
    node.zRotation = CGFloat(cr.rotation)
    let rot = -cr.rotation
    
    let front_x1 = front_x + (wheel_base2/2 * sin(rot))
    let front_y1 = front_y + (wheel_base2/2 * cos(rot))
    let front_x2 = front_x - (wheel_base2/2 * sin(rot))
    let front_y2 = front_y - (wheel_base2/2 * cos(rot))
    let back_x1 = back_x + (wheel_base2/2 * sin(rot))
    let back_y1 = back_y + (wheel_base2/2 * cos(rot))
    let back_x2 = back_x - (wheel_base2/2 * sin(rot))
    let back_y2 = back_y - (wheel_base2/2 * cos(rot))
    
    back_wheel1.position = CGPoint(x: CGFloat(back_x1), y: CGFloat(back_y1))
    front_wheel1.position = CGPoint(x: CGFloat(front_x1), y: CGFloat(front_y1))
    back_wheel1.zRotation = node.zRotation
    front_wheel1.zRotation = CGFloat(cr.rotation + cr.stering*(cr.right-cr.left))
    back_wheel2.position = CGPoint(x: CGFloat(back_x2), y: CGFloat(back_y2))
    front_wheel2.position = CGPoint(x: CGFloat(front_x2), y: CGFloat(front_y2))
    back_wheel2.zRotation = node.zRotation
    front_wheel2.zRotation = CGFloat(cr.rotation + cr.stering*(cr.right-cr.left))
    
  }
  
}

