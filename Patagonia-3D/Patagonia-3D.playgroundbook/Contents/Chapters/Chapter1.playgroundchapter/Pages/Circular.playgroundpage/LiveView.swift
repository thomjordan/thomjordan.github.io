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

//// Bezier Drawing
let bezierPath = UIBezierPath()
bezierPath.move(to: CGPoint(x: 50.5, y: 38))
bezierPath.addCurve(to: CGPoint(x: 39, y: 49.5), controlPoint1: CGPoint(x: 44.15, y: 38), controlPoint2: CGPoint(x: 39, y: 43.15))
bezierPath.addCurve(to: CGPoint(x: 50.5, y: 61), controlPoint1: CGPoint(x: 39, y: 55.85), controlPoint2: CGPoint(x: 44.15, y: 61))
bezierPath.addCurve(to: CGPoint(x: 62, y: 49.5), controlPoint1: CGPoint(x: 56.85, y: 61), controlPoint2: CGPoint(x: 62, y: 55.85))
bezierPath.addCurve(to: CGPoint(x: 51.32, y: 38.03), controlPoint1: CGPoint(x: 62, y: 43.42), controlPoint2: CGPoint(x: 57.29, y: 38.45))
bezierPath.addCurve(to: CGPoint(x: 50.5, y: 38), controlPoint1: CGPoint(x: 51.05, y: 38.01), controlPoint2: CGPoint(x: 50.77, y: 38))
bezierPath.close()
bezierPath.move(to: CGPoint(x: 100, y: 50))
bezierPath.addCurve(to: CGPoint(x: 50, y: 100), controlPoint1: CGPoint(x: 100, y: 77.61), controlPoint2: CGPoint(x: 77.61, y: 100))
bezierPath.addCurve(to: CGPoint(x: 0, y: 50), controlPoint1: CGPoint(x: 22.39, y: 100), controlPoint2: CGPoint(x: 0, y: 77.61))
bezierPath.addCurve(to: CGPoint(x: 32.67, y: 3.08), controlPoint1: CGPoint(x: 0, y: 28.48), controlPoint2: CGPoint(x: 13.6, y: 10.13))
bezierPath.addCurve(to: CGPoint(x: 50, y: 0), controlPoint1: CGPoint(x: 38.07, y: 1.09), controlPoint2: CGPoint(x: 43.91, y: 0))
bezierPath.addCurve(to: CGPoint(x: 100, y: 50), controlPoint1: CGPoint(x: 77.61, y: 0), controlPoint2: CGPoint(x: 100, y: 22.39))
bezierPath.close()
color.setFill()
bezierPath.fill()

let shape = SCNShape(path: bezierPath, extrusionDepth: 10)
let node = SCNNode(geometry: shape)
shape.firstMaterial?.isDoubleSided = true
shape.firstMaterial?.diffuse.contents = UIColor.lightGray
scene.rootNode.addChildNode(node)

let view = SCNView()
view.allowsCameraControl = true
view.autoenablesDefaultLighting = true
view.scene = scene
PlaygroundPage.current.liveView = view
bellPlayer?.play()
