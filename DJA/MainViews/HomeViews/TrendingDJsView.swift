import SwiftUI

struct DJ: Identifiable {
    var id = UUID()
    var name: String
    var popularity: String
    var image: String // Image name in the asset catalog
}

struct TrendingDJsView: View {
    var selectedLocation: String
    
    let trendingDJs: [DJ] = [
        DJ(name: "DJ Cool Mix", popularity: "Trending #1", image: "dj_cool_mix"),
        DJ(name: "DJ Beat Master", popularity: "Trending #2", image: "dj_beat_master"),
        DJ(name: "DJ Groove", popularity: "Trending #3", image: "dj_groove")
    ]

    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                
                List {
                    ForEach(trendingDJs.indices, id: \.self) { index in
                        HStack {
                            Text("\(index + 1).")
                                .font(.headline)
                                .fontWeight(.bold)
                                .frame(width: 30, alignment: .leading)
                            
                            Image(trendingDJs[index].image)
                                .resizable()
                                .frame(width: 50, height: 50)
                                .clipShape(Circle())
                            
                            VStack(alignment: .leading) {
                                Text(trendingDJs[index].name)
                                    .font(.headline)
                                Text(trendingDJs[index].popularity)
                                    .font(.subheadline)
                            }
                            .padding(.leading, 5)
                        }
                        .padding(.vertical, 5)
                    }
                }
                .listStyle(PlainListStyle())
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    TrendingDJsView(selectedLocation: "Stellenbosch")
}

