//
//
//import Foundation
//import SwiftUI
//import PhotosUI
//
//struct Profile: Identifiable {
//    
//    var id: UUID = UUID()
//    var name: String
//    var surname: String
//    var nationality: String = "🇪🇺"
//    var profileImage: Image = Image("noimage")
//    
//}
//
////@Observable
//class ProfileViewModel: ObservableObject{
//    
//    @Published var profiles = [
//        Profile(name: "Sabihul", surname: "Hasan", nationality: "🇵🇰", profileImage: Image("boy")),
//        Profile(name: "Filippo", surname: "Caliendo", nationality: "🇮🇹", profileImage: Image("boy")),
//        Profile(name: "Maria", surname: "Petrillo", nationality: "🇮🇹", profileImage: Image("girl")),
//        Profile(name: "Sakshi", surname: "Anil", nationality: "🇮🇳", profileImage: Image("girl")),
//        Profile(name: "Maryam", surname: "IDK", nationality: "🇮🇷", profileImage: Image("girl"))
//    ]
//    
//    @Published var selectedProfile: Profile?
//    
//    init() {
//        // Default to the first profile in the list if available
//        self.selectedProfile = profiles.first
//    }
//}
//
//struct CookPartyModal: View {
//    
//    @StateObject var profileVM = ProfileViewModel()
//    
//    @State var selectedItem: PhotosPickerItem? = nil
//    @State var selectedImage: Image? = nil
//    
//    @State var dateOfEvent: Date = Date()
//    @State var dishName: String = ""
//    @State var description: String = ""
//    @State var count: Int = 0
//    
//    @Binding var showModal: Bool
//    
//    var body: some View {
//        NavigationStack{
//            Form {
//                Section {
//                    HStack {
//                        Spacer() // Center-align the text
//                        Text("Host a Party")
//                            .font(.title)
//                            .fontWeight(.bold)
//                            .padding(.vertical)
//                        Spacer()
//                    }
//                    ZStack{
//                        
//                        Circle()
//                            .stroke(Color.blue.opacity(0.5), lineWidth: 4) // Add circular border
//                            .frame(width: 120, height: 120) // Size of the circular section
//                            .padding(10)
//                        
//                        // Profile image display in a circle
//                        if let selectedProfile = profileVM.selectedProfile {
//                            selectedProfile.profileImage
//                                .resizable()
//                                .scaledToFill()
//                                .frame(width: 100, height: 100)
//                                .clipShape(Circle())
//                            
//                        } else {
//                            VStack {
//                                Image(systemName: "person.fill.badge.plus")
//                                    .resizable()
//                                    .frame(width: 60, height: 60)
//                                    .foregroundStyle(.black.opacity(0.3))
//                                    .offset(x: 5)
//                            }
//                        }
//                    }
//                        Menu {
//                            ForEach(profileVM.profiles, id: \.name) { profile in
//                                Button(profile.name) {
//                                    // Update the selected profile
//                                    profileVM.selectedProfile = profile
//                                }
//                            }
//                        } label: {
//                            Text("Select Profile")
//                                .font(.headline)
//                        }
//                }
//                .listRowInsets(EdgeInsets()) // Remove default insets for a full-width appearance
//                .background(Color(UIColor.systemGroupedBackground)) // Matches form background color
//                //                .frame(width: .infinity, height: 10)
//                
//                
//                Section() {
//                    
//                    DatePicker(
//                        "When?",
//                        selection: $dateOfEvent,
//                        in: Date()..., // You can set a minimum date here if needed
//                        displayedComponents: [.date, .hourAndMinute] // Show both date and time
//                    )
//                    //                    .datePickerStyle(WheelDatePickerStyle()) // Style (optional, can change)
//                }
//                
//                Section() {
//                    TextField("Where", text: $dishName)
//                }
//                Section() {
//                    TextField("Description", text: $description)
//                }
//                Section() {
//                    HStack {
//                        Text("How many spots?")
//                        Spacer()
//                        
//                        Stepper(value: $count, in: 0...10) {
//                            // Display current count
//                            Text("\(count)")
//                                .font(.title2)
//                                .offset(x: 60)
//                        }
//                    }
//                }
//                
//            }
//            //            .navigationTitle("Share a Bite?")
//            //            .navigationBarTitleDisplayMode(.large)
//            .toolbar {
//                ToolbarItem(placement: .topBarLeading) {
//                    Button("Cancel") {
//                        showModal.toggle()
//                    }
//                }
//                ToolbarItem(placement: .topBarTrailing) {
//                    Button("Add") {
//                        showModal.toggle()
//                    }
//                }
//            }
//            
//        }
//    }
//}
//    
//    
//    #Preview {
//        temp1()
//    }
