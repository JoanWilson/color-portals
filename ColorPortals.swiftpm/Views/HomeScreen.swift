//
//  SwiftUIView.swift
//  
//
//  Created by Joan Wilson Oliveira on 18/04/23.
//

import SwiftUI

struct HomeScreen: View {
    @State private var idle: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Image("mainlogo")
                    .resizable()
                    .scaledToFit()
                    .padding(.bottom, 30)
                NavigationLink {
                    Story01View()
                } label: {
                    Text("Start")
                        .fontWeight(.bold)
                        .font(.system(size: 30))
                        .foregroundColor(.black)
                        .padding(.horizontal, 50)
                        .padding()
                        .background(.white)
                        .cornerRadius(10)
                }
            }
            .padding()
            .frame(
                minWidth: 0,
                maxWidth: .infinity,
                minHeight: 0,
                maxHeight: .infinity,
                alignment: .center
            )
            .background {
                Image("background")
                    .resizable()
                    .scaledToFill()
                    .scaleEffect(self.idle ? 3 : 1)
                    .rotationEffect(self.idle ? Angle(degrees: 180) : Angle(degrees: 0))
                    .animation(Animation.linear(duration: 100).repeatForever(), value: idle)
                    .edgesIgnoringSafeArea(.all)
                    .background(.black)
            }
            .onAppear {
                withAnimation {
                    idle = true
                }
            }
        }
        .tint(.green)
        .ignoresSafeArea()
        .edgesIgnoringSafeArea(.all)

        
    }
}



