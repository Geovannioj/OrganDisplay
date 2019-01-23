//
//  ViewController.swift
//  organDisplay
//
//  Created by Geovanni Oliveira de Jesus on 16/01/19.
//  Copyright © 2019 Geovanni Oliveira de Jesus. All rights reserved.
//

import UIKit
import SceneKit

class ViewController: UIViewController {

  //properties
  private let sceneName = "Rock_Big.scn"
  private var objectScene: SCNScene?
  private var cameraNode: SCNNode?
  private var scnView: SCNView?
  private var buttonScene: ButtonScene?
  private var object3D: SCNNode?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    setupView()
    setupScene(name: self.sceneName)
    setupLight()
    addCamera(scene: self.objectScene!)
    addObject()
    setUpButtons()
  }

  fileprivate func setupView() {
    self.scnView = self.view as? SCNView
    scnView?.backgroundColor = UIColor.black
    scnView?.allowsCameraControl = true
  }
  
  fileprivate func setupScene(name: String) {
    self.objectScene = SCNScene()//SCNScene(named: name)
    self.scnView?.scene = self.objectScene
  }
  
  fileprivate func setupLight() {
    let lightNode = SCNNode()
    lightNode.light = SCNLight()
    lightNode.light?.type = .ambient
    lightNode.light?.intensity = 0.9
    lightNode.position = SCNVector3(0, 1000, 2)
    self.objectScene?.rootNode.addChildNode(lightNode)
  
  }
  
  fileprivate func addCamera(scene: SCNScene) {
    self.cameraNode = SCNNode()
    cameraNode!.camera = SCNCamera()
    cameraNode!.position = SCNVector3(0, 0, 10)
    scene.rootNode.addChildNode(cameraNode!)
  }
  
  fileprivate func setUpButtons() {
    self.buttonScene = ButtonScene(size:(self.scnView?.bounds.size)!)
    self.buttonScene?.rotationDelegate = self
    self.scnView?.overlaySKScene = self.buttonScene
  }
  
  fileprivate func addObject() {
    
    guard let scene = SCNScene(named: self.sceneName) else { fatalError("Could not find Rocks scene!")}
    guard let rock = scene.rootNode.childNode(withName: "Cube", recursively: true) else { fatalError("Could not find rock node")}
    
    object3D = SCNNode(geometry: rock.geometry)
    object3D?.geometry?.firstMaterial?.diffuse.contents = UIImage(named: "organTxt")
    object3D?.pivot = SCNMatrix4MakeTranslation(0.5,0.5,0.5)
//    object3D?.geometry?.firstMaterial?.normal.contents = UIImage(named: "heartNormal")
//    object3D?.scale = SCNVector3(10, 10, 10)
    self.objectScene?.rootNode.addChildNode(object3D!)
    
  }
  
  fileprivate func rotateObject(node: SCNNode) {
    let rot = SCNAction.rotateTo(x: 90, y: 0, z: 0, duration: 2)
    let rep = SCNAction.repeatForever(rot)
    node.runAction(rep)
  }
  
}

extension ViewController: ObjectRotation {
  
  //1.5708 = 90 degrees in radians
  func frontRotation() {
    let rotation = SCNAction.rotateTo(x: 0, y: 0, z: 0, duration: 1)
    self.object3D!.runAction(rotation)
  }
  
  func backRotation() {
    //330
    let rotation = SCNAction.rotateTo(x: 0, y: 3.14159, z: 0, duration: 1)
    self.object3D!.runAction(rotation)
  }
  
  func leftRotation() {
    let rotation = SCNAction.rotateTo(x: 0, y: 1.5708, z: 0, duration: 1)
    self.object3D!.runAction(rotation)
  }
  
  func rightRotation() {
    let rotation = SCNAction.rotateTo(x: 0, y: -1.5708, z: 0, duration: 1)
    self.object3D!.runAction(rotation)
  }
  
  func upRotation() {
    let rotation = SCNAction.rotateTo(x: 1.5708, y: 0, z: 0, duration: 1)
    self.object3D!.runAction(rotation)
  }
  
  func downRotation() {
    let rotation = SCNAction.rotateTo(x: -1.5708, y: 0, z: 0, duration: 1)
    self.object3D!.runAction(rotation)
  }
  
  
}

