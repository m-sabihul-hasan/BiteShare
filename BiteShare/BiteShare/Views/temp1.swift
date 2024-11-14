//import Foundation
//import SwiftUI
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
//struct Bite: Identifiable {
//    
//    var id: UUID = UUID()
//    var profile: Profile
//    var dishName: String
//    var description: String = "No description"
//    var servingSize: Int = 0
//    var dishImage: Image = Image(systemName: "fork.knife.cricle")
//    
//}
//
//class ProfileViewModel: ObservableObject {
//    
//    @Published var profiles = [
//        Profile(name: "Sabihul", surname: "Hasan", nationality: "🇵🇰", profileImage: Image("sabih")),
//        Profile(name: "Filippo", surname: "Caliendo", nationality: "🇮🇹", profileImage: Image("filippo")),
//        Profile(name: "Maria", surname: "Petrillo", nationality: "🇮🇹", profileImage: Image("maria")),
//        Profile(name: "Sakshi", surname: "Anil", nationality: "🇮🇳", profileImage: Image("sakshi")),
//        Profile(name: "Maryam", surname: "IDK", nationality: "🇮🇷", profileImage: Image("maryam"))
//    ]
//    
//    @Published var selectedProfile: Profile?
//    
////    init() {
////        // Default to the first profile in the list if available
////        self.selectedProfile = profiles.first
////    }
//    
//    func add(_ profile: Profile) {
//        profiles.insert(learner, at: 0)
//    }
//
//}
//
//class BiteViewModel: ObservableObject {
//    
//    // A list of `Bite` objects
//    @Published var bites = [
//        Bite(profile: Profile(name: "Sabihul", surname: "Hasan", nationality: "🇵🇰", profileImage: Image("sabih")),
//             dishName: "Chicken Biryani", description: "Savor the rich flavors of my aromatic Chicken Biryani — a timeless blend of tender chicken, fragrant basmati rice, and a medley of spices, all slow-cooked to perfection. Each bite bursts with warmth, balanced spices, and a touch of saffron. A perfect feast for the senses, meant to be shared and enjoyed. \n\nSavor the rich flavors of my aromatic Chicken Biryani — a timeless blend of tender chicken, fragrant basmati rice, and a medley of spices, all slow-cooked to perfection. Each bite bursts with warmth, balanced spices, and a touch of saffron. A perfect feast for the senses, meant to be shared and enjoyed. \n\nSavor the rich flavors of my aromatic Chicken Biryani — a timeless blend of tender chicken, fragrant basmati rice, and a medley of spices, all slow-cooked to perfection. Each bite bursts with warmth, balanced spices, and a touch of saffron. A perfect feast for the senses, meant to be shared and enjoyed.", servingSize: 4, dishImage: Image("biryani")),
//        
//        Bite(profile: Profile(name: "Filippo", surname: "Caliendo", nationality: "🇮🇹", profileImage: Image("filippo")),
//             dishName: "Pizza Margherita", description: "Enjoy the simplicity of my homemade Pizza Margherita—a crisp, thin crust topped with rich San Marzano tomato sauce, fresh mozzarella, and fragrant basil. Each bite is pure Italian tradition, finished with a drizzle of extra-virgin olive oil for an authentic, savory experience.", servingSize: 6, dishImage: Image("pizza")),
//        
//        Bite(profile: Profile(name: "Maria", surname: "Petrillo", nationality: "🇮🇹", profileImage: Image("maria")),
//             dishName: "Pasta Carbonara", description: "Indulge in my creamy homemade Carbonara, a true Italian classic! Perfectly cooked spaghetti is enveloped in a rich, velvety sauce made from fresh eggs, Pecorino Romano, and a touch of black pepper, all brought to life with crispy bites of pancetta. No cream added—just authentic, comforting flavors that melt together in every mouthful. A dish to savor and share.", servingSize: 3, dishImage: Image("pasta")),
//        
//        Bite(profile: Profile(name: "Sakshi", surname: "Anil", nationality: "🇮🇳", profileImage: Image("sakshi")),
//             dishName: "Chicken Biryani", description: "Savor the rich flavors of my aromatic Chicken Biryani—a timeless blend of tender chicken, fragrant basmati rice, and a medley of spices, all slow-cooked to perfection. Each bite bursts with warmth, balanced spices, and a touch of saffron. A perfect feast for the senses, meant to be shared and enjoyed.", servingSize: 3, dishImage: Image("biryani")),
//        
//        Bite(profile: Profile(name: "Maryam", surname: "IDK", nationality: "🇮🇷", profileImage: Image("maryam")),
//             dishName: "Ghomerh Sabzi", description: "Delight in the authentic taste of my Ghormeh Sabzi—a beloved Persian stew bursting with tender herbs, tangy dried limes, and succulent lamb. Slowly simmered with kidney beans, this dish offers a harmony of savory and sour notes. A true taste of Iran, perfect for sharing with loved ones.", servingSize: 3, dishImage: Image("sabzi"))
//        
//    ]
//    
//
//    func addBite(_ bite: Bite) {
//        bites.insert(bite, at: 0)
//    }
//        
//}
//
//struct PostBiteModal: View {
//    
//    @StateObject var BiteVM = BiteViewModel()
//    
//    @State var selectedItem: PhotosPickerItem? = nil
//    @State var selectedImage: Image? = nil
//    
//    @State var name: String = ""
//    @State var dishName: String = ""
//    @State var description: String = ""
//    @State var count: Int = 0
//    
//    @Binding var showModal: Bool
//    
//    @StateObject var profileVM = ProfileViewModel()
//    
//    var body: some View {
//        NavigationStack{
//            Form {
//                Section {
//                    HStack {
//                        Spacer() // Center-align the text
//                        Text("Share a Bite")
//                            .font(.title)
//                            .fontWeight(.bold)
//                            .padding(.vertical)
//                        Spacer()
//                    }
//                }
//                .listRowInsets(EdgeInsets()) // Remove default insets for a full-width appearance
//                .background(Color(UIColor.systemGroupedBackground)) // Matches form background color
//                .frame(height: 10)
//                
//                Section()
//                {
//                    PhotosPicker(
//                        selection: $selectedItem,
//                        matching: .images,
//                        photoLibrary: .shared()
//                    ){
//                        HStack {
//                            Text("Select Image")
//                                .foregroundStyle(Color.black.opacity(0.3))
//                            //                                .font(.title3)
//                            Image(systemName: "photo.badge.plus")
//                                .resizable()
//                                .frame(width: 25, height: 20)
//                                .foregroundStyle(.black.opacity(0.3))
//                                .offset(x: 190)
//                        }
//                    }
//                    .onChange(of: selectedItem) {
//                        Task {
//                            // Load image data if an item is selected
//                            if let selectedItem,
//                               let data = try? await selectedItem.loadTransferable(type: Data.self),
//                               let uiImage = UIImage(data: data) {
//                                // Convert UIImage to SwiftUI Image
//                                selectedImage = Image(uiImage: uiImage)
//                            }
//                        }
//                    }
//                    
//                    // Display the selected image if available
//                    if let selectedImage {
//                        selectedImage
//                            .resizable()
//                            .scaledToFit()
//                            .frame(height: 200)
//                    }
//                }
//                .frame(minWidth: 0, minHeight: 50, maxHeight: .infinity)
//                
//                
//                Section() {
//                    Menu {
//                        ForEach(profileVM.profiles) { profile in
//                            Button("\(profile.name) \(profile.surname)") {
//                                // Update the selected profile in the view model
//                                profileVM.selectedProfile = profile
//                            }
//                        }
//                    } label: {
//                        Text(profileVM.selectedProfile.map { "\($0.name) \($0.surname)" } ?? "Select Profile")
//                            .foregroundStyle(.black)
//                            .bold()
//                    }
//                }
//                
//                Section() {
//                    TextField("Name of Dish", text: $dishName)
//                }
//                Section() {
//                    TextField("Description", text: $description)
//                }
//                Section() {
//                    HStack {
//                        Text("Serving Size")
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
////                        let newBite = Bite()
////                        BiteVM.add(newBite)
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
