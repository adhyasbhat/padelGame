import SwiftUI

struct ScoreView: View {
    @ObservedObject var scoreModel = ScoreModel()
    @State private var showGameScore = false
    
    var body: some View {
        ScrollView{
            NavigationStack {
                VStack(spacing: 30) {
                    Text(scoreModel.scoreDescription)
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                    
                    HStack(spacing: 20) {
                        Button(action: {
                            scoreModel.updateScore(for: "A")
                        }) {
                            Text("A")
                                .font(.headline)
                                .foregroundColor(.black)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.blue)
                                .cornerRadius(10)
                        }
                        .buttonStyle(PlainButtonStyle())
                        
                        Button(action: {
                            scoreModel.updateScore(for: "B")
                        }) {
                            Text("B")
                                .font(.headline)
                                .foregroundColor(.black)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.blue)
                                .cornerRadius(10)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                    .padding(.horizontal)
                    
                    HStack(spacing: 20) {
                        Button(action: {
                            scoreModel.undoLastScore()
                        }) {
                            Image("undo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                                .padding()
                                .background(Color(red: 228/255, green: 0/255, blue: 132/255))
                                .cornerRadius(10)
                        }
                        .buttonStyle(PlainButtonStyle())
                        
                    }
                    VStack(spacing: 10) {
                        
                        
                        if scoreModel.playerAScore == 40 && scoreModel.playerBScore == 40 {
                            Text("Deuce")
                                .font(.title)
                                .foregroundColor(.yellow)
                                .padding()
                        }
                        
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Set Score:")
                                .font(.headline)
                                .foregroundColor(.white)
                            
                            HStack(spacing: 40) {
                                VStack(alignment: .center) {
                                    Text("A")
                                        .font(.headline)
                                        .foregroundColor(Color(red: 228/255, green: 0/255, blue: 132/255))
                                    
                                    Text("\(scoreModel.playerAGames)")
                                        .font(.largeTitle)
                                        .foregroundColor(.gray)
                                }
                                
                                VStack(alignment: .center) {
                                    Text("B")
                                        .font(.headline)
                                        .foregroundColor(.blue)
                                    
                                    Text("\(scoreModel.playerBGames)")
                                        .font(.largeTitle)
                                        .foregroundColor(.gray)
                                }
                            }
                            .padding()
                            .background(Color.black.opacity(0.3))
                            .cornerRadius(10)
                        }
     }
                    .padding()
                }
                .padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.black)
            }
        }
    }
}
