//
//  SwiftUIView.swift
//  
//
//  Created by Joan Wilson Oliveira on 18/04/23.
//

import SwiftUI

struct RewardPortalView: View {
    @Environment(\.dismiss) var dismiss

    @State var shouldPresentEndScene: Bool = false
    var acceptanceCode: [String]
    var isDaltonic: Bool {
        if acceptanceCode != ["8", "5", "12"] {
            return false
        } else {
            return true
        }
    }

    init(acceptanceCode: [String]) {
        self.acceptanceCode = acceptanceCode
    }

    var body: some View {
        ZStack(alignment: .topLeading) {
            
            FinalPortalView(imageName: "night")
            VStack(alignment: .leading) {
                Button {
                    dismiss()
                } label: {
                    Text("Back")
                        .foregroundColor(Color.white)
                        .padding()
                        .background(Color.black)
                        .cornerRadius(15)
                        .opacity(0.9)
                }
                .padding()
                .padding(.leading, 10)
                Spacer()

                VStack {
                    Text("Wonderful! This painting is called 'The Starry Night'. It was painted by Van Gogh in 1889, and it is splendid in this 4 dimensional format. \n However, I did an analysis of your result. Click the button below to learn more!")
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.center)
                        .padding()
                        .frame(maxWidth: UIScreen.main.bounds.width*0.7)

                            Button {
                                shouldPresentEndScene.toggle()
                            } label: {
                                Text("Analise my Code")
                                    .frame(minWidth: 80)
                                    .foregroundColor(Color.black)
                                    .padding()
                                    .background(.gray)
                                    .frame(height: 80)
                                    .padding(.horizontal, 10)
                            }.fullScreenCover(isPresented: $shouldPresentEndScene) {
                                EndingView(isDaltonic: isDaltonic, acceptanceCode: acceptanceCode)
                            }


                }
                .frame(width: UIScreen.main.bounds.width, height: .none, alignment: .bottom)
                .padding(.horizontal)
                .background(Color.black)
                .opacity(0.8)

            }
        }
    }
}

