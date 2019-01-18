//
//  Protocol.swift
//  organDisplay
//
//  Created by Geovanni Oliveira de Jesus on 18/01/19.
//  Copyright © 2019 Geovanni Oliveira de Jesus. All rights reserved.
//

import Foundation
import SceneKit

protocol ObjectRotation {
  func frontRotation()
  func backRotation()
  func leftRotation()
  func rightRotation()
  func upRotation()
  func downRotation()
}
