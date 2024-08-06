import SwiftUI

struct MainMovieHeader: View {
    var imageName: String = ""
    var isnetflixFilm: Bool = true
    var title: String = "Star Wars"
    var categories: [String] = ["Romance", "Action", "Horror"]
    var onBackgroundPressed: (() -> Void)? = nil
    var onPlayPressed: (() -> Void)? = nil
    var onMyListPressed: (() -> Void)? = nil
    var body: some View {
        ZStack(alignment: .bottom) {
            Image(.starWarsPoster)
                .resizable()
                .aspectRatio(contentMode: .fill)
            VStack {
                VStack {
                    if isnetflixFilm {
                        HStack(spacing: 8) {
                            Text("N")
                                .foregroundStyle(.netflixRed)
                                .font(.largeTitle)
                                .fontWeight(.black)
                            Text("FILM")
                                .kerning(3)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .foregroundStyle(.white)
                        }
                    }
                    Text(title)
                        .font(.system(size: 50, weight: .medium, design: .serif))
                        .foregroundStyle(.netflixWhite)
                    HStack(spacing: 8) {
                        ForEach(categories, id: \.self ) { category in
                            Text("\(category)")
                                .font(.callout)
                                .foregroundStyle(.netflixWhite)
                            if category != categories.last {
                                Circle()
                                    .frame(width: 4, height: 4)
                                    .foregroundStyle(.netflixWhite)
                            }
                            
                        }
                    }
                    HStack(spacing: 16) {
                        HStack {
                            Image(systemName: "play.fill")
                            Text("Play")
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 8)
                        .foregroundStyle(.netflixDarkGray)
                        .background(.netflixWhite)
                        .clipShape(.rect(cornerRadius: 4))
                        .onTapGesture {
                            onPlayPressed?()
                        }
                        HStack {
                            Image(systemName: "plus")
                            Text("My List")
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 8)
                        .foregroundStyle(.netflixWhite)
                        .background(.netflixDarkGray)
                        .clipShape(.rect(cornerRadius: 4))
                        .onTapGesture {
                            onPlayPressed?()
                        }
                    }
                    .font(.callout)
                    .fontWeight(.medium)
                }
                .padding(24)
                .background(
                    LinearGradient(
                        colors: [
                            .netflixBlack.opacity(0),
                            .netflixBlack.opacity(0.4),
                            .netflixBlack.opacity(0.4),
                            .netflixBlack.opacity(0.4)
                        ],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
            }
        }
        .clipShape(.rect(cornerRadius: 20))
        .aspectRatio(0.8, contentMode: .fit)
    }
}

#Preview {
    MainMovieHeader()
        .padding(40)
}
