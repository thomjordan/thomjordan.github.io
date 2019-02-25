//
//  See LICENSE folder for this template’s licensing information.
//
//  Abstract:
//  Instantiates a live view and passes it to the PlaygroundSupport framework.
//

import UIKit
import PlaygroundSupport
import SceneKit
import AVFoundation

let soundPath = Bundle.main.path(forResource: "bell", ofType: "wav")
let soundURL  = URL(fileURLWithPath: soundPath!)
let bellPlayer = try? AVAudioPlayer(contentsOf: soundURL, fileTypeHint: "wav")
bellPlayer?.prepareToPlay()

PlaygroundPage.current.wantsFullScreenLiveView = true
PlaygroundPage.current.needsIndefiniteExecution = true

let scene = SCNScene()

//let torus = SCNTorus(ringRadius: 10, pipeRadius: 6.18)
//torus.pipeSegmentCount = 7
//let node  = SCNNode(geometry: torus)
//scene.rootNode.addChildNode(node)
//node.position = SCNVector3Make(10, 10, 10)

let s1 = SCNSphere(radius: 100)
let s2 = SCNSphere(radius: 38)
let node1 = SCNNode(geometry: s1)
let node2 = SCNNode(geometry: s2)
node1.position = SCNVector3Make(10, 10, 10)
node2.position = SCNVector3Make(10, 125, 10)
node1.addChildNode(node2)
scene.rootNode.addChildNode(node1)

// node.localRotate(by: SCNQuaternion(0, -1, 0.618, -1))
// s1.firstMaterial?.isDoubleSided = true
// s2.firstMaterial?.diffuse.contents = UIColor.lightGray

let view = SCNView()
view.allowsCameraControl = true
view.autoenablesDefaultLighting = true
view.scene = scene
PlaygroundPage.current.liveView = view
bellPlayer?.play()
