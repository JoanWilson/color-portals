//
//  SwiftUIView.swift
//  
//
//  Created by Joan Wilson Oliveira on 19/04/23.
//

import SwiftUI

struct Part2View: View {
    @Environment(\.mainWindowSize) var windowSize
    var body: some View {
        VStack(alignment: .center) {
            Text("Dr. Van Gordon\n")
                .fontWeight(.bold)
                .foregroundColor(.white)

            Text("Well, the test consists of identifying a number inside some picture figures. Your mission is to tell me which number is inside each figure in the Portals. The problem is that not everyone sees colors the same way. In my case, I can't see any numbers! Who knows, maybe you can help me. See an example of an Ishihara painting.")
                .lineLimit(100)
                .foregroundColor(.white)

            Image("1")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: windowSize.width*0.4)
        }
        .padding()
        .frame(width: windowSize.width*0.5, alignment: .leading)
        .background(Color("grayBackground"))
        .opacity(0.9)
        .cornerRadius(8)
    }
}

struct Part0View_Previews: PreviewProvider {
    static var previews: some View {
        Part2View()
    }
}
