import SwiftUI
class ScoreModel: ObservableObject {
    @Published var playerAScore: Int = 0
    @Published var playerBScore: Int = 0
    @Published var playerAGames: Int = 0
    @Published var playerBGames: Int = 0
    @Published var playerASets: Int = 0
    @Published var playerBSets: Int = 0
    @Published var isDeuce: Bool = false
    @Published var advantage: String? = nil
    
    private var scoreHistory: [(Int, Int, String?)] = []
    private var gameHistory: [(Int, Int)] = []
    
    func updateScore(for player: String) {
        // Save current state for undo
        scoreHistory.append((playerAScore, playerBScore, advantage))
        
        if isDeuce {
            handleDeuceScoring(for: player)
            return
        }
        
        if player == "A" {
            playerAScore = nextScore(currentScore: playerAScore)
            
            // Check if player A won the game
            if playerAScore > 40 {
                playerAGames += 1
                resetGameScore()
                checkSetCompletion()
            }
        } else {
            playerBScore = nextScore(currentScore: playerBScore)
            
            // Check if player B won the game
            if playerBScore > 40 {
                playerBGames += 1
                resetGameScore()
                checkSetCompletion()
            }
        }
        
        // Check for deuce
        if playerAScore == 40 && playerBScore == 40 {
            isDeuce = true
        }
    }
    
    private func handleDeuceScoring(for player: String) {
        if advantage == nil {
            // First point after deuce
            advantage = player
        } else if advantage == player {
            // Player with advantage scores again (wins game)
            if player == "A" {
                playerAGames += 1
            } else {
                playerBGames += 1
            }
            resetGameScore()
            checkSetCompletion()
        } else {
            // Back to deuce
            advantage = nil
        }
    }
    
    private func checkSetCompletion() {
        // Check if a set is complete (player has 6 games with at least 2-game lead)
        if playerAGames >= 6 && playerAGames - playerBGames >= 2 {
            playerASets += 1
            gameHistory.append((playerAGames, playerBGames))
            playerAGames = 0
            playerBGames = 0
        } else if playerBGames >= 6 && playerBGames - playerAGames >= 2 {
            playerBSets += 1
            gameHistory.append((playerAGames, playerBGames))
            playerAGames = 0
            playerBGames = 0
        }
    }
    
    func undoLastScore() {
        if let lastScore = scoreHistory.popLast() {
            playerAScore = lastScore.0
            playerBScore = lastScore.1
            advantage = lastScore.2
            
            // Check if we need to restore deuce status
            isDeuce = (playerAScore == 40 && playerBScore == 40)
        }
    }
    
    private func resetGameScore() {
        playerAScore = 0
        playerBScore = 0
        isDeuce = false
        advantage = nil
    }
    
    private func nextScore(currentScore: Int) -> Int {
        switch currentScore {
        case 0: return 15
        case 15: return 30
        case 30: return 40
        default: return 45 // This represents "Game"
        }
    }
    
    var scoreDescription: String {
        if isDeuce {
            if let adv = advantage {
                return "Advantage Player \(adv)"
            } else {
                return "Deuce"
            }
        } else if playerAScore == playerBScore {
            return "\(formatScore(playerAScore))-All"
        } else {
            return "\(formatScore(playerAScore))-\(formatScore(playerBScore))"
        }
    }
    
    private func formatScore(_ score: Int) -> String {
        return score == 0 ? "Love" : "\(score)"
    }
}
