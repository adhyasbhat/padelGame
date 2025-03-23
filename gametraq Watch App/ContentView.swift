import SwiftUI
import AVKit
import AVFoundation
struct SplashScreenView: View {
    @State private var isActive = false
    @State private var player = AVPlayer(url: Bundle.main.url(forResource: "rlogo", withExtension: "mp4")!)
    
    var body: some View {
        ZStack {
            if isActive {
                ContentView()
            } else {
                VideoPlayer(player: player)
                    .onAppear {
                        // Auto-play the video
                        player.play()
                        
                        // Add observer for when video finishes
                        NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: player.currentItem, queue: .main) { _ in
                            // Navigate to ContentView when video ends
                            withAnimation {
                                self.isActive = true
                            }
                        }
                        
                        // Alternatively, set a timer to move to ContentView after specific duration
                        // This ensures transition even if video playback has issues
                        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
                            withAnimation {
                                self.isActive = true
                            }
                        }
                    }
                    .edgesIgnoringSafeArea(.all)
            }
        }
    }
}

// Update your App entry point to use the splash screen


// Your existing ContentView
struct ContentView: View {
    @State private var digit1: Int = 0
    @State private var digit2: Int = 0
    @State private var digit3: Int = 0
    @State private var navigateToGameSettings = false

    var body: some View {
        NavigationStack {
            VStack {
                Text("Enter Court ID")
                    .foregroundStyle(.white)
                    .font(.headline)
                    
                HStack {
                    Picker("", selection: $digit1) {
                        ForEach(0...9, id: \.self) { Text("\($0)") }
                    }
                    .pickerStyle(WheelPickerStyle())
                    .foregroundStyle(.white)
                    .frame(width: 65, height: 70)

                    Picker("", selection: $digit2) {
                        ForEach(0...9, id: \.self) { Text("\($0)") }
                        
                    }
                    .pickerStyle(WheelPickerStyle())
                    .foregroundStyle(.white)
                    .frame(width: 65, height: 70)

                    Picker("", selection: $digit3) {
                        ForEach(0...9, id: \.self) { Text("\($0)") }
                    }
                    .pickerStyle(WheelPickerStyle())
                    .foregroundStyle(.white)
                    .frame(width: 65, height: 70)
                }
                Spacer()
                
                Button(action: {
                    navigateToGameSettings = true
                }) {
                    Text("Next")
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 200, height: 52)
                        .background(Color(red: 228/255, green: 0/255, blue: 132/255))
                        .cornerRadius(15)
                }
                .buttonStyle(PlainButtonStyle())
            }
            .background(Color.black)
            .navigationDestination(isPresented: $navigateToGameSettings) {
                GameSettingsView()
            }
        }
    }
}



#Preview {
    SplashScreenView()
}
