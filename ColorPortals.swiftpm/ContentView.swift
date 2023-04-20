import SwiftUI

struct ContentView: View {
    var body: some View {
        HomeScreen()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { proxy in
            ContentView()
                .environment(\.mainWindowSize, proxy.size)
                .preferredColorScheme(.light)
        }

    }
}
