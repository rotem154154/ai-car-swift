//
//  car.swift
//  car1
//
//  Created by rotem israeli on 22/07/2019.
//  Copyright © 2019 TandR. All rights reserved.
//

import Foundation
import SpriteKit



class car{
  let brain = dense(layers_sizes: [6,8,6,3])
  var x : Float32 = 0
  var y : Float32 = 0
  var rotation : Float32 = 0
  var speed : Float32 = 0
  var wheel_base : Float32 = 60
  
  var acc : Float32 = 0.01
  var stering : Float32 = 2
  var wind : Float32 = 0.001
  
  var down : Float32 = 0
  var left : Float32 = 0.7
  var right : Float32 = 1
  
  init() {
    
  }
  
  func update(){
    speed = speed + acc - speed*speed*wind
    
    
    var front_x = x + wheel_base/2 * cos(rotation)
    var front_y = y + wheel_base/2 * sin(rotation)
    var back_x = x - wheel_base/2 * cos(rotation)
    var back_y = y - wheel_base/2 * sin(rotation)
    
    back_x += speed * cos(rotation)
    back_y += speed * sin(rotation)
    front_x += speed * cos(rotation + stering*(right-left))
    front_y += speed * sin(rotation + stering*(right-left))
    
    x = (front_x + back_x) / 2
    y = (front_y + back_y) / 2
    rotation = atan2(front_y-back_y, front_x-back_x)
    
    
    
  }
  
  func predict(){
    let dx = x + 100
    let dy = y - 400
    let out = self.brain.forward(input_stack: [x/500,y/500,rotation/pi,speed/4,dx/500,dy/500])
    self.down = out[0]
    self.left = out[1]
    self.right = out[2]
  }
  func reset(){
    x = 0
    y = 0
    rotation = 0
    speed = 0
  }
  
}
