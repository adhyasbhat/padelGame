import SwiftUI
import Intents

//@main
//struct PedalGameApp: App {
//    var body: some Scene {
//        WindowGroup {
//            ServerView()
//        }
//    }
//}

class PedalGameIntents: INExtension {
    override func handler(for intent: INIntent) -> Any? {
        return UpdateScoreIntentHandler()
    }
}
