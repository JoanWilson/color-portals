//
//  File.swift
//  
//
//  Created by Joan Wilson Oliveira on 17/04/23.
//

import Foundation

struct TestChallenge: Hashable, Identifiable {
    var id: UUID = UUID()
    var acceptanceType: CodeAcceptance
    var pictureName: String
    var questionDescription: String
    var options: [String]

    func hash(into hasher: inout Hasher) {
        hasher.combine(pictureName)
        hasher.combine(questionDescription)
        hasher.combine(options)
    }

    static func == (lhs: TestChallenge, rhs: TestChallenge) -> Bool {
        return lhs.pictureName == rhs.pictureName &&
               lhs.questionDescription == rhs.questionDescription &&
               lhs.options == rhs.options
    }
}

