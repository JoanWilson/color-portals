//
//  SwiftUIView.swift
//  
//
//  Created by Joan Wilson Oliveira on 19/04/23.
//

import SwiftUI

struct EndingView: View {
    @Environment(\.mainWindowSize) var windowSize
    @Environment(\.dismiss) var dismiss

    var acceptanceCode: [String]
    var isDaltonic: Bool

    init(isDaltonic: Bool, acceptanceCode: [String]) {
        self.isDaltonic = isDaltonic
        self.acceptanceCode = acceptanceCode
    }

    var body: some View {
        VStack {
            VStack(alignment: .center) {

                if isDaltonic == true {
                    Text("Dr. Van Gordon\n")
                        .fontWeight(.bold)
                        .foregroundColor(.white)

                    Text("The code that opened the portal was \(acceptanceCode[0] + acceptanceCode[1] + acceptanceCode[2]). That means that you can see the colors normally. I cannot see all of them. That's why I asked for your help. Thank you very much for helping me and feel free to come back and open more portals to explore.")
                        .lineLimit(100)
                        .foregroundColor(.white)

                    Text("Your Color Range")
                        .fontWeight(.bold)
                        .foregroundColor(.white)

                    Image("gradient1")

                    Button {
                        dismiss()
                    } label: {
                        Text("Come back")
                            .padding()
                            .foregroundColor(.white)
                            .background(Color("lightGray"))
                            .cornerRadius(8)
                    }
                } else {
                    Text("Dr. Van Gordon\n")
                        .fontWeight(.bold)
                        .foregroundColor(.white)

                    Text("The code that openned the portal was \(acceptanceCode[0] + acceptanceCode[1] + acceptanceCode[2]). That means that you probably cannot see the colors normally. Thank you very much for helping me and feel free to come back and open more portals to explore.")
                        .lineLimit(100)
                        .foregroundColor(.white)

                    Text("Your Color Range")
                        .fontWeight(.bold)
                        .foregroundColor(.white)

                    Image("gradient2")

                    Button {
                        dismiss()
                    } label: {
                        Text("Come back")
                            .padding()
                            .foregroundColor(.white)
                            .background(Color("lightGray"))
                            .cornerRadius(8)
                    }
                }
                

                    
                
                
            }
            .padding()
            .frame(width: windowSize.width*0.5, alignment: .leading)
            .background(Color("grayBackground"))
            .opacity(0.9)
            .cornerRadius(8)
            
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

struct EndingView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { proxy in
            ContentManager()
                .environment(\.mainWindowSize, proxy.size)
                .preferredColorScheme(.light)
        }

    }
}
