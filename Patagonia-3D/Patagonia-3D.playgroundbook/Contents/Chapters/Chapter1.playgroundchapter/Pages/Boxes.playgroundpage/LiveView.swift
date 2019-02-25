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
let boxsize: CGFloat = 0.667

let box = SCNBox(width: boxsize, height: boxsize, length: boxsize, chamferRadius: 0.1)

func addBoxes(count: Int){
    let length = Int(ceil(cbrt(Float(count)))) // cube root
    for i in 0..<count {
        let node = SCNNode(geometry: box)
        node.position = SCNVector3(i % length,  i / (length * length) , (i / length) % length)
        scene.rootNode.addChildNode(node)
    }
}
addBoxes(count: 18)

let view = SCNView()
view.allowsCameraControl = true
view.autoenablesDefaultLighting = true
//view.showsStatistics = true
view.scene = scene
PlaygroundPage.current.liveView = view
bellPlayer?.play()


// Instantiate a new instance of the live view from the book's auxiliary sources and pass it to PlaygroundSupport.
//PlaygroundPage.current.liveView = instantiateLiveView()
