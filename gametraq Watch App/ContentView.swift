import SwiftUI

struct ContentView: View {
    @State private var digit1: Int = 0
    @State private var digit2: Int = 0
    @State private var digit3: Int = 0
    @State private var navigateToGameSettings = false

    var body: some View {
        NavigationStack {
            VStack {
                Text("Court Number")
                    .foregroundStyle(.black)
                    .font(.headline)
                    
                HStack {
                    Picker("", selection: $digit1) {
                        ForEach(0...9, id: \.self) { Text("\($0)") }
                    }
                    .pickerStyle(WheelPickerStyle())
                    .foregroundStyle(.black)
                    .frame(width: 65, height: 70)

                    Picker("", selection: $digit2) {
                        ForEach(0...9, id: \.self) { Text("\($0)") }
                    }
                    .pickerStyle(WheelPickerStyle())
                    .foregroundStyle(.black)
                    .frame(width: 65, height: 70)

                    Picker("", selection: $digit3) {
                        ForEach(0...9, id: \.self) { Text("\($0)") }
                    }
                    .pickerStyle(WheelPickerStyle())
                    .foregroundStyle(.black)
                    .frame(width: 65, height: 70)
                }
                Spacer()
                
                Button(action: {
                                    navigateToGameSettings = true
                                })
                
                {
                                    Text("Next")
                                        .foregroundColor(.white)
                                    
                                        .padding()
                                        .frame(width: 200, height: 50)
                                        .background(Color.black)
                                        .cornerRadius(20)
                                }
                            }
                            .background(Color.white)
                            .navigationDestination(isPresented: $navigateToGameSettings) {
                                // Make sure GameSettingsView is defined
                                GameSettingsView()
            }
        }
    }
}

#Preview {
    ContentView()
}

