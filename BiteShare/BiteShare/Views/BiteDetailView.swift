//
//  BiteDetailView.swift
//  BiteShare
//
//  Created by Muhammad Sabihul Hasan on 14/11/24.
//

import SwiftUI

enum ActiveSheet: Identifiable {
    case ingredients
    case booking
    
    var id: Int {
            switch self {
            case .ingredients: return 1
            case .booking: return 2
            }
        }
}

struct BiteDetailView: View {
    
    @State var activeSheet: ActiveSheet? = nil
    @State var bite: Bite
    @State var showAlert: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                ZStack {
                    
                    bite.dishImage
                        .resizable()
                        .scaledToFill()
                        .frame(width: UIScreen.main.bounds.width, height: 350)
                        .cornerRadius(15)
                    
                    VStack {
                        Spacer()
                        HStack {
                            
                            Text(bite.dishName)
                                .font(.title)
                                .foregroundStyle(.white)
                                .bold()
                                .padding(.vertical, 10)
                            
                            Spacer()
                        }
                        .padding(.horizontal, 10)
                    }
                    .padding(.vertical, 30)
                    
                }
                
                HStack {
                    Image(systemName: "person.fill")
                        .resizable()
                        .frame(width: 18, height: 18)
                        .foregroundStyle(Color(hex: "#FF9640"))
                    
                    Text("\(bite.profile.name) \(bite.profile.surname)")
                        .foregroundStyle(Color(hex: "#FF9640"))
                    
                    Spacer()
                    
                    Text(bite.profile.nationality)
                        .font(.title)
                    
                    Spacer()
                    
                    Text("# \(bite.servingSize) Portions")
                        .foregroundStyle(Color(hex: "#FF9640"))
                    
                    
                }
                .padding(.horizontal, 20)
                .offset(y: -10)
                
                ScrollView
                {
                    Text(bite.description)
                        .frame(width: UIScreen.main.bounds.width - 40, alignment: .leading)
                        .multilineTextAlignment(.leading)
                        .lineLimit(nil)
                        .padding()
                    
                    Text("Attendees:\n\(bite.attendees.joined(separator: "\n"))")
                        .bold()
                        .frame(width: UIScreen.main.bounds.width - 40, alignment: .leading)
                        .multilineTextAlignment(.leading)
                        .padding()
                    
                    
                    
                }
                .frame(height: 200)
                .padding()
                .offset(y: -30)
                
                
                Spacer()
                
                HStack {
                    Spacer()
                    
                    Button("Ingredients")
                    {
                        activeSheet = .ingredients
//                        showModal.toggle()
                    }
                    .frame(width: 100, height: 20)
                    .padding()
                    .bold()
                    .foregroundStyle(Color(hex: "#FF9640"))
                    .cornerRadius(15)
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(Color(hex: "#FF9640"), lineWidth: 2)
                    )
                    
                    
                    Spacer()
                    
                    Button("Book")
                    {
                        if bite.portionsLeft > 0 {
                            activeSheet = .booking
//                            showModal.toggle()
                        }
                        else {
                            showAlert = true
                        }
                    }
                    .frame(width: 100, height: 20)
                    .padding()
                    .bold()
                    .background(bite.portionsLeft != 0 ? Color(hex: "#FF9640") : Color.gray.opacity(0.5))
                    //                    .background(Color(hex: "#FF9640"))
                    .foregroundStyle(.black)
                    .cornerRadius(15)
//                    .disabled(bite.portionsLeft == 0)
                    
                    Spacer()
                    
                }
                .offset(y: -20)
                
                Spacer()
            }
            .sheet(item: $activeSheet) { sheet in
                switch sheet {
                case .ingredients:
                    IngredientsModal(bite: $bite)
                case .booking:
                    BookBiteModal(activeSheet: $activeSheet, bite: $bite)
                }
            }

            .alert("Limit Reached", isPresented: $showAlert) {
                Button("OK", role: .cancel) {} // Default OK button for the alert
            } message: {
                Text("All portions have been booked.")
            }
            
        }
        .toolbar(.hidden, for: .tabBar)
    }
}

#Preview {
    BiteDetailView(bite: Bite(profile: Profile(name: "Sabihul", surname: "Hasan", nationality: "🇵🇰", profileImage: Image("sabih")),
                              dishName: "Chicken Biryani", description: "Savor the rich flavors of my aromatic Chicken Biryani — a timeless blend of tender chicken, fragrant basmati rice, and a medley of spices, all slow-cooked to perfection. Each bite bursts with warmth, balanced spices, and a touch of saffron. A perfect feast for the senses, meant to be shared and enjoyed. \n\nSavor the rich flavors of my aromatic Chicken Biryani — a timeless blend of tender chicken, fragrant basmati rice, and a medley of spices, all slow-cooked to perfection. Each bite bursts with warmth, balanced spices, and a touch of saffron. A perfect feast for the senses, meant to be shared and enjoyed. \n\nSavor the rich flavors of my aromatic Chicken Biryani — a timeless blend of tender chicken, fragrant basmati rice, and a medley of spices, all slow-cooked to perfection. Each bite bursts with warmth, balanced spices, and a touch of saffron. A perfect feast for the senses, meant to be shared and enjoyed.",
                              ingredients: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                              servingSize: 4, portionsLeft: 3, attendees: ["Sabih" , "Maria", "Filippo"], dishImage: Image("biryani"))).environment(BiteViewModel())
}
