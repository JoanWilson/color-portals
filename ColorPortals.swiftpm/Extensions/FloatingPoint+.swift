//
//  File.swift
//  
//
//  Created by Joan Wilson Oliveira on 11/04/23.
//

import Foundation

extension FloatingPoint{
    var degreesToRadians : Self {
        return self * .pi / 180
    }

    var radiansToDegree : Self {
        return self * 180 / .pi
    }
}
