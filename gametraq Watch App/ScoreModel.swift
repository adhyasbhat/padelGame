import SwiftUI

class ScoreModel: ObservableObject {
    @Published var playerAScore: Int = 0
    @Published var playerBScore: Int = 0
    private var scoreHistory: [(Int, Int)] = []
    
    func updateScore(for player: String) {
        scoreHistory.append((playerAScore, playerBScore))
        if player == "A" {
            playerAScore = nextScore(currentScore: playerAScore)
        } else {
            playerBScore = nextScore(currentScore: playerBScore)
        }
    }
    
    func undoLastScore() {
        if let lastScore = scoreHistory.popLast() {
            playerAScore = lastScore.0
            playerBScore = lastScore.1
        }
    }
    
    private func nextScore(currentScore: Int) -> Int {
        switch currentScore {
        case 0: return 15
        case 15: return 30
        case 30: return 40
        default: return 0
        }
    }
    
    var scoreDescription: String {
        if playerAScore == playerBScore {
            return "Game \(playerAScore)-all"
        } else {
            return "Game \(playerAScore)-\(playerBScore)"
        }
    }
}
