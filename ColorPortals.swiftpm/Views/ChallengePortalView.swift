//
//  SwiftUIView 3.swift
//  
//
//  Created by Joan Wilson Oliveira on 17/04/23.
//

import SwiftUI

struct ChallengePortalView: View {

    @Environment(\.dismiss) var dismiss
    @State var model: TestChallenge
    var delegate: ContentManagerDelegate

    init(model: TestChallenge, delegate: ContentManagerDelegate) {
        self._model = State(initialValue: model)
        self.delegate = delegate
    }

    var body: some View {
        ZStack(alignment: .bottom ) {
            PortalView(imageName: model.pictureName)
                .ignoresSafeArea()
            VStack {
                Text(model.questionDescription)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                    .padding()
                    .frame(maxWidth: UIScreen.main.bounds.width*0.7)
                HStack {
                    ForEach(0...1, id: \.self) { index in
                        Button {
                            Task {
                                delegate.updateStateCodes(code: model.options[index], entrance: model.acceptanceType)
                                dismiss()
                            }

                        } label: {
                            Text(model.options[index])
                                .frame(minWidth: 80)
                                .foregroundColor(Color.black)
                                .padding()
                                .background(.gray)
                                .frame(height: 80)
                                .padding(.horizontal, 10)
                        }
                    }
                }
            }
            .frame(width: UIScreen.main.bounds.width, height: .none, alignment: .bottom)
            .padding(.horizontal)
            .background(Color.black)
            .opacity(0.8)

        }
    }
}
