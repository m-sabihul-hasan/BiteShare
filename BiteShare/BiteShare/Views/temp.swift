//import Foundation
//import SwiftUI
//
////@Observable
//class BiteViewModel: ObservableObject {
//    
//    // A list of `Bite` objects
//    @Published var bites = [
//        Bite(profile: Profile(name: "Sabihul", surname: "Hasan", nationality: "🇵🇰", profileImage: Image("sabih")),
//             dishName: "Biryani", description: "Delicious spicy rice", servingSize: 4, dishImage: Image("biryani")),
//        
//        Bite(profile: Profile(name: "Filippo", surname: "Caliendo", nationality: "🇮🇹", profileImage: Image("filippo")),
//             dishName: "Pizza", description: "Authentic Italian pizza", servingSize: 6, dishImage: Image("pizza")),
//        
//        Bite(profile: Profile(name: "Maria", surname: "Petrillo", nationality: "🇮🇹", profileImage: Image("maria")),
//             dishName: "Pasta", description: "Creamy Alfredo pasta", servingSize: 3, dishImage: Image("pasta")),
//        
//        Bite(profile: Profile(name: "Sakshi", surname: "Anil", nationality: "🇮🇳", profileImage: Image("sakshi")),
//             dishName: "Pasta", description: "Creamy Alfredo pasta", servingSize: 3, dishImage: Image("pasta")),
//        
//        Bite(profile: Profile(name: "Maryam", surname: "IDK", nationality: "🇮🇷", profileImage: Image("maryam")),
//             dishName: "Pasta", description: "Creamy Alfredo pasta", servingSize: 3, dishImage: Image("pasta"))
//        
//    ]
//    
//    // Optionally, track a selected bite if needed
//    @Published var selectedBite: Bite?
//    
//    // Method to add a new bite
//    func addBite(_ bite: Bite) {
//        bites.append(bite)
//    }
//    
//}
//
//struct HomeView: View {
//    
//    @State var text: String = ""
//    @State var showModal: Bool = false
//    
//    var body: some View {
//        NavigationStack{
//            ZStack {
//                ZStack {
//                    Image("bg")
//                        .resizable()
//                        .ignoresSafeArea()
//                    
//                }
//                .background(Color(hex: "#20808E"))
//                HStack{
//                    Image(systemName: "magnifyingglass")
//                        .renderingMode(.template)
//                        .resizable()
//                        .aspectRatio(contentMode: .fit)
//                        .frame(width: 18, height: 18)
//                        .foregroundColor(.white)
//                    
//                    ZStack(alignment: .leading) {
//                        if text.isEmpty {
//                            Text("Search")
//                                .bold()
//                                .foregroundColor(.white.opacity(0.6)) // Placeholder color
//                        }
//                        TextField("", text: $text)
//                            .foregroundColor(.white)
//                            .bold()
//                    }
//                    .frame(width: 300, height: 25)
//                    Image(systemName: "mic")
//                        .renderingMode(.template)
//                        .resizable()
//                        .aspectRatio(contentMode: .fit)
//                        .frame(width: 20, height: 20)
//                        .foregroundColor(.white)
//                    
//                }
//                .padding(.horizontal)
//                .padding(.vertical)
//                .background(RoundedRectangle(cornerRadius: 15, style:.continuous)
//                    .fill(.white.opacity(0.1)))
//                .offset(y: -300)
//                
//                Text("What's Special for today?")
//                    .font(.title2)
//                    .bold()
//                    .offset(y: -100)
//                
//                Button(action: {
//                    showModal.toggle()
//                }, label: {
//                    Text("Share a Bite")
//                })
//                .padding()
//                .bold()
//                .background(Color(hex: "#FF9640"))
//                .foregroundStyle(.black)
//                .cornerRadius(15)
//                .offset(y: 250)
//            }
//            .sheet(isPresented: $showModal, content: {PostBiteModal(showModal: $showModal)})
//        }
//    }
//}
//
//#Preview {
//    HomeView()
//}
