import SwiftUI

struct BiteView: View {
    @State var text: String = ""
    @State var showModal: Bool = false
    @State private var scrollPosition: Int?
    @State private var itemsArray: [[Bite]] = []
    @State private var autoScrollEnabled: Bool = false

    @Environment(BiteViewModel.self) var biteVM

    private let pageWidth: CGFloat = 250
    private let pageHeight: CGFloat = 350
    private let animationDuration: CGFloat = 0.3
    private let secondsPerSlide: CGFloat = 1.0
    private let animation: Animation = .default

    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Text("Today's Special")
                        .font(.largeTitle)
                        .bold()
                        .padding(.horizontal, 25)

                    Spacer()

                    Button(action: {
                        showModal.toggle()
                    }, label: {
                        Image(systemName: "plus")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                    })
                    .foregroundStyle(Color(hex: "#FF9640"))
                    .padding(.horizontal, 25)
                }

                searchBar
                    .padding(.horizontal, 10)
                    .padding(.vertical)
                    .background(RoundedRectangle(cornerRadius: 15, style: .continuous)
                        .fill(.black.opacity(0.1)))
                    .offset(y: 20)

                // Carousel with scaling and infinite scrolling
                carouselView

                // Dish name and nationality indicator
                if let currentIndex = scrollPosition,
                   !filteredBites.isEmpty {
                    let index = currentIndex % filteredBites.count
                    let selectedBite = filteredBites[index]
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
            }
            .offset(y: -10)
            .sheet(isPresented: $showModal, content: { PostBiteModal(showModal: $showModal) })
        }
        .onAppear {
            updateItemsArray()
            self.scrollPosition = filteredBites.count
        }
        .onChange(of: text) {
            updateItemsArray()
        }
        .onChange(of: biteVM.bites) {
            updateItemsArray()
        }
    }

    private var carouselView: some View {
        let bitesFlat = itemsArray.flatMap { $0.map { $0 } }
        let widthDifference = UIScreen.main.bounds.width - pageWidth

        return ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 2) {
                ForEach(0..<bitesFlat.count, id: \.self) { index in
                    let bite = bitesFlat[index]

                    GeometryReader { geometry in
                        let scale = getScale(geometry: geometry)
                        let midX = geometry.frame(in: .global).midX
                        let screenWidth = UIScreen.main.bounds.width
                        let distanceFromCenter = abs(midX - screenWidth / 2)
                        let opacity = distanceFromCenter < 50 ? 1.0 : 0.4
                        let isCentralImage = distanceFromCenter < 50
                        let imageWidth = isCentralImage ? pageWidth + 20 : pageWidth + 20
                        let imageHeight = isCentralImage ? pageHeight : pageHeight + 20

                        NavigationLink(destination: BiteDetailView(bite: bite)) {
                            bite.dishImage
                                .resizable()
                                .scaledToFill()
                                .frame(width: imageWidth, height: imageHeight)
                                .clipped()
                                .cornerRadius(15)
                                .shadow(radius: 5)
                                .scaleEffect(scale)
                                .offset(x: -10)
                                .opacity(opacity)
                                .animation(.easeInOut, value: scrollPosition)
                        }
                    }
                    .frame(width: pageWidth)
                }
                .padding(.horizontal, 1)
            }
            .scrollTargetLayout()
        }
        .contentMargins(widthDifference / 2, for: .scrollContent)
        .scrollTargetBehavior(.viewAligned)
        .frame(height: pageHeight * 1.3)
        .scrollPosition(id: $scrollPosition, anchor: .center)
        .scrollIndicators(.hidden)
        .onChange(of: scrollPosition) {
            handleScrollPositionChange()
        }
    }

    private func handleScrollPositionChange() {
        guard let scrollPosition = scrollPosition else { return }
        let itemCount = filteredBites.count

        if scrollPosition / itemCount == 0 && scrollPosition % itemCount == itemCount - 1 {
            DispatchQueue.main.asyncAfter(deadline: .now() + animationDuration) {
                itemsArray.removeLast()
                itemsArray.insert(filteredBites, at: 0)
                self.scrollPosition = scrollPosition + itemCount
            }
            return
        }

        if scrollPosition / itemCount == 2 && scrollPosition % itemCount == 0 {
            DispatchQueue.main.asyncAfter(deadline: .now() + animationDuration) {
                itemsArray.removeFirst()
                itemsArray.append(filteredBites)
                self.scrollPosition = scrollPosition - itemCount
            }
            return
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + secondsPerSlide) {
            if autoScrollEnabled {
                withAnimation(animation) {
                    self.scrollPosition = scrollPosition + 1
                }
            }
        }
    }

    private func updateItemsArray() {
        itemsArray = [filteredBites, filteredBites, filteredBites]
    }

    private var filteredBites: [Bite] {
        if text.isEmpty {
            return biteVM.bites
        } else {
            return biteVM.bites.filter { $0.dishName.lowercased().contains(text.lowercased()) }
        }
    }

    private var paginationDots: some View {
        HStack(spacing: 5) {
            ForEach(0..<filteredBites.count, id: \.self) { index in
                Button(action: {
                    withAnimation(animation) {
                        scrollPosition = index + filteredBites.count
                    }
                }, label: {
                    Circle()
                        .fill(Color.gray.opacity(
                            (index == (scrollPosition ?? 0) % filteredBites.count) ? 0.8 : 0.3
                        ))
                        .frame(width: 8, height: 8)
                })
            }
        }
    }

    private func getScale(geometry: GeometryProxy) -> CGFloat {
        let midX = geometry.frame(in: .global).midX
        let screenWidth = UIScreen.main.bounds.width
        let scale = max(0.7, 1 - abs(midX - screenWidth / 2) / 300)
        return scale
    }

    private var searchBar: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .renderingMode(.template)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundStyle(.black)
                .frame(width: 20, height: 20)
                .foregroundColor(.white)

            TextField("Search", text: $text)
                .foregroundColor(.black)
                .bold()
                .frame(width: 280, height: 20)
                .onChange(of: text) {
                    updateItemsArray()
                }

            Image(systemName: "mic")
                .renderingMode(.template)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundStyle(.black)
                .frame(width: 20, height: 20)
                .foregroundColor(.white)
        }
    }
}

#Preview {
    BiteView().environment(BiteViewModel()).environment(HostViewModel()).environmentObject(ProfileViewModel())
}
