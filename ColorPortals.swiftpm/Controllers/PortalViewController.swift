//
//  PortalUIViewConViewController.swift
//  
//
//  Created by Joan Wilson Oliveira on 11/04/23.
//

import UIKit
import ARKit
import SwiftUI

class PortalViewController: UIViewController {

    private var sceneView: ARSCNView = ARSCNView()
    var boxManager: BoxManager = BoxManager(height: 2, width: 0.04, length: 2, doorLength: 0.6)
    public var imageName: String

    init(imageName: String) {
        self.imageName = imageName
        super.init(nibName: nil, bundle: nil)
    }

    required convenience init?(coder: NSCoder) {
        self.init(imageName: "1")
    }

    override func loadView() {
        super.loadView()
        view.addSubview(sceneView)
        sceneView.frame = view.frame
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSceneView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let configuration = ARWorldTrackingConfiguration()
        sceneView.session.run(configuration)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        sceneView.session.pause()
    }
}

// MARK: - UI Methods
extension PortalViewController {
    private func setupSceneView() {
        sceneView.delegate = self
        sceneView.showsStatistics = false
        let scene = SCNScene()
        sceneView.scene = scene
        let portal: SCNNode = setupPortal()
        sceneView.scene.rootNode.addChildNode(portal)
    }

    private func setupPortal() -> SCNNode {
        let node = SCNNode()
        node.position = SCNVector3.init(0,0,(-boxManager.length * 1.5))

        let leftWall = boxManager.createWall(isDoor: false)
        leftWall.position = SCNVector3.init((-boxManager.length/2) + boxManager.width,0,0)
        leftWall.eulerAngles = SCNVector3.init(0,180.0.degreesToRadians,0)

        let rightWall = boxManager.createWall(isDoor: false)
        rightWall.position = SCNVector3.init((boxManager.length/2) - boxManager.width,0,0)

        let topWall = boxManager.createWall(isDoor: false)
        topWall.position = SCNVector3.init(0,(boxManager.height/2) - boxManager.width,0)
        topWall.eulerAngles = SCNVector3.init(0,0,90.0.degreesToRadians)

        let bottomWall = boxManager.createWall(isDoor: false)
        bottomWall.position = SCNVector3.init(0,(-boxManager.height/2) + boxManager.width,0)
        bottomWall.eulerAngles = SCNVector3.init(0,0,-90.0.degreesToRadians)

        let backWall = boxManager.createWall(isDoor: false)
        backWall.position = SCNVector3.init(0,0,(-boxManager.length/2) + boxManager.width)
        backWall.eulerAngles = SCNVector3.init(0,90.0.degreesToRadians,0)

        let leftDoorWall = boxManager.createWall(isDoor: true)
        leftDoorWall.position = SCNVector3.init((-boxManager.length/2) + (boxManager.doorLength/2),0,boxManager.length/2-boxManager.width)
        leftDoorWall.eulerAngles = SCNVector3.init(0,-90.0.degreesToRadians,0)

        let rightDoorWall = boxManager.createWall(isDoor: true)
        rightDoorWall.position = SCNVector3.init((boxManager.length/2) - (boxManager.doorLength/2),0,boxManager.length/2-boxManager.width)
        rightDoorWall.eulerAngles = SCNVector3.init(0,-90.0.degreesToRadians,0)


//
        let vanGoghBoard = UIImageView(frame: CGRect(x: 0, y: 0, width: 648, height: 480))
        vanGoghBoard.image = UIImage(named: imageName)
        let width = boxManager.length * 0.7
        let plane = SCNPlane(width: width, height: width * (9/16))
        plane.firstMaterial?.diffuse.contents = vanGoghBoard
        plane.firstMaterial?.isDoubleSided = true
        let nodeVan = SCNNode(geometry: plane)
        nodeVan.renderingOrder = 200
        nodeVan.position = SCNVector3.init(0, 0, -0.8)
        nodeVan.eulerAngles = SCNVector3.init(0, 0, 0)

        let light = SCNLight()
        light.type = .spot

        light.spotInnerAngle = 0
        light.spotOuterAngle = 120

        let constraint = SCNLookAtConstraint(target: topWall)
        constraint.isGimbalLockEnabled = true
//
        let lightNode = SCNNode()
        lightNode.light = light
        lightNode.position = SCNVector3.init(0, 3, 0)
        lightNode.constraints = [constraint]


        node.addChildNode(lightNode)
        node.addChildNode(leftWall)
        node.addChildNode(rightWall)
        node.addChildNode(topWall)
        node.addChildNode(bottomWall)
        node.addChildNode(backWall)
        node.addChildNode(leftDoorWall)
        node.addChildNode(rightDoorWall)
        node.addChildNode(nodeVan)
        return node
    }
}

// MARK: - ARSCN Delegate Methods
extension PortalViewController: ARSCNViewDelegate {

}
