//
//  File.swift
//  
//
//  Created by Joan Wilson Oliveira on 11/04/23.
//

import SceneKit
import ARKit

public class BoxManager {

    var height: CGFloat = 1
    var width: CGFloat = 0.02
    var length: CGFloat = 1
    var doorLength: CGFloat = 0.3

    public init(height: CGFloat, width: CGFloat, length: CGFloat, doorLength: CGFloat) {
        self.height = height
        self.width = width
        self.length = length
        self.doorLength = doorLength
    }

    func createWall(isDoor: Bool) -> SCNNode {
        let node = SCNNode()
        let firstWall = createFirstWall(isDoor: isDoor)
        let maskedWall = createMaskedWall(isDoor: isDoor)
        node.addChildNode(firstWall)
        node.addChildNode(maskedWall)

        return node
    }

    func createFinalWall(isDoor: Bool) -> SCNNode {
        let node = SCNNode()
        let firstWall = createFirstWallFinal(isDoor: isDoor)
        let maskedWall = createMaskedWall(isDoor: isDoor)
        node.addChildNode(firstWall)
        node.addChildNode(maskedWall)

        return node
    }

    private func createFirstWall(isDoor: Bool) -> SCNNode {
        let firstBox = SCNBox(width: width, height: height, length: isDoor ? doorLength : length, chamferRadius: 0)
        let vanGogh = SCNMaterial()
        vanGogh.diffuse.contents = UIImage(named: "wallTexture")
        vanGogh.locksAmbientWithDiffuse = true

        firstBox.materials = [vanGogh]
        let firstBoxNode = SCNNode(geometry: firstBox)
        firstBoxNode.renderingOrder = 200
        return firstBoxNode
    }


    private func createMaskedWall(isDoor: Bool) -> SCNNode {
        let maskedBox = SCNBox(width: width, height: height, length: isDoor ? doorLength : length, chamferRadius: 0)
        //maskedBox.firstMaterial?.diffuse.contents = UIColor.white
        //maskedBox.firstMaterial?.transparency = 0.000001
        maskedBox.firstMaterial?.colorBufferWriteMask = []

        let maskedBoxNode = SCNNode(geometry: maskedBox)
        maskedBoxNode.renderingOrder = 100
        maskedBoxNode.position = SCNVector3.init(width, 0, 0)

        return maskedBoxNode
    }


    func createFirstWallFinal(isDoor: Bool) -> SCNNode {
        let firstBox = SCNBox(width: width, height: height, length: isDoor ? doorLength : length, chamferRadius: 0)
        let vanGogh = SCNMaterial()
        vanGogh.diffuse.contents = UIImage(named: "night")
        vanGogh.locksAmbientWithDiffuse = true

        firstBox.materials = [vanGogh]
        let firstBoxNode = SCNNode(geometry: firstBox)
        firstBoxNode.renderingOrder = 200
        return firstBoxNode
    }
}

