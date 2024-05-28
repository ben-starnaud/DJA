//
//  TrendingDJsView.swift
//  DJA
//
//  Created by Ben St Arnaud on 2024/05/26.
//

import SwiftUI

struct DJ: Identifiable {
    var id = UUID()
    var name: String
    var popularity: String
}

struct TrendingDJsView: View {
    let trendingDJs: [DJ] = [
        DJ(name: "DJ Cool Mix", popularity: "Trending #1"),
        DJ(name: "DJ Beat Master", popularity: "Trending #2"),
        DJ(name: "DJ Groove", popularity: "Trending #3")
    ]

    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("Trending DJs near you")
                .font(.title2)
                .fontWeight(.semibold)
                .padding(.horizontal)
                .padding(.top)
            
            List(trendingDJs) { dj in
                VStack(alignment: .leading) {
                    Text(dj.name)
                        .font(.headline)
                    Text(dj.popularity)
                        .font(.subheadline)
                }
                .padding(.vertical, 5)
            }
            .listStyle(PlainListStyle())
        }
        .navigationBarTitle("DJs", displayMode: .inline)
    }
}

#Preview {
    TrendingDJsView()
}

