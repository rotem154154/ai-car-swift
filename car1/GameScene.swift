//
//  GameScene.swift
//  car1
//
//  Created by rotem israeli on 22/07/2019.
//  Copyright © 2019 TandR. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
  var train = false
  var main_car : car?
  var d_car : draw_car?
  var frames = 0
  var score : Float32 = 0
  var max_score : Float32 = 0
  
  override func didMove(to view: SKView) {
    d_car = draw_car(scene: self)
    d_car?.cr.reset()
    d_car?.cr.brain.load_weights(key: "weights")
    d_car?.cr.brain.load_weights(new_weights: [[0.3847988, 0.016521493, 0.9223589, 0.2389111, 0.92456955, 0.8971718, 0.5753628, 0.022935169, 0.06912627, 0.78715414, 0.40211982, 0.3893183, 0.9772655, 0.38270286, 0.7040317, 0.4712515, 0.047577735, 0.46231735, 0.5154641, 0.73608625, 0.27416682, 0.5717448, 0.030401312, 0.93932396, 0.014227272, 0.2402183, 0.10110843, 0.9676238, 0.874021, 0.27392927, 0.23882358, 0.1042894, 0.22315702, 0.29991335, 0.5110293, 0.7415749, 0.31188026, 0.9262221, 0.4266191, 0.0878043, 0.8471979, 0.42466098, 0.09197445, 0.6075198, 0.764123, 0.7783526, 0.3234219, 0.31407204], [0.46922812, 0.83140653, 0.93369484, 0.27128306, 0.024332097, 0.46114892, 0.4439471, 0.8097119, 0.14587967, 0.50940776, 0.083756946, 0.71992195, 0.91591454, 0.26861867, 0.15773289, 0.63690674, 0.20713483, 0.7469874, 0.91024077, 0.7040082, 0.81910634, 0.6262186, 0.5939778, 0.5194313, 0.5851788, 0.68262374, 0.931323, 0.08260474, 0.44801238, 0.64060706, 0.8904151, 0.6205735, 0.0020064635, 0.6550695, 0.22469127, 0.57637715, 0.87759, 0.33027533, 0.54223585, 0.86263084, 0.7876643, 0.8469125, 0.479931, 0.54557097, 0.090992756, 0.12180444, 0.5103941, 0.13957231], [0.44964164, 0.2169718, 0.8634697, 0.51212263, 0.99444795, 0.46309733, 0.30819485, 0.26762435, 0.3688076, 0.9991462, 0.12836137, 0.27896202, 0.9298504, 0.9527859, 0.5008897, 0.54295146, 0.15842377, 0.10881107]])

    main_car = car()
    main_car?.brain.weights = (d_car?.cr.brain.weights)!
    
    let target = SKSpriteNode(imageNamed: "car")
    target.xScale = 0.2
    target.yScale = 0.2
    target.position = CGPoint(x: -100, y: 400)
    self.addChild(target)
    if (train == true){
      for i in 0...30000000{
        main_car?.predict()
        main_car?.update()
        let dx = (main_car?.x)! + 100
        let dy = (main_car?.y)! - 400
        let s = 1 / (sqrt(dx*dx+dy*dy)+1)
        if frames < 1000{
          frames+=1
          score += s
        }else{
          if score > max_score{
            print(i/1000,max_score)
            max_score = score
            main_car!.brain.save_weights(key: "weights")
            print(main_car!.brain.weights)
          }
          frames = 0
          score = 0
          main_car!.reset()
          main_car?.brain.random_weights()
//          main_car?.brain.mutate(alpha: 0.7)
        }
      }
    }
    print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@")
    
  }
  
  
  override func update(_ currentTime: TimeInterval) {
    d_car?.cr.predict()
    d_car?.update()
    
    
//
    let dx = (d_car?.cr.x)! + 100
    let dy = (d_car?.cr.y)! - 400
    let s = 1 / (sqrt(dx*dx+dy*dy)+1)
    if frames < 1000{
      frames+=1
      score += s
    }else{
      if score > max_score{
        max_score = score
        d_car?.cr.brain.save_weights(key: "weights")
      }
      frames = 0
      score = 0
      d_car?.cr.reset()
    }
    print(max_score, score,frames)
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
