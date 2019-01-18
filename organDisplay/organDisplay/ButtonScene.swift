//
//  ObjectScene.swift
//  organDisplay
//
//  Created by Geovanni Oliveira de Jesus on 16/01/19.
//  Copyright © 2019 Geovanni Oliveira de Jesus. All rights reserved.
//

import Foundation
import SpriteKit
import SceneKit

class ButtonScene: SKScene {
  
  var frontRotateBtn: SKShapeNode?
  var backRotateBtn: SKShapeNode?
  var leftRotateBtn: SKShapeNode?
  var rightRotateBtn: SKShapeNode?
  var upRotateBtn: SKShapeNode?
  var downRotateBtn: SKShapeNode?
  
  var rotationDelegate: ObjectRotation?
  
  override init(size: CGSize) {
    super.init(size:size)
    initRotBtn(size: size)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func initRotBtn(size: CGSize) {
    self.frontRotateBtn = SKShapeNode(rectOf: CGSize(width: 50, height: 50))
    self.frontRotateBtn?.name = "frontRotateBtn"
    self.frontRotateBtn?.fillColor = SKColor.white
    self.frontRotateBtn?.position = CGPoint(x: size.width/10, y: size.height/10)
    self.addChild(self.frontRotateBtn!)
    
    self.backRotateBtn = SKShapeNode(rectOf: CGSize(width: 50, height: 50))
    self.backRotateBtn?.name = "backRotateBtn"
    self.backRotateBtn?.fillColor = SKColor.white
    self.backRotateBtn?.position = CGPoint(x: size.width/3.9, y: size.height/10)
    self.addChild(self.backRotateBtn!)

    self.leftRotateBtn = SKShapeNode(rectOf: CGSize(width: 50, height: 50))
    self.leftRotateBtn?.name = "leftRotateBtn"
    self.leftRotateBtn?.fillColor = SKColor.white
    self.leftRotateBtn?.position = CGPoint(x: size.width/2.45, y: size.height/10)
    self.addChild(self.leftRotateBtn!)

    self.rightRotateBtn = SKShapeNode(rectOf: CGSize(width: 50, height: 50))
    self.rightRotateBtn?.name = "rightRotateBtn"
    self.rightRotateBtn?.fillColor = SKColor.white
    self.rightRotateBtn?.position = CGPoint(x: size.width/1.75, y: size.height/10)
    self.addChild(self.rightRotateBtn!)

    self.upRotateBtn = SKShapeNode(rectOf: CGSize(width: 50, height: 50))
    self.upRotateBtn?.name = "upRotateBtn"
    self.upRotateBtn?.fillColor = SKColor.white
    self.upRotateBtn?.position = CGPoint(x: size.width/1.35, y: size.height/10)
    self.addChild(self.upRotateBtn!)

    self.downRotateBtn = SKShapeNode(rectOf: CGSize(width: 50, height: 50))
    self.downRotateBtn?.name = "downRotateBtn"
    self.downRotateBtn?.fillColor = SKColor.white
    self.downRotateBtn?.position = CGPoint(x: size.width/1.1, y: size.height/10)
    self.addChild(self.downRotateBtn!)
  }
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    
    if (frontRotateBtn?.contains((touches.first?.location(in: self))!))! {
      rotationDelegate?.frontRotation()
    } else if (backRotateBtn?.contains((touches.first?.location(in: self))!))! {
      rotationDelegate?.backRotation()
    } else if (leftRotateBtn?.contains((touches.first?.location(in: self))!))! {
      rotationDelegate?.leftRotation()
    } else if (rightRotateBtn?.contains((touches.first?.location(in: self))!))! {
      rotationDelegate?.rightRotation()
    } else if (upRotateBtn?.contains((touches.first?.location(in: self))!))! {
      rotationDelegate?.upRotation()
    } else if (downRotateBtn?.contains((touches.first?.location(in: self))!))! {
      rotationDelegate?.downRotation()
    }
  }
  
}
