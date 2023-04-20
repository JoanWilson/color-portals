//
//  SwiftUIView.swift
//  
//
//  Created by Joan Wilson Oliveira on 19/04/23.
//

import SwiftUI

struct Part1View: View {
    @Environment(\.mainWindowSize) var windowSize
    var body: some View {
        VStack(alignment: .center) {
            
            Text("Dr. Van Gordon\n")
                .fontWeight(.bold)
                .foregroundColor(.white)
            
            Text("Hello, my name is Dr. Van Gordon. I come from a parallel universe, where people can build portals to enter other dimensions. I contacted you because I received a gift made by a painter who existed in your universe. His name... I believe it was Van Gogh. However, the gift came encrypted in a color test that unfortunately I can't decrypt. Could you help me?")
                .lineLimit(100)
                .foregroundColor(.white)
            
            
        }
        .padding()
        .frame(width: windowSize.width*0.5, alignment: .leading)
        .background(Color("grayBackground"))
        .opacity(0.9)
        .cornerRadius(8)
    }
}
