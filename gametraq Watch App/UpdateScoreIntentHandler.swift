import Intents
import SwiftUI

// Import the manually created intent files
import Foundation

// Define the score model globally
let scoreModel = ScoreModel()

class UpdateScoreIntentHandler: NSObject, UpdateScoreIntentHandling {
    func handle(intent: UpdateScoreIntent, completion: @escaping (UpdateScoreIntentResponse) -> Void) {
        let player = intent.player ?? "A"
        let response = UpdateScoreIntentResponse(code: .success)
        
        // Update the score based on the intent parameters
        scoreModel.updateScore(for: player)
        
        // Construct the updatedScore string to include both player scores
        response.updatedScore = scoreModel.scoreDescription
        
        completion(response)
    }
}
