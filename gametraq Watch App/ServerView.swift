
import SwiftUI


struct ServerView: View{
    
        @State private var selectedButton: String? = "Me"
        @State private var navigateToScoreView = false
        
        var body: some View {
            VStack {
                Text("Select First Server")
                    .font(.headline)
                    .foregroundStyle(.white)
                    .padding()
                
                HStack {
                    Button(action: {
                        selectedButton = "Me"
                    }) {
                        Text("Me")
                            .foregroundColor(selectedButton == "Me" ? .white : .white)
                            .padding()
                            .frame(width: 80, height: 40)
                            .background(selectedButton == "Me" ? Color(red: 228/255, green: 0/255, blue: 132/255) : Color.gray.opacity(0.3))
                            .cornerRadius(10)
                    }
                    .buttonStyle(PlainButtonStyle())
                    
                    Button(action: {
                        selectedButton = "Opponent"
                    }) {
                        Text("Opponent")
                            .foregroundColor(selectedButton == "Opponent" ? .white : .white)
                            .padding()
                            .frame(width: 80, height: 40)
                            .background(selectedButton == "Opponent" ? Color(red: 228/255, green: 0/255, blue: 132/255) : Color.gray.opacity(0.3))
                            .cornerRadius(10)
                    }.buttonStyle(PlainButtonStyle())
                }
                .padding()
                NavigationLink(destination: ScoreView(), isActive: $navigateToScoreView) {
                                   Button("Start") {
                                       navigateToScoreView = true
                                   }.buttonStyle(PlainButtonStyle())
                                   .foregroundColor(.white)
                                   .padding()
                                   .background(Color(red: 228/255, green: 0/255, blue: 132/255))
                                   .cornerRadius(10)
                               }
                .buttonStyle(PlainButtonStyle())
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.black)
        }
  
}

