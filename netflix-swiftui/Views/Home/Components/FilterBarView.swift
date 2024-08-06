import SwiftUI

struct FilterBarView: View {
    
    var filters: [FilterModel] = FilterModel.mockArray
    var selectedFilter: FilterModel? = nil
    var onFilterPressed: ((FilterModel) -> Void)? = nil
    var onXMarkPressed: (() -> Void)? = nil
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                if selectedFilter != nil {
                    Image(systemName: "xmark")
                        .padding(8)
                        .background(
                            Circle()
                                .stroke(lineWidth: 1)
                        )
                        .foregroundStyle(.netflixLightGray)
                        .background(Color.black.opacity(0.001))
                        .onTapGesture {
                            onXMarkPressed?()
                        }
                        .transition(AnyTransition.move(edge: .leading))
                        .padding(.leading, 16)
                }
                
                ForEach(filters, id: \.self) { filter in
                    if selectedFilter == nil || selectedFilter == filter {
                        FilterCell(
                            title: filter.title,
                            isDropdown: filter.isDropdown,
                            isSelected: selectedFilter == filter
                        )
                        .background(Color.black.opacity(0.001))
                        .onTapGesture {
                            onFilterPressed?(filter)
                        }
                        .padding(.leading,
                                 (
                                    (selectedFilter == nil) && filter == filters.first) ? 16: 0
                        )
                    }
                }
            }
            .padding(.vertical, 4)
        }
        .scrollIndicators(.hidden)
        .animation(.bouncy, value: selectedFilter)
    }
}

fileprivate struct FilterBarViewPreview: View {
    
    @State private var filters = FilterModel.mockArray
    @State private var selectedFilter: FilterModel? = nil
    var body: some View {
        FilterBarView(filters: filters,
                      selectedFilter: selectedFilter) { newFilter in
            selectedFilter = newFilter
        } onXMarkPressed: {
            selectedFilter = nil
        }

    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        FilterBarViewPreview()
    }

}
