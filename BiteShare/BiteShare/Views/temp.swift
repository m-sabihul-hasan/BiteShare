//
//import SwiftUI
//import PhotosUI
//
//
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
//struct Host: Identifiable {
//    
//    var id: UUID = UUID()
//    var profile: Profile
//    var description: String = "No Description"
//    var location: String = "No Location"
//    var dateOfEvent: Date = Date()
//    var spot: Int = 0
//    
//}
//
//
//class HostViewModel {
//    
//    var hosts = [
//        Host(profile: Profile(name: "Sabihul", surname: "Hasan", nationality: "🇵🇰", profileImage: Image("boy")),
//             description: "I wanna make pasta Nerano join me if you are interested", location: "Pozzouli 354", spot: 5),
//        Host(profile: Profile(name: "Filippo", surname: "Caliendo", nationality: "🇮🇹", profileImage: Image("boy")),
//             description: "I wanna make pasta Nerano join me if you are interested", location: "Pozzouli 354", spot: 4),
//        Host(profile: Profile(name: "Maria", surname: "Petrillo", nationality: "🇮🇹", profileImage: Image("girl")),
//             description: "I wanna make pasta Nerano join me if you are interested", location: "Pozzouli 354", spot: 3),
//        Host(profile: Profile(name: "Sakshi", surname: "Anil", nationality: "🇮🇳", profileImage: Image("girl")),
//             description: "I wanna make pasta Nerano join me if you are interested", location: "Pozzouli 354", spot: 2),
//        Host(profile: Profile(name: "Maryam", surname: "IDK", nationality: "🇮🇷", profileImage: Image("girl")),
//             description: "I'm invincible", location: "Pozzouli 354", spot: 2)
//    ]
//    
//    func add(_ host: Host) {
//        hosts.insert(host, at: 0)
//    }
//}
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
//            VStack {
//                
//                Text("Book \(host.name)'s Party")
//                    .font(.title)
//                    .bold()
//                
//                HStack{
//                    
//                    host.profileImage
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
//                        Text("\(host.name) \(host.surname)")
//                            .italic()
//                        
//                        Text("\(host.nationality)")
//                    }
//                }
//                
//                Text("\(host.description) \nJoin me at \(host.location) on \(host.dateOfEvent) \nAvailable slots: \(host.spot)")
//                    .lineSpacing(12)
//                    .padding()
//                    .background(Color.gray.opacity(0.2)) // Background color
//                    .cornerRadius(10) // Rounded corners for the background
//                    .padding(.horizontal, 30)
//                
//            }
//            .offset(y: -130)
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
//            .offset(y: 50)
//        }
//        .sheet(isPresented: $showModal, content: {PostBiteModal(showModal: $showModal)})
//    }
//    
//}
