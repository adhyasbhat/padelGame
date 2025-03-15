
import SwiftUI


struct ServerView: View{
    
        @State private var selectedButton: String? = "Me"
        @State private var navigateToScoreView = false
        
        var body: some View {
            VStack {
                Text("Select First Server")
                    .font(.headline)
                    .foregroundStyle(.black)
                    .padding()
                
                HStack {
                    Button(action: {
                        selectedButton = "Me"
                    }) {
                        Text("Me")
                            .foregroundColor(selectedButton == "Me" ? .white : .black)
                            .padding()
                            .frame(width: 80, height: 40)
                            .background(selectedButton == "Me" ? Color.black : Color.gray.opacity(0.3))
                            .cornerRadius(10)
                    }
                    
                    Button(action: {
                        selectedButton = "Opponent"
                    }) {
                        Text("Opponent")
                            .foregroundColor(selectedButton == "Opponent" ? .white : .black)
                            .padding()
                            .frame(width: 80, height: 40)
                            .background(selectedButton == "Opponent" ? Color.black : Color.gray.opacity(0.3))
                            .cornerRadius(10)
                    }
                }
                .padding()
                NavigationLink(destination: ScoreView(), isActive: $navigateToScoreView) {
                                   Button("Start") {
                                       navigateToScoreView = true
                                   }
                                   .foregroundColor(.white)
                                   .padding()
                                   .background(Color.black)
                                   .cornerRadius(10)
                               }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.white)
        }
  
}

