//
//  File.swift
//
//
//  Created by Joan Wilson Oliveira on 11/04/23.
//

import SwiftUI
import UIKit
import ARKit

struct FinalPortalView: UIViewControllerRepresentable {

    var imageName: String

    init(imageName: String) {
        self.imageName = imageName
    }

    func makeUIViewController(context: Context) -> some UIViewController {
        return FinalPortalViewController(imageName: imageName)
    }

    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
}
