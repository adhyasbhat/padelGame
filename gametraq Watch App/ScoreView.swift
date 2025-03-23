import SwiftUI

struct ScoreView: View {
    @ObservedObject var scoreModel = ScoreModel()
    @State private var showGameScore = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 30) {
                Text(scoreModel.scoreDescription)
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding()
                
                HStack(spacing: 20) {
                    Button(action: {
                        scoreModel.updateScore(for: "A")
                    }) {
                        Text("Player A Scores")
                            .font(.headline)
                            .foregroundColor(.black)
                            .padding()
                            .background(Color.green)
                            .cornerRadius(10)
                    }
                    
                    Button(action: {
                        scoreModel.updateScore(for: "B")
                    }) {
                        Text("Player B Scores")
                            .font(.headline)
                            .foregroundColor(.black)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                }
                
                HStack(spacing: 20) {
                    Button(action: {
                        scoreModel.undoLastScore()
                    }) {
                        Text("Undo Last Score")
                            .font(.headline)
                            .foregroundColor(.black)
                            .padding()
                            .background(Color.orange)
                            .cornerRadius(10)
                    }
                    
                    NavigationLink(destination: GameScoreView(scoreModel: scoreModel)) {
                        Text("View Score")
                            .font(.headline)
                            .foregroundColor(.black)
                            .padding()
                            .background(Color.yellow)
                            .cornerRadius(10)
                    }
                }
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.black)
        }
    }
}

