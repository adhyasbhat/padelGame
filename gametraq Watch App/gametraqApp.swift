// Replace the current Watch App entry point with this
import SwiftUI
@main
struct gametraq_Watch_AppApp: App {
    var body: some Scene {
        WindowGroup {
            SplashScreenView() // Changed from ContentView() to SplashScreenView()
        }
    }
}
