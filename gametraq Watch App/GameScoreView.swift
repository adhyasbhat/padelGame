import SwiftUI
struct GameScoreView: View {
    @ObservedObject var scoreModel: ScoreModel
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            VStack(spacing: 30) {
                Text("Padel Game Score")
                    .font(.title)
                    .foregroundColor(.white)
                    .padding(.top, 20)
                
                VStack(alignment: .leading, spacing: 15) {
                    Text("Current Game:")
                        .font(.headline)
                        .foregroundColor(.gray)
                    
                    HStack(spacing: 40) {
                        VStack(alignment: .center) {
                            Text("Player A")
                                .font(.headline)
                                .foregroundColor(.green)
                            
                            Text("\(scoreModel.playerAScore)")
                                .font(.largeTitle)
                                .foregroundColor(.white)
                        }
                        
                        VStack(alignment: .center) {
                            Text("Player B")
                                .font(.headline)
                                .foregroundColor(.blue)
                            
                            Text("\(scoreModel.playerBScore)")
                                .font(.largeTitle)
                                .foregroundColor(.white)
                        }
                    }
                    .padding()
                    .background(Color.black.opacity(0.3))
                    .cornerRadius(10)
                }
                
                if scoreModel.playerAScore == 40 && scoreModel.playerBScore == 40 {
                    Text("Deuce")
                        .font(.title)
                        .foregroundColor(.yellow)
                        .padding()
                }
                
                VStack(alignment: .leading, spacing: 15) {
                    Text("Set Score:")
                        .font(.headline)
                        .foregroundColor(.gray)
                    
                    HStack(spacing: 40) {
                        VStack(alignment: .center) {
                            Text("Player A")
                                .font(.headline)
                                .foregroundColor(.green)
                            
                            Text("\(scoreModel.playerAGames)")
                                .font(.largeTitle)
                                .foregroundColor(.white)
                        }
                        
                        VStack(alignment: .center) {
                            Text("Player B")
                                .font(.headline)
                                .foregroundColor(.blue)
                            
                            Text("\(scoreModel.playerBGames)")
                                .font(.largeTitle)
                                .foregroundColor(.white)
                        }
                    }
                    .padding()
                    .background(Color.black.opacity(0.3))
                    .cornerRadius(10)
                }
                
                VStack(alignment: .leading, spacing: 15) {
                    Text("Match Score:")
                        .font(.headline)
                        .foregroundColor(.gray)
                    
                    HStack(spacing: 40) {
                        VStack(alignment: .center) {
                            Text("Player A")
                                .font(.headline)
                                .foregroundColor(.green)
                            
                            Text("\(scoreModel.playerASets)")
                                .font(.largeTitle)
                                .foregroundColor(.white)
                        }
                        
                        VStack(alignment: .center) {
                            Text("Player B")
                                .font(.headline)
                                .foregroundColor(.blue)
                            
                            Text("\(scoreModel.playerBSets)")
                                .font(.largeTitle)
                                .foregroundColor(.white)
                        }
                    }
                    .padding()
                    .background(Color.black.opacity(0.3))
                    .cornerRadius(10)
                }
                
                Spacer()
                
                Text("Padel scoring: 15, 30, 40, Game\nWin by 2 after Deuce\nBest of sets (6 games per set)")
                    .font(.caption)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding()
            }
            .padding()
        }
    }
}
