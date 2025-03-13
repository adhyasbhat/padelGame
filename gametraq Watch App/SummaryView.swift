import SwiftUI

struct SummaryView: View {
    let gameFormat: String
    let selectedSet: Int
    
    var body: some View {
        VStack {
            HStack {
                Image("icon")
                    .resizable()
                    .frame(width: 20, height: 20)
                Text("Peddle")
                    .font(.headline)
                    .foregroundStyle(.black)
            }
            
            Text("\(gameFormat)")
                .font(.headline)
                .foregroundColor(.black)
                .padding(.top, 10)
            
            Text("Playing \(selectedSet) sets per game")
                .font(.headline)
                .foregroundColor(.black)
                .padding(.top, 10)
                .padding(.bottom, 30) // Add bottom padding here to create a gap
            
            Spacer()
            
            NavigationLink(destination: ServerView()) {
                Image("play")
                    .resizable()
                    .frame(width: 55, height: 55)
                    .padding()
                    .background(Color.black)
                    .cornerRadius(200)
            }
            .padding(.horizontal)
            .padding(.bottom, 20)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white.ignoresSafeArea())
    }
}

