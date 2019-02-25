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
let vertices: [SCNVector3] = [
    SCNVector3(  1,  1,  1 ),
    SCNVector3(  1, -1, -1 ),
    SCNVector3( -1, -1,  1 ),
    SCNVector3( -1,  1, -1 )
]
let source = SCNGeometrySource(vertices: vertices)

let indices: [UInt16] = [
    0, 1, 2,
    0, 1, 3,
    0, 2, 3,
    1, 2, 3
]
let element = SCNGeometryElement(indices: indices, primitiveType: .triangleStrip)
let geometry = SCNGeometry(sources: [source], elements: [element])
let node = SCNNode(geometry: geometry)
geometry.firstMaterial?.isDoubleSided = true
geometry.firstMaterial?.diffuse.contents = UIColor.lightGray
scene.rootNode.addChildNode(node)
node.scale = SCNVector3(0.5, 0.5, 0.5)
node.orientation = SCNQuaternion(0.1, 0.2, 0.314, 0.382)
//node.simdEulerAngles = simd_float3(x: 3.14, y: 3.14, z: 0) //SCNVector3(3.14, 3.14, 0)
//node.localRotate(by: SCNQuaternion(0, -1, 0.618, -1))


let view = SCNView()
view.allowsCameraControl = true
view.autoenablesDefaultLighting = true
view.scene = scene
PlaygroundPage.current.liveView = view
bellPlayer?.play()

