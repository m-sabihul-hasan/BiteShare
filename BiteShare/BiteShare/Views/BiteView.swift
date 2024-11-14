//
//  HomeView.swift
//  BiteShare
//
//  Created by Muhammad Sabihul Hasan on 08/11/24.
//

import SwiftUI



struct BiteView: View {
    
    @State var text: String = ""
    @State var showModal: Bool = false
    @ObservedObject var biteVM = BiteViewModel()
    @State private var currentIndex = 0
    
    var body: some View {
        NavigationStack{
            ZStack{
                Image("bg")
                    .resizable()
                    .ignoresSafeArea()
                
                VStack{
                    
                    searchBar
                        .padding(.horizontal)
                        .padding(.vertical)
                        .background(RoundedRectangle(cornerRadius: 15, style:.continuous)
                            .fill(.white.opacity(0.1)))
                        .offset(y: -100)
                    
                    
                    Text("What's Special for today?")
                        .font(.title2)
                        .bold()
                        .offset(y: -20)
                    
                    // Carousel with scaling
                    carouselView
                    
                    // Dish name and nationality indicator
                    if !biteVM.bites.isEmpty {
                        let selectedBite = biteVM.bites[currentIndex]
                        HStack {
                            Text(selectedBite.dishName)
                                .font(.title3)
                                .bold()
                                .padding(.top, 10)
                            
                            Text(selectedBite.profile.nationality)
                                .font(.title)
                        }
                    }
                    
                    // Pagination dots
                    paginationDots
                    
                    Button(action: {
                        showModal.toggle()
                    }, label: {
                        Text("Share a Bite")
                    })
                    .padding()
                    .bold()
                    .background(Color(hex: "#FF9640"))
                    .foregroundStyle(.black)
                    .cornerRadius(15)
                    .offset(y: 20)
                }
                .offset(y: 100)
                .sheet(isPresented: $showModal, content: {PostBiteModal(showModal: $showModal)})
            }
            .background(Color(hex: "#20808E"))
            .offset(y: -80)
        }
        
    }
    
    private var carouselView: some View {
        TabView(selection: $currentIndex) {
            ForEach(biteVM.bites.indices, id: \.self) { index in
                GeometryReader { geometry in
                    let scale = getScale(geometry: geometry) // Call the helper function
                    let bite = biteVM.bites[index]
                                        
                    NavigationLink(destination: BiteDetailView(bite: bite)) {
                        
                        bite.dishImage
                            .resizable()
                            .scaledToFill()
                            .frame(width: index == currentIndex ? 280 : 240, height: index == currentIndex ? 280 : 240)
                            .clipped()
                            .cornerRadius(15)
                            .shadow(radius: 5)
                            .scaleEffect(scale)
                            .opacity(index == currentIndex ? 1 : 0.5)
                            .animation(.easeInOut(duration: 0.5), value: currentIndex)
                            .offset(x: index == currentIndex ? 0 : (index < currentIndex ? -40 : 40))
                    }
                }
//                .padding(.horizontal, 15) // Add padding to ensure side images are partially visible
                .frame(width: UIScreen.main.bounds.width * 0.7) // Narrow the frame to show partial side images
                .tag(index)
            }
        }
        .frame(width: UIScreen.main.bounds.width, height: 280)
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        .padding(.horizontal, 32) // More padding for centered alignment
    }
    private var paginationDots: some View {
        HStack(spacing: 8) {
            ForEach(biteVM.bites.indices, id: \.self) { index in
                Circle()
                    .fill(index == currentIndex ? Color.blue : Color.gray.opacity(0.3))
                    .frame(width: 8, height: 8)
            }
        }
        .padding(.top, 10)
    }
    
    // Helper function to calculate scale based on position
    private func getScale(geometry: GeometryProxy) -> CGFloat {
        let midX = geometry.frame(in: .global).midX
        let screenWidth = UIScreen.main.bounds.width
        let scale = max(0.7, 1 - abs(midX - screenWidth / 2) / 300)
        return scale
    }
    
    private var searchBar: some View {
        HStack{
            Image(systemName: "magnifyingglass")
                .renderingMode(.template)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 18, height: 18)
                .foregroundColor(.white)
            
            ZStack(alignment: .leading) {
                if text.isEmpty {
                    Text("Search")
                        .bold()
                        .foregroundColor(.white.opacity(0.6)) // Placeholder color
                }
                TextField("", text: $text)
                    .foregroundColor(.white)
                    .bold()
            }
            .frame(width: 300, height: 25)
            Image(systemName: "mic")
                .renderingMode(.template)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 20, height: 20)
                .foregroundColor(.white)
            
        }
    }
}

#Preview {
    BiteView()
}

