//
//  File.swift
//  
//
//  Created by Joan Wilson Oliveira on 11/04/23.
//

import SwiftUI
import UIKit
import ARKit

struct PortalView: UIViewControllerRepresentable {

    var imageName: String

    init(imageName: String) {
        self.imageName = imageName
    }

    func makeUIViewController(context: Context) -> some UIViewController {
        return PortalViewController(imageName: imageName)
    }

    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
}
