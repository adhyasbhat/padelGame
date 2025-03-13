import SwiftUI

struct ScoreView: View {
    @ObservedObject var scoreModel = ScoreModel()
    
    var body: some View {
        VStack {
            Text(scoreModel.scoreDescription)
                .font(.largeTitle)
            HStack {
                Button("Player A Scores") {
                    scoreModel.updateScore(for: "A")
                }
                Button("Player B Scores") {
                    scoreModel.updateScore(for: "B")
                }
            }
            Button("Undo Last Score") {
                scoreModel.undoLastScore()
            }
        }
    }
}

