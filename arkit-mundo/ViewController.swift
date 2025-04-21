//
//  ViewController.swift
//  arkit-mundo
//
//  Created by Cristian Garrido Jaña on 21-04-25.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
        // Create a new scene
        let scene = SCNScene(named: "art.scnassets/sistemaSolar.scn")!
        
        
        if let planetaTierra = scene.rootNode.childNode(withName: "planetaTierra", recursively: true) {
            let rotacion = SCNAction.repeatForever(
                SCNAction.rotateBy(x: 0, y: CGFloat(2 * Double.pi), z: 0, duration: 30)
            )
            planetaTierra.runAction(rotacion)
        }
    
        if let planetaTierra = scene.rootNode.childNode(withName: "planetaTierra", recursively: true),
           let luna = planetaTierra.childNode(withName: "luna", recursively: true) {
            
            // Rotación propia de la luna (sobre su eje Y)
            let rotacionLuna = SCNAction.repeatForever(
                SCNAction.rotateBy(x: 0, y: CGFloat(2 * Double.pi), z: 0, duration: 20)
            )
            luna.runAction(rotacionLuna)
        }

        
        
        // Set the scene to the view
        sceneView.scene = scene
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }

    // MARK: - ARSCNViewDelegate
    
/*
    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
     
        return node
    }
*/
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}
