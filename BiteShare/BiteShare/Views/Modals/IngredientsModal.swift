//
//  IngredientsView.swift
//  BiteShare
//
//  Created by Muhammad Sabihul Hasan on 18/11/24.
//

import SwiftUI

struct IngredientsModal: View {

    @Binding var bite: Bite
    
    var body: some View {
        
        VStack{
            ZStack{
                Image("bg_new")
                    .resizable()
                    .ignoresSafeArea()
                
                VStack {
                    Spacer()
                    
                    Text("Ingredients")
                        .font(.title2)
                        .bold()
                        .foregroundStyle(Color(hex: "#FF9640"))
                    
                    ScrollView
                    {
                        
                        Text(bite.ingredients)
                            .italic()
                            .lineSpacing(6)
                            .frame(width: UIScreen.main.bounds.width - 70, alignment: .leading)
                            .multilineTextAlignment(.leading)
                            .padding()
                            .background(Color.gray.opacity(0.2)) // Background color
                            .cornerRadius(10) // Rounded corners for the background
                        
                    }
                    .frame(height: 350)
                    .offset(y: 10)
                    
                    
                    Spacer()
                    
                }
                .offset(y: 30)
            }
            .background(Color(hex: "#20808E"))
            .offset(y: -10)
        }
    }
}

#Preview {
    let mockBite = Bite(profile: Profile(name: "Filippo", surname: "Caliendo", nationality: "🇮🇹", profileImage: Image("filippo")),
                        dishName: "Pizza Margherita",
                        description: "Enjoy the simplicity of my homemade Pizza Margherita—a crisp, thin crust topped with rich San Marzano tomato sauce, fresh mozzarella, and fragrant basil. Each bite is pure Italian tradition, finished with a drizzle of extra-virgin olive oil for an authentic, savory experience.",
                        ingredients: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. \nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. \nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                        servingSize: 6, portionsLeft: 6, attendees: ["Sabih", "Maryam", "Sakshi"], dishImage: Image("pizza"))
    IngredientsModal(bite: .constant(mockBite))
}
