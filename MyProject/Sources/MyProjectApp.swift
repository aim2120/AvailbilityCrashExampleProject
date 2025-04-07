import SwiftUI

@main
struct MyProjectApp: App {
    init() {
        reproduceCrash()
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
