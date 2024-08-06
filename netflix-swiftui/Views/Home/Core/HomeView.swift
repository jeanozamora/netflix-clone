import SwiftUI

struct HomeView: View {
    @State private var filters = FilterModel.mockArray
    @State private var selectedFilter: FilterModel? = nil
    @State private var fullHeaderSize: CGSize = .zero
    
    var body: some View {
        ZStack(alignment: .top) {
            Color.netflixBlack.ignoresSafeArea()
            
            ScrollView(.vertical) {
                VStack(spacing: 8) {
                    Rectangle()
                        .opacity(0)
                        .frame(height: fullHeaderSize.height)
                    MainMovieHeader()
                        .padding(24)
                    ForEach(0..<20) { _ in
                        Rectangle()
                            .fill(Color.red)
                            .frame(height: 200)
                    }
                }
            }
            .scrollIndicators(.hidden)
            
            VStack(spacing: 0) {
                header
                    .padding(.horizontal, 16)
                FilterBarView(filters: filters,
                              selectedFilter: selectedFilter) { newFilter in
                    selectedFilter = newFilter
                } onXMarkPressed: {
                    selectedFilter = nil
                }
                .padding(.top, 16)
            }
            .background(
                GeometryReader { geometry in
                    Color.clear
                        .onAppear {
                            fullHeaderSize = geometry.size
                        }
                }
            )
        }
        .foregroundStyle(.netflixWhite)
    }
    
    private var header: some View {
        HStack(spacing: 0) {
            Text("For You")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.title)
            HStack(spacing: 16) {
                Image(systemName: "tv.badge.wifi")
                    .onTapGesture {
                        
                    }
                Image(systemName: "magnifyingglass")
                    .onTapGesture {
                        
                    }
                    .font(.title2)
            }
        }
    }
}

#Preview {
    HomeView()
}
