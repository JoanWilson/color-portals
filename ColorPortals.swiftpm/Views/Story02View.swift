//
//  SwiftUIView.swift
//  
//
//  Created by Joan Wilson Oliveira on 19/04/23.
//

import SwiftUI

struct Story02View: View {
    @Environment(\.mainWindowSize) var windowSize
    @State var partIndex: Int = 1
    var body: some View {
        VStack {

            switch partIndex {
            case 1:
                Part1View()
                Button {
                    partIndex += 1
                } label: {
                    Text("Next")
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: windowSize.width*0.3)
                        .background(Color.gray)
                        .cornerRadius(8)
                }
            case 2:
                Part2View()
                HStack {
                    Button {
                        partIndex -= 1
                    } label: {
                        Text("Back")
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: windowSize.width*0.2)
                            .background(Color.gray)
                            .cornerRadius(8)
                    }
                    NavigationLink {
                        ContentManager()
                    } label: {
                        Text("Help now")
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: windowSize.width*0.2)
                            .background(Color.gray)
                            .cornerRadius(8)
                    }
                }

            default:
                ContentManager()
            }
        }
        .frame(width: windowSize.width, height: windowSize.height, alignment: .leading)
        .background {
            ZStack {
                Image("background")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                
                HStack {
                    Spacer()
                    VStack {
                        Image("scientist")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: windowSize.height*0.7)
                            .offset(y: windowSize.height*0.3)
                    }
                    
                }
                
            }
        }
    }
}

struct Story02View_Previews: PreviewProvider {
    static var previews: some View {
        Story02View()
    }
}



