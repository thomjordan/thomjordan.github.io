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

//// Color Declarations
let color = UIColor(red: 0.489, green: 0.489, blue: 0.489, alpha: 0.582)

//// Text Drawing
let textPath = UIBezierPath()
textPath.move(to: CGPoint(x: 63.1, y: 11.1))
textPath.addLine(to: CGPoint(x: 63.1, y: 41.8))
textPath.addLine(to: CGPoint(x: 36.9, y: 41.8))
textPath.addLine(to: CGPoint(x: 36.9, y: 11.1))
textPath.addLine(to: CGPoint(x: 22.1, y: 11.1))
textPath.addLine(to: CGPoint(x: 22.1, y: 88))
textPath.addLine(to: CGPoint(x: 36.9, y: 88))
textPath.addLine(to: CGPoint(x: 36.9, y: 54.9))
textPath.addLine(to: CGPoint(x: 63.1, y: 54.9))
textPath.addLine(to: CGPoint(x: 63.1, y: 88))
textPath.addLine(to: CGPoint(x: 77.9, y: 88))
textPath.addLine(to: CGPoint(x: 77.9, y: 11.1))
textPath.addLine(to: CGPoint(x: 63.1, y: 11.1))
textPath.close()
color.setFill()
textPath.fill()

let shape = SCNShape(path: textPath, extrusionDepth: 30)
let node = SCNNode(geometry: shape)
node.position = SCNVector3Make(0, 0, 0)
shape.firstMaterial?.isDoubleSided = true
shape.firstMaterial?.diffuse.contents = UIColor.lightGray
scene.rootNode.addChildNode(node)

let view = SCNView()
view.allowsCameraControl = true
view.autoenablesDefaultLighting = true
view.scene = scene
PlaygroundPage.current.liveView = view
bellPlayer?.play()

