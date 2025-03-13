import SwiftUI

struct GameSettingsView: View {
    @State private var gameFormat = "Singles"
    let gameFormats = ["Singles", "Doubles"]
    
    @State private var selectedSet: Int = 5
    let setOptions = [3, 5, 7, 9]
    
    @State private var selectedMinutes: Int = 10
    @State private var selectedSeconds: Int = 0
    
    @State private var navigateToNextScreen = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 10) {
                    MatchSettingView(gameFormat: $gameFormat, gameFormats: gameFormats)
                    SetsPerGameView(selectedSet: $selectedSet, setOptions: setOptions)
                    SetTimeView(selectedMinutes: $selectedMinutes, selectedSeconds: $selectedSeconds)
                    
                    NavigationLink(destination: SummaryView(gameFormat: gameFormat, selectedSet: selectedSet), isActive: $navigateToNextScreen) {
                        Button(action: {
                            navigateToNextScreen = true
                        }) {
                            Text("Next")
                                .font(.headline)
                                .frame(width: 150, height: 40)
                                .padding()
                                .background(Color.black)
                                .foregroundColor(.white)
                                .cornerRadius(20)
                        }
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 20)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.white.ignoresSafeArea())
        }}}
    

struct MatchSettingView: View {
    @Binding var gameFormat: String
        let gameFormats: [String]
    var body: some View {
        VStack(spacing: 10) {
            Text("Match Setting")
                .font(.headline)
                .foregroundColor(.black)
                .padding(.top, -15)
            
            Picker("", selection: $gameFormat) {
                ForEach(gameFormats, id: \.self) { format in
                    Text(format).tag(format)
                }
            }
            .foregroundStyle(.black)
            .pickerStyle(WheelPickerStyle())
            .frame(maxWidth: .infinity)
            .frame(height: 75)
            .background(Color.clear)
            .cornerRadius(10)
            .padding(.horizontal)
            .padding(.top, -15)
        }
    }
}

struct SetsPerGameView: View {
    @Binding var selectedSet: Int
    let setOptions: [Int]
    
    var body: some View {
        VStack(spacing: 10) {
            Text("Sets Per Game")
                .font(.headline)
                .foregroundColor(.black)
            
            HStack(spacing: 2) {
                ForEach(setOptions, id: \.self) { set in
                    Button(action: { selectedSet = set }) {
                        Text("\(set)")
                        
                            .padding()
                            .frame(width: 40, height: 40)
                            .background(selectedSet == set ? Color.black : Color.gray.opacity(0.3))
                            .foregroundColor(selectedSet == set ? .white : .black)
                            .clipShape(Circle())
                    }
                }
            }
        }
    }
}

struct SetTimeView: View {
    @Binding var selectedMinutes: Int
    @Binding var selectedSeconds: Int
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Set Time")
                .font(.headline)
                .foregroundColor(.black)
                .padding(.top, 20)
            
            HStack(spacing: 20) {
                VStack {
                    Text("Minutes")
                        .font(.caption)
                        .foregroundColor(.black)
                    Picker("", selection: $selectedMinutes) {
                        ForEach(0..<60) { minute in
                            Text("\(minute)")
                        }
                    }
                    .foregroundStyle(.black)
                    .pickerStyle(WheelPickerStyle())
                    .frame(height: 70)
                    .padding(.top,-15)
                }
                
                VStack {
                    Text("Seconds")
                        .font(.caption)
                        .foregroundColor(.black)
                    Picker("", selection: $selectedSeconds) {
                        ForEach(0..<60) { second in
                            Text("\(second)")
                        }
                    }
                    .foregroundStyle(.black)
                    .pickerStyle(WheelPickerStyle())
                    .frame(height: 70)
                    .padding(.top,-15)
                }
            }
            .padding(.horizontal)
            .padding(.top,-10)
        }
    }
}

