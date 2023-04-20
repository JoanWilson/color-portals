import SwiftUI

struct Story01View: View {
    @Environment(\.mainWindowSize) var windowSize
    var body: some View {
        ZStack(alignment: .bottom) {
            CutsceneView(historyText: "This playgrounds app tells a science fiction story based on the multiverse.\n Please keep your iPad in portrait position.")
                .ignoresSafeArea()
                .edgesIgnoringSafeArea(.all)
                .background(.black)

            Spacer()

            NavigationLink {
                Story02View()
            } label: {
                Text("Next")
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: windowSize.width*0.3)
                    .background(Color.gray)
                    .cornerRadius(8)
            }
            .padding(.bottom, windowSize.height*0.2)
        }
        .background(.black)
    }
}





struct Story01View_Previews: PreviewProvider {
    static var previews: some View {
        Story01View()
    }
}
