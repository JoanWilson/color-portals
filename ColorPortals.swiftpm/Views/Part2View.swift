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

            Text("This gift is available in a parallel reality that is shaped like a room. I created 3 portals that have an enigma that, when solved, will unlock a new portal where the gift sent to me is. Inside each portal are colored rectangles painted, but I can't differentiate the colors of each one of them. I need your help! Here's an example below:")
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
