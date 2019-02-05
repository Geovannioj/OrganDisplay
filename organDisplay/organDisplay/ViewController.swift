//
//  ViewController.swift
//  organDisplay
//
//  Created by Geovanni Oliveira de Jesus on 16/01/19.
//  Copyright © 2019 Geovanni Oliveira de Jesus. All rights reserved.
//

import UIKit
import SceneKit
import AudioToolbox

class ViewController: UIViewController {

  //properties
  private let sceneName = "Rock_Big.scn"
  private var objectScene: SCNScene?
  private var cameraNode: SCNNode?
  private var scnView: SCNView?
  private var buttonScene: ButtonScene?
  private var object3D: SCNNode?
  private var cubeFace: SCNNode?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    setupView()
    setupScene(name: self.sceneName)
    setupLight()
    addCamera(scene: self.objectScene!)
    addObject()
    setUpButtons()
    setUpCubeFace(myScnView: self.scnView!)
    
    
  }

  fileprivate func setupView() {
    self.scnView = self.view as? SCNView
    scnView?.backgroundColor = UIColor.black
    scnView?.allowsCameraControl = true
  }
  
  fileprivate func setupScene(name: String) {
    self.objectScene = SCNScene()
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
    self.objectScene?.rootNode.addChildNode(object3D!)
    
  }
  
  fileprivate func setUpCubeFace(myScnView: SCNView) {
    guard let scene = SCNScene(named: self.sceneName) else { fatalError("Could not find Rocks scene!")}
    guard let rock = scene.rootNode.childNode(withName: "Cube3", recursively: true) else { fatalError("Could not find rock node")}
    
    self.cubeFace = SCNNode(geometry: rock.geometry)
    self.cubeFace?.geometry?.firstMaterial?.diffuse.contents = UIImage(named: "Group")
    cubeFace?.scale = SCNVector3(0.25, 0.25, 0.25)
    cubeFace!.position = SCNVector3(2.5 , 4.5, 0)
    self.objectScene?.rootNode.addChildNode(cubeFace!)
  }
  
  fileprivate func rotateObject(node: SCNNode) {
    let rot = SCNAction.rotateBy(x: 0, y: 1.5708, z: 0, duration: 2)
    let rep = SCNAction.repeatForever(rot)
    node.runAction(rep, forKey: "rotateForever")
    //cube
    self.cubeFace?.runAction(rep, forKey: "rotateCube")
  }
  
  fileprivate func stopRotateAction(node:SCNNode) {
    node.removeAction(forKey: "rotateForever")
    self.cubeFace?.removeAction(forKey: "rotateCube")
  }
  
  fileprivate func activateVibration() {
    AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
  }
}

extension ViewController: ObjectRotation {
  
  //1.5708 = 90 degrees in radians
  func frontRotation() {
    stopRotateAction(node: object3D!)
    let rotation = SCNAction.rotateTo(x: 0, y: 0, z: 0, duration: 1)
    self.object3D!.runAction(rotation)
    self.cubeFace?.runAction(rotation)
    self.activateVibration()
    
  }
  
  func backRotation() {
    
    stopRotateAction(node: object3D!)
    let rotation = SCNAction.rotateTo(x: 0, y: 3.14159, z: 0, duration: 1)
    self.object3D!.runAction(rotation)
    self.cubeFace?.runAction(rotation)
    self.activateVibration()
  }
  
  func leftRotation() {
    stopRotateAction(node: object3D!)
    let rotation = SCNAction.rotateTo(x: 0, y: 1.5708, z: 0, duration: 1)
    self.object3D!.runAction(rotation)
    self.cubeFace?.runAction(rotation)
    self.activateVibration()
  }
  
  func rightRotation() {
    stopRotateAction(node: object3D!)
    let rotation = SCNAction.rotateTo(x: 0, y: -1.5708, z: 0, duration: 1)
    self.object3D!.runAction(rotation)
    self.cubeFace?.runAction(rotation)
    self.activateVibration()
  }
  
  func upRotation() {
    stopRotateAction(node: object3D!)
    let rotation = SCNAction.rotateTo(x: 1.5708, y: 0, z: 0, duration: 1)
    self.object3D!.runAction(rotation)
    self.cubeFace?.runAction(rotation)
    self.activateVibration()
  }
  
  func downRotation() {
    stopRotateAction(node: object3D!)
    let rotation = SCNAction.rotateTo(x: -1.5708, y: 0, z: 0, duration: 1)
    self.object3D!.runAction(rotation)
    self.cubeFace?.runAction(rotation)
    self.activateVibration()
  }
  
  func changeToContrastTxt() {

    self.object3D?.geometry?.firstMaterial?.diffuse.contents = UIImage(named: "organTxt")
    self.activateVibration()
  }
  func changeToNormalTxt() {

    self.object3D?.geometry?.firstMaterial?.diffuse.contents = UIImage(named: "organNormal")
    self.activateVibration()
  }
  
  func rotateForever() {
    self.rotateObject(node: self.object3D!)
    self.activateVibration()
  }
}

