import SwiftUI

struct GameSettingsView: View {
    @State private var gameFormat = "Singles"
    let gameFormats = ["Singles", "Doubles"]
    
    @State private var selectedSet: Int = 3
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
                                .foregroundColor(.white)
                            
                                .frame(width: 200, height: 52)
                                .background(Color(red: 228/255, green: 0/255, blue: 132/255)
                                .cornerRadius(15))
                        }
                    }
                    .buttonStyle(PlainButtonStyle())
                    .padding(.horizontal)
                    .padding(.bottom, 20)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.black.ignoresSafeArea())
        }}}
    

struct MatchSettingView: View {
    @Binding var gameFormat: String
        let gameFormats: [String]
    var body: some View {
        VStack(spacing: 10) {
            Text("Match Setting")
                .font(.headline)
                .foregroundColor(.white)
                .padding(.top, -15)
            
            Picker("", selection: $gameFormat) {
                ForEach(gameFormats, id: \.self) { format in
                    Text(format).tag(format)
                }
            }
            .foregroundStyle(.white)
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
                .foregroundColor(.white)

            HStack(spacing: 5) { // Adjust spacing for cleaner layout
                ForEach(setOptions, id: \.self) { set in
                    Button(action: { selectedSet = set }) {
                        Text("\(set)")
                            .font(.headline) // Adjust font size as needed
                            .frame(width: 45, height: 45) // Keep the button size consistent
                            .foregroundColor(selectedSet == set ? .white : .black)
                            .background(selectedSet == set
                                ? Color(red: 228/255, green: 0/255, blue: 132/255) // Pink for selected
                                : Color.gray // Fully gray for unselected
                            )
                            .clipShape(Circle()) // Ensure the button is perfectly circular
                    }
                    .buttonStyle(PlainButtonStyle()) 
                }
            }
        }
    }
}




struct SetTimeView: View {
    @Binding var selectedMinutes: Int
    @Binding var selectedSeconds: Int

    var body: some View {
        VStack(spacing: 1) {
            Text("Set Time")
                .font(.headline)
                .foregroundColor(.white)
                .padding(.top, 20)
            
            Picker(selection: Binding(
                get: {
                    selectedMinutes * 60 + selectedSeconds
                },
                set: { newValue in
                    selectedMinutes = newValue / 60
                    selectedSeconds = newValue % 60
                }
            ), label: Text("")) {
                ForEach(0..<(60 * 60)) { totalSeconds in
                    // Format the display as "MM : SS"
                    let minutes = totalSeconds / 60
                    let seconds = totalSeconds % 60
                    Text(String(format: "%02d          :          %02d", minutes, seconds))
                        .tag(totalSeconds)
                }
            }
            
            .foregroundStyle(.white)
            .pickerStyle(WheelPickerStyle())
            .frame(height: 100)
            .frame(width:180)
            .clipped()
        }
    }
}

