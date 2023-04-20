//
//  SwiftUIView.swift
//  
//
//  Created by Joan Wilson Oliveira on 18/04/23.
//

import SwiftUI
import AVFoundation

struct HomeScreen: View {
    @State private var idle: Bool = false
    @State private var mainPlayer: AVAudioPlayer?
    
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
                }.onDisappear {
                    mainPlayer?.stop()
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
                playSoundtrack()
                withAnimation {
                    idle = true

                }
                playSoundtrack()
            }
        }
        .tint(.green)
        .ignoresSafeArea()
        .edgesIgnoringSafeArea(.all)

        
    }

    func playSoundtrack() {
            guard let url = Bundle.main.url(
                forResource: Song.mainSong.rawValue, withExtension: "mp3"
            ) else { return }
            do {
                try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
                try AVAudioSession.sharedInstance().setActive(true)
                mainPlayer = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
                mainPlayer?.numberOfLoops = -1
                guard let player = mainPlayer else { return }
                player.play()
            } catch let error {
                print(error.localizedDescription)
            }
        }
}



