import SwiftUI

struct DJ: Identifiable {
    var id = UUID()
    var name: String
    var popularity: String
}

struct TrendingDJsView: View {
    var selectedLocation: String
    
    let trendingDJs: [DJ] = [
        DJ(name: "DJ Cool Mix", popularity: "Trending #1"),
        DJ(name: "DJ Beat Master", popularity: "Trending #2"),
        DJ(name: "DJ Groove", popularity: "Trending #3")
    ]

    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
               
                
                List(Array(trendingDJs.enumerated()), id: \.element.id) { index, dj in
                    HStack(alignment: .top) {
                        Text("\(index + 1).")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        
                        VStack(alignment: .leading) {
                            Text(dj.name)
                                .font(.headline)
                            Text(dj.popularity)
                                .font(.subheadline)
                        }
                        .padding(.vertical, 5)
                    }
                }
                .listStyle(PlainListStyle())
            }
            .navigationBarTitle("DJs", displayMode: .inline)
        }
    }
}

#Preview {
    TrendingDJsView(selectedLocation: "Stellenbosch")
}

