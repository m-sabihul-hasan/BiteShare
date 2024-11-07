import SwiftUI

struct DropdownPickerView: View {
    @State private var selectedOption: String? // Use Optional String to track selection
    let options = ["Option 1", "Option 2", "Option 3", "Option 4"]

    var body: some View {
        NavigationStack {
            VStack {
                Picker("Select an option", selection: $selectedOption) {
                    ForEach(options, id: \.self) { option in
                        Text(option).tag(option)
                    }
                }
                .pickerStyle(MenuPickerStyle())
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
            }
            .navigationTitle("Dropdown Picker")
            .padding()
            // Automatically navigate when selectedOption changes
            .navigationDestination(isPresented: Binding(
                get: { selectedOption != nil }, // Navigation is triggered when an option is selected
                set: { if !$0 { selectedOption = nil } } // Reset selectedOption when navigating back
            )) {
                NextPageView() // Navigate to NextPageView
            }
            .onChange(of: selectedOption){
                
            }
        }
    }
}

struct NextPageView: View {
    var body: some View {
        VStack {
            Text("Welcome to the next page!")
                .font(.largeTitle)
                .bold()
                .padding()
        }
        .navigationTitle("Next Page")
    }
}
