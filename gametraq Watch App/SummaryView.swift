import SwiftUI

struct SummaryView: View {
    let gameFormat: String
    let selectedSet: Int
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.black.ignoresSafeArea()
                
                VStack(spacing: 10) {
                    Spacer()
                    
                    VStack(spacing: 20) {
                        Text("Pedal")
                            .font(.system(size: 24))
                            .foregroundColor(.white)
                            .bold()
                        HStack{
                            Text("\(gameFormat)")
                                .font(.headline)
                                .foregroundColor(.gray)
                            
                            Text(", for \(selectedSet) Sets")
                                .font(.headline)
                                .foregroundColor(.gray)
                        }
                        
                    }
                    
                    Spacer()
                    
                    NavigationLink(destination: ServerView()) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color(red: 228/255, green: 0/255, blue: 132/255))
                                .frame(width: 50, height: 50)
                            
                            Image(systemName: "play.fill")
                                .font(.system(size: 30))
                                .foregroundColor(.black)
                        }
                    }
                    .buttonStyle(PlainButtonStyle())
                    .padding(.bottom, 20)
                }
            }
            .navigationBarHidden(true)
        }
    }
}
