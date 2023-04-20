import SwiftUI

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            GeometryReader { proxy in
                ContentView()
                    .environment(\.mainWindowSize, proxy.size)
                    .preferredColorScheme(.light)
            }
        }
    }
}
