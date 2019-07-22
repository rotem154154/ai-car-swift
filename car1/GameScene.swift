//
//  GameScene.swift
//  car1
//
//  Created by rotem israeli on 22/07/2019.
//  Copyright © 2019 TandR. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
  var main_car : car?
  var d_car : draw_car?
  
  override func didMove(to view: SKView) {
    main_car = car()
    d_car = draw_car(scene: self)
    
    
    let target = SKSpriteNode(imageNamed: "car")
    target.xScale = 0.2
    target.yScale = 0.2
    target.position = CGPoint(x: -100, y: -400)
    self.addChild(target)
  }
  
  
  override func update(_ currentTime: TimeInterval) {
    main_car?.update()
    d_car?.update()
  }
  
  
  
  
  func touchDown(atPoint pos : CGPoint) {
    
  }
  func touchMoved(toPoint pos : CGPoint) {
    
  }
  func touchUp(atPoint pos : CGPoint) {
    
  }
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    for t in touches { self.touchDown(atPoint: t.location(in: self)) }
  }
  override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
  }
  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    for t in touches { self.touchUp(atPoint: t.location(in: self)) }
  }
  override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
    for t in touches { self.touchUp(atPoint: t.location(in: self)) }
  }
  
    
  
}
