//
//  SwiftUIView.swift
//  
//
//  Created by Joan Wilson Oliveira on 17/04/23.
//

import SwiftUI

protocol ContentManagerDelegate {
    func updateStateCodes(code: String, entrance: CodeAcceptance)
}

enum CodeAcceptance: String, CaseIterable {
    case first
    case second
    case third
}

enum UnlockPortal {
    case nothing
    case accepted
    case locked
}

struct ContentManager: View {
    
    
    @Environment(\.mainWindowSize) var windowSize
    @State private var showingSheet = false
    @State var isCompleteButttonAvailable = false
    @State var acceptanceCode: [String] = ["_", "_", "_"] {
        didSet {
            if acceptanceCode[0] != "_",
               acceptanceCode[1] != "_",
               acceptanceCode[2] != "_",
               acceptanceCode[2] != "Yes",
               acceptanceCode[2] != "No" {
                isCompleteButttonAvailable = true
            }
        }
    }
    @State var selectedItem: TestChallenge?
    @State var shouldPresentFinal: Bool = false
    @State var isUnlocked: UnlockPortal = .nothing
    
    public var viewModel: [TestChallenge] = [
        TestChallenge( acceptanceType: .first, pictureName: "1", questionDescription: "Feel free to enter in this portal, there is no dangerous inside that. Then look at the colors painted on the wall, are they the same?", options: ["Yes", "No"]),
        TestChallenge(acceptanceType: .second, pictureName: "2", questionDescription: "Feel free to enter in this portal, there is no dangerous inside that. Then look at the colors painted on the wall, are they the same?", options: ["Yes", "No"]),
        TestChallenge(acceptanceType: .third, pictureName: "3", questionDescription: "Feel free to enter in this portal, there is no dangerous inside that. Then look at the colors painted on the wall, are they the same?", options: ["Yes", "No"]),
    ]
    
    var body: some View {
        HStack(alignment: .firstTextBaseline) {
            
            VStack(alignment: .leading) {
                
                VStack {
                    Text("Portal Generator Machine")
                        .foregroundColor(.white)

                    ScrollView(.vertical) {
                        Text("Doctor Van Gordon needs your help to identify if the colored rectangles that are painted on the walls of the rooms inside the portals are similar or not. The challenge is divided into three portals that you need to generate below:")
                    }
                    .padding()
                    .foregroundColor(.green)
                    .background(.black)
                    


                    
                    ForEach(viewModel, id: \.self) { challenge in
                        Button {
                            selectedItem = challenge
                        } label: {
                            Text("Generate \(challenge.acceptanceType.rawValue.capitalized) Enigma Portal")
                                .foregroundColor(.white)
                                .padding()
                                .frame(width: windowSize.width*0.3)
                                .background(Color.gray)
                                .cornerRadius(8)
                        }
                    }
                    .fullScreenCover(item: $selectedItem) { item in
                        ChallengePortalView(model: item, delegate: self)
                    }
                    .fullScreenCover(isPresented: $shouldPresentFinal) {
                        RewardPortalView(acceptanceCode: acceptanceCode)
                    }
                }
                .frame(width: windowSize.width*0.5)
                .padding()
                .background(Color("grayBackground"))
                .cornerRadius(16)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color("lightGray"), lineWidth: 4)
                )

                VStack {
                    Text("Please find the Security Code")
                        .foregroundColor(.white)
                        .font(.system(.title2))
                    HStack(spacing: 0) {
                        Text(acceptanceCode[0])
                            .foregroundColor(.green)
                            .font(.system(size: 100))
                            .padding()
                            .background(.black)
                        Text(acceptanceCode[1])
                        .foregroundColor(.green)
                            .font(.system(size: 100))
                            .padding()
                            .background(.black)
                        Text(acceptanceCode[2])
                            .foregroundColor(.green)
                            .font(.system(size: 100))
                            .padding()
                            .background(.black)
                    }
                    .frame(width: windowSize.width*0.5)
                    .background(.black)


                    if isCompleteButttonAvailable == true {
                        Button {
                            shouldPresentFinal.toggle()
                            isUnlocked = .accepted
                        } label: {
                            Text("Open the Final Portal!")
                                .foregroundColor(.white)
                                .fontWeight(.black)
                                .padding()
                                .background(.green)
                        }
                    } else {
                        Button {
                            isUnlocked = .locked
                        } label: {
                            Text("Open the Final Portal!")
                                .foregroundColor(.white)
                                .fontWeight(.black)
                                .padding()
                                .background(.red)
                        }
                    }


                }

                .padding()
                .background(Color("grayBackground"))
                .cornerRadius(16)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(getAcceptanceColor(isUnlocked), lineWidth: 4)
                )
            }                
            
            Spacer()
            
            
        }
        .padding(20)
        .padding(.top, 10)
        .frame(
            minWidth: 0,
            maxWidth: .infinity,
            minHeight: 0,
            maxHeight: .infinity,
            alignment: .topLeading
        )
        .background {
            ZStack {
                Image("cockpit_background")
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

    func getAcceptanceColor(_ criteria: UnlockPortal) -> Color {
        switch criteria {
        case .nothing:
            return Color("lightGray")
        case .accepted:
            return .green
        case .locked:
            return .red
        }
    }
}

extension ContentManager: ContentManagerDelegate {
    func updateStateCodes(code: String, entrance: CodeAcceptance) {
        switch entrance {
        case .first:
            if code == "Yes" {
                acceptanceCode[0] = "Y"
            } else {
                acceptanceCode[0] = "N"
            }
        case .second:
            if code == "Yes" {
                acceptanceCode[1] = "Y"
            } else {
                acceptanceCode[1] = "N"
            }
        case .third:
            if code == "Yes" {
                acceptanceCode[2] = "Y"
            } else {
                acceptanceCode[2] = "N"
            }
        }
    }

}


struct ContentManager_Previews: PreviewProvider {
    static var previews: some View {

            GeometryReader { proxy in
                ContentView()
                    .environment(\.mainWindowSize, proxy.size)
            }

    }
}
