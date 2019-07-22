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
  var x : Float32 = 0
  var y : Float32 = 0
  var rotation : Float32 = 0
  var speed : Float32 = 0
  var wheel_base : Float32 = 60
  
  var acc : Float32 = 0.01
  var stering : Float32 = 1
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
  
}
