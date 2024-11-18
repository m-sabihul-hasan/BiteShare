////
////  HomeView.swift
////  BiteShare
////
////  Created by Muhammad Sabihul Hasan on 08/11/24.
////
//
//
//import SwiftUI
//
//struct BiteView: View {
//    
//    @State var text: String = ""
//    @State var showModal: Bool = false
//    @State private var scrollPosition: Int?
//    @State private var itemsArray: [[Bite]] = []
//    @State private var autoScrollEnabled: Bool = false
//    
//    @Environment(BiteViewModel.self) var biteVM
//
//    private let pageWidth: CGFloat = 250
//    private let pageHeight: CGFloat = 350
//    private let animationDuration: CGFloat = 0.3
//    private let secondsPerSlide: CGFloat = 1.0
//    private let animation: Animation = .default
//    
//    var body: some View {
//        NavigationStack{
//                VStack{
//                    HStack{
//                        Text("Today's Special")
//                            .font(.largeTitle)
//                            .bold()
//                            .padding(.horizontal, 25)
//                        
//                        Spacer()
//                        
//                        Button(action: {
//                            showModal.toggle()
//                        }, label: {
//                            Image(systemName: "plus")
//                                .resizable()
//                                .scaledToFit()
//                                .frame(width: 24, height: 24)
//                        })
//                        .foregroundStyle(Color(hex: "#FF9640"))
//                        .padding(.horizontal, 25)
//                    }
//                    
//                    searchBar
//                        .padding(.horizontal, 10)
//                        .padding(.vertical)
//                        .background(RoundedRectangle(cornerRadius: 15, style: .continuous)
//                            .fill(.black.opacity(0.1)))
//                        .offset(y: 20)
//                    
//                    // Carousel with scaling and infinite scrolling
//                    carouselView
//                    
//                    // Dish name and nationality indicator
//                    if let currentIndex = scrollPosition,
//                       !biteVM.bites.isEmpty {
//                        let index = currentIndex % biteVM.bites.count
//                        let selectedBite = biteVM.bites[index]
//                        HStack {
//                            Text(selectedBite.dishName)
//                                .font(.title3)
//                                .bold()
//                                .padding(.top, 10)
//                            
//                            Text(selectedBite.profile.nationality)
//                                .font(.title)
//                        }
//                    }
//                    
//                    // Pagination dots
//                    paginationDots
//                }
//                .offset(y: -10)
//                .sheet(isPresented: $showModal, content: { PostBiteModal(showModal: $showModal) })
//        }
//        .onAppear {
//            self.itemsArray = [biteVM.bites, biteVM.bites, biteVM.bites]
//            self.scrollPosition = biteVM.bites.count
//        }
//    }
//    
//    private var carouselView: some View {
//        let bitesFlat = itemsArray.flatMap { $0.map { $0 } }
//        let widthDifference = UIScreen.main.bounds.width - pageWidth
//
//        return ScrollView(.horizontal, showsIndicators: false) {
//            HStack(spacing: 2) { // Reduced spacing for closer images
//                ForEach(0..<bitesFlat.count, id: \.self) { index in
//                    let bite = bitesFlat[index]
//                    
//                    GeometryReader { geometry in
//                        // Calculate the scale and opacity based on position
//                        let scale = getScale(geometry: geometry)
//                        
//                        // Calculate the position of the image relative to the screen center
//                        let midX = geometry.frame(in: .global).midX
//                        let screenWidth = UIScreen.main.bounds.width
//                        let distanceFromCenter = abs(midX - screenWidth / 2)
//                        let opacity = distanceFromCenter < 50 ? 1.0 : 0.4 // Full opacity for center, reduced for others
//                        
//                        // Adjust the size of the central image
//                        let isCentralImage = distanceFromCenter < 50
//                        let imageWidth = isCentralImage ? pageWidth + 20: pageWidth + 20 // Central image is larger
//                        let imageHeight = isCentralImage ? pageHeight : pageHeight + 20  // Adjust height accordingly
//                        
//                        NavigationLink(destination: BiteDetailView(bite: bite)) {
//                            bite.dishImage
//                                .resizable()
//                                .scaledToFill()
//                                .frame(width: imageWidth, height: imageHeight)
//                                .clipped()
//                                .cornerRadius(15)
//                                .shadow(radius: 5)
//                                .scaleEffect(scale)
//                                .offset(x: -10)
//                                .opacity(opacity)  // Apply the opacity to the side images
//                                .animation(.easeInOut, value: scrollPosition)
//                        }
//                    }
//                    .frame(width: pageWidth) // Define fixed width for each item
//                }
//                .padding(.horizontal, 1) // Optional: Adjust padding if needed
//            }
//            .scrollTargetLayout()
//        }
//        .contentMargins(widthDifference / 2, for: .scrollContent)
//        .scrollTargetBehavior(.viewAligned)
//        .frame(height: pageHeight * 1.3)
//        .scrollPosition(id: $scrollPosition, anchor: .center)
//        .scrollIndicators(.hidden)
//        .onChange(of: scrollPosition) {
//            guard let scrollPosition = scrollPosition else { return }
//            let itemCount = biteVM.bites.count
//            
//            // Last item of the first bites array
//            if scrollPosition / itemCount == 0 && scrollPosition % itemCount == itemCount - 1 {
//                DispatchQueue.main.asyncAfter(deadline: .now() + animationDuration) {
//                    itemsArray.removeLast()
//                    itemsArray.insert(biteVM.bites, at: 0)
//                    self.scrollPosition = scrollPosition + itemCount
//                }
//                return
//            }
//            
//            // First item of the last bites array
//            if scrollPosition / itemCount == 2 && scrollPosition % itemCount == 0 {
//                DispatchQueue.main.asyncAfter(deadline: .now() + animationDuration) {
//                    itemsArray.removeFirst()
//                    itemsArray.append(biteVM.bites)
//                    self.scrollPosition = scrollPosition - itemCount
//                }
//                return
//            }
//            
//            DispatchQueue.main.asyncAfter(deadline: .now() + secondsPerSlide) {
//                if autoScrollEnabled {
//                    withAnimation(animation) {
//                        self.scrollPosition = scrollPosition + 1
//                    }
//                }
//            }
//        }
//    }
//    
//    private var paginationDots: some View {
//        HStack(spacing: 5) {
//            ForEach(0..<biteVM.bites.count, id: \.self) { index in
//                Button(action: {
//                    withAnimation(animation) {
//                        scrollPosition = index + biteVM.bites.count
//                    }
//                }, label: {
//                    Circle()
//                        .fill(Color.gray.opacity(
//                            (index == (scrollPosition ?? 0) % biteVM.bites.count) ? 0.8 : 0.3
//                        ))
//                        .frame(width: 8, height: 8)
//                })
//            }
//        }
//    }
//    
//    private func getScale(geometry: GeometryProxy) -> CGFloat {
//        let midX = geometry.frame(in: .global).midX
//        let screenWidth = UIScreen.main.bounds.width
//        let scale = max(0.7, 1 - abs(midX - screenWidth / 2) / 300)
//        return scale
//    }
//    
//    private var searchBar: some View {
//        HStack {
//            Image(systemName: "magnifyingglass")
//                .renderingMode(.template)
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//                .foregroundStyle(.black)
//                .frame(width: 20, height: 20)
//                .foregroundColor(.white)
//            
//
//                TextField("Search", text: $text)
//                    .foregroundColor(.black)
//                    .bold()
//                    .frame(width: 280, height: 20)
//            
//            Image(systemName: "mic")
//                .renderingMode(.template)
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//                .foregroundStyle(.black)
//                .frame(width: 20, height: 20)
//                .foregroundColor(.white)
//        }
//    }
//}
//
//#Preview {
//    BiteView().environment(BiteViewModel()).environment(HostViewModel()).environmentObject(ProfileViewModel())
//}
//
//
//
