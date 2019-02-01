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
  
  //Buttons
  var frontRotateBtn: SKSpriteNode?
  var backRotateBtn: SKSpriteNode?
  var leftRotateBtn: SKSpriteNode?
  var rightRotateBtn: SKSpriteNode?
  var upRotateBtn: SKSpriteNode?
  var downRotateBtn: SKSpriteNode?
  var normalTextureBtn: SKSpriteNode?
  var contrastTextureBtn: SKSpriteNode?
  var rotateModeBtn: SKSpriteNode?
  
  //Delegate
  var rotationDelegate: ObjectRotation?
  
  override init(size: CGSize) {
    super.init(size:size)
    initRotBtn(size: size)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func initRotBtn(size: CGSize) {

    self.frontRotateBtn = SKSpriteNode(imageNamed: "ANT")
    self.frontRotateBtn?.name = "frontRotateBtn"
    self.frontRotateBtn?.position = CGPoint(x: size.width/10, y: size.height/10)
    self.addChild(self.frontRotateBtn!)
    
    self.backRotateBtn = SKSpriteNode(imageNamed: "POST")
    self.backRotateBtn?.name = "backRotateBtn"
    self.backRotateBtn?.position = CGPoint(x: size.width/3.9, y: size.height/10)
    self.addChild(self.backRotateBtn!)

    self.leftRotateBtn = SKSpriteNode(imageNamed: "LAT")
    self.leftRotateBtn?.name = "leftRotateBtn"
    self.leftRotateBtn?.position = CGPoint(x: size.width/2.45, y: size.height/10)
    self.addChild(self.leftRotateBtn!)

    self.rightRotateBtn = SKSpriteNode(imageNamed: "MED")
    self.rightRotateBtn?.name = "rightRotateBtn"
    self.rightRotateBtn?.position = CGPoint(x: size.width/1.75, y: size.height/10)
    self.addChild(self.rightRotateBtn!)

    self.upRotateBtn = SKSpriteNode(imageNamed: "SUP")
    self.upRotateBtn?.name = "upRotateBtn"
    self.upRotateBtn?.position = CGPoint(x: size.width/1.35, y: size.height/10)
    self.addChild(self.upRotateBtn!)

    self.downRotateBtn = SKSpriteNode(imageNamed: "INF")
    self.downRotateBtn?.name = "downRotateBtn"
    self.downRotateBtn?.position = CGPoint(x: size.width/1.1, y: size.height/10)
    self.addChild(self.downRotateBtn!)
    
    self.normalTextureBtn = SKSpriteNode(imageNamed: "ANT")
    self.normalTextureBtn?.name = "normalTextureBtn"
    self.normalTextureBtn?.position = CGPoint(x: size.width/10, y: size.height/1.1)
    self.addChild(normalTextureBtn!)
    
    self.contrastTextureBtn = SKSpriteNode(imageNamed: "POST")
    self.contrastTextureBtn?.name = "contastTextureBtn"
    self.contrastTextureBtn?.position = CGPoint(x: size.width/3.9, y: size.height/1.1)
    self.addChild(contrastTextureBtn!)
    
    self.rotateModeBtn = SKSpriteNode(imageNamed: "LAT")
    self.rotateModeBtn?.name = "rotateModeBtn"
    self.rotateModeBtn?.position = CGPoint(x: size.width/1.1, y: size.height/1.1)
    self.addChild(rotateModeBtn!)
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
    } else if ((contrastTextureBtn?.contains((touches.first?.location(in: self))!))!) {
      rotationDelegate?.changeToContrastTxt()
    } else if((normalTextureBtn?.contains((touches.first?.location(in: self))!))!) {
      rotationDelegate?.changeToNormalTxt()
    } else if((rotateModeBtn?.contains((touches.first?.location(in: self))!))!) {
      rotationDelegate?.rotateForever()
    }
  }
  
}
