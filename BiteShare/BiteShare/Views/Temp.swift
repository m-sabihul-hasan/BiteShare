//
//
//import Foundation
//import SwiftUI
//
//struct Host: Identifiable {
//    
//    var id: UUID = UUID()
//    var profile: Profile
//    var description: String = "No Description"
//    var location: String = "No Location"
//    var attendees: [String] = []
//    var dateOfEvent: Date = Date()
//    var spot: Int = 0
//    var spotLeft: Int = 0
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
//        Profile(name: "Maryam", surname: "Jeyhaninejad", nationality: "🇮🇷", profileImage: Image("maryam"))
//    ]
//    
//    @Published var selectedProfile: Profile?
//    
//    func add(_ profile: Profile) {
//        profiles.insert(profile, at: 0)
//    }
//
//}
//
//@Observable
//class HostViewModel {
//    
//    var hosts = [
//        Host(profile: Profile(name: "Sabihul", surname: "Hasan", nationality: "🇵🇰", profileImage: Image("sabih")),
//             description: "I wanna make pasta Nerano join me if you are interested", location: "Pozzouli 354", spot: 5),
//        Host(profile: Profile(name: "Filippo", surname: "Caliendo", nationality: "🇮🇹", profileImage: Image("filippo")),
//             description: "I wanna make pasta Nerano join me if you are interested", location: "Pozzouli 354", spot: 4),
//        Host(profile: Profile(name: "Maria", surname: "Petrillo", nationality: "🇮🇹", profileImage: Image("maria")),
//             description: "I wanna make pasta Nerano join me if you are interested", location: "Pozzouli 354", spot: 3),
//        Host(profile: Profile(name: "Sakshi", surname: "Anil", nationality: "🇮🇳", profileImage: Image("sakshi")),
//             description: "I wanna make pasta Nerano join me if you are interested", location: "Pozzouli 354", spot: 2),
//        Host(profile: Profile(name: "Maryam", surname: "Jeyhaninejad", nationality: "🇮🇷", profileImage: Image("maryam")),
//             description: "I'm invincible", location: "Pozzouli 354", spot: 2)
//    ]
//    
//    func add(_ host: Host) {
//        hosts.insert(host, at: 0)
//    }
//}
//
//struct CookPartyView: View {
//    
////    var hostVM = HostViewModel()
//    @Environment(HostViewModel.self) var hostVM
//    
//    @State var showModal: Bool = false
//    
//    var body: some View {
//        
//        NavigationStack {
//            List {
//                ForEach(hostVM.hosts) { host in
//                    
//                    NavigationLink(destination: CookPartyDetailView(host: host)) {
//                        
//                        HStack {
//                            // Extract the image part to avoid inline modification
//                            let profileImage = host.profile.profileImage
//                            profileImage
//                                .resizable()
//                                .frame(width: 25, height: 30)
//                                .offset(x: -5)
//                            
//                            // Extract the text part for easier readability
//                            let partyText = "\(host.profile.name)'s Party \(host.profile.nationality)"
//                            Text(partyText)
//                                .padding(.horizontal, 3)
//                        }
//                    }
//                }
//            }
//            .sheet(isPresented: $showModal) {
//                CookPartyModal(showModal: $showModal)
//            }
//            .toolbar {
//                ToolbarItem(placement: .topBarTrailing) {
//                    Button(action: {
//                        showModal.toggle()
//                    }) {
//                        Image(systemName: "plus")
//                            .foregroundColor(.black)
//                    }
//                    .padding()
//                }
//                ToolbarItem(placement: .topBarLeading) {
//                    Text("Cook Party")
//                        .font(.title)
//                        .bold()
//                        .padding()
//                        .foregroundColor(.black)
//                }
//            }
//        }
//    }
//}
//
//
//struct CookPartyDetailView: View {
//    
//    @State var showModal: Bool = false
//    
//    var host: Host
//    
//    
//    var body: some View {
//        
//        VStack {
//            
//            Spacer()
//            
//                Text("Book \(host.profile.name)'s Party")
//                    .font(.title)
//                    .bold()
//                
//    
//                HStack{
//                    
//                    host.profile.profileImage
//                        .resizable()
//                        .scaledToFit()
//                        .scaledToFit()
//                        .frame(width: 50, height: 50)
//                        .padding(10)
//                        .clipShape(Circle()) // Clip image to circle
//                        .overlay(
//                            Circle().stroke(Color.blue.opacity(0.5), lineWidth: 4) // Add circular border
//                        )
//                        .padding()
//                    
//                    VStack{
//                        Text("\(host.profile.name) \(host.profile.surname)")
//                            .italic()
//                        
//                        Text("\(host.profile.nationality)")
//                    }
//                }
//                
//                ScrollView
//                {
//                    
//                    Text("\(host.description) \nJoin me at \(host.location) on \(host.dateOfEvent) \nAvailable slots: \(host.spot) \nAttendees: \n\(host.attendees.joined(separator: "\n"))")
//                        .lineSpacing(12)
//                        .frame(width: UIScreen.main.bounds.width - 70, alignment: .leading)
//                        .multilineTextAlignment(.leading)
//                        .padding()
//                        .background(Color.gray.opacity(0.2)) // Background color
//                        .cornerRadius(10) // Rounded corners for the background
//
//                }
//                .frame(height: 300)
//            
//            Spacer()
//            
//            Button(action: {
//                showModal.toggle()
//            }, label: {
//                Text("Book a slot")
//            })
//            .padding()
//            .bold()
//            .background(Color(hex: "#FF9640"))
//            .foregroundStyle(.black)
//            .cornerRadius(15)
//            
//            Spacer()
//            
//        }
//        .sheet(isPresented: $showModal, content: {BookPartyModal(showModal: $showModal)})
//    }
//    
//}
//
//struct BookPartyModal: View {
//    
//    @Environment(HostViewModel.self) var hostVM
//    
//    @ObservedObject var profileVM = ProfileViewModel()
//    
//    @State var count: Int = 0
//    
//    @Binding var showModal: Bool
//    
//    var body: some View {
//        NavigationStack {
//            ZStack{
//                Image("bg_new")
//                    .resizable()
//                    .ignoresSafeArea()
//                
//                Form {
//                    Section() {
//                        VStack {
//                            HStack {
//                                Spacer() // Center-align the text
//                                Text("Book a Party")
//                                    .font(.title)
//                                    .fontWeight(.bold)
//                                    .padding(.vertical)
//                                Spacer()
//                            }
//                            HStack {
//                                Spacer()
//                                VStack {
//                                    ZStack{
//                                        Circle()
//                                            .stroke(Color.blue.opacity(0.5), lineWidth: 4) // Add circular border
//                                            .frame(width: 130, height: 130) // Size of the circular section
//                                            .padding(10)
//                                        
//                                        // Profile image display in a circle
//                                        if let selectedProfile = profileVM.selectedProfile {
//                                            selectedProfile.profileImage
//                                                .resizable()
//                                            //                                            .scaledToFit()
//                                                .clipShape(Circle())
//                                                .frame(width: 110, height: 130)
//                                            
//                                            
//                                            
//                                        } else {
//                                            VStack {
//                                                Image(systemName: "person.fill.badge.plus")
//                                                    .resizable()
//                                                    .frame(width: 60, height: 60)
//                                                    .foregroundStyle(.black.opacity(0.3))
//                                                    .offset(x: 5)
//                                            }
//                                        }
//                                    }
//                                    Menu {
//                                        ForEach(profileVM.profiles) { profile in
//                                            Button("\(profile.name) \(profile.surname)") {
//                                                // Update the selected profile in the view model
//                                                profileVM.selectedProfile = profile
//                                            }
//                                        }
//                                    } label: {
//                                        Text(profileVM.selectedProfile.map { "\($0.name) \($0.surname)" } ?? "Select Profile")
//                                            .foregroundStyle(.black)
//                                    }
//                                }
//                                Spacer()
//                            }
//                        }
//                    }
//                    .listRowInsets(EdgeInsets()) // Remove default insets for a full-width appearance
//                    .background(Color(UIColor.systemGroupedBackground)) // Matches form background color
//                    
//                    Section() {
//                        HStack {
//                            Text("How many spots?")
//                            Spacer()
//                            
//                            Stepper(value: $count, in: 0...10) {
//                                // Display current count
//                                Text("\(count)")
//                                    .font(.title2)
//                                    .offset(x: 60)
//                            }
//                        }
//                    }
//                }
//                .offset(y: 160)
//                
//                Button(action: {
////                    showModal.toggle()
//                }, label: {
//                    Text("Book")
//                })
//                .frame(width: 80)
//                .padding()
//                .bold()
//                .background(Color(hex: "#FF9640"))
//                .foregroundStyle(.black)
//                .cornerRadius(15)
//                .offset(y: 250)
//            }
//            .background(Color(hex: "#20808E"))
//            .offset(y: -10)
//            
//        }
//    }
//}
