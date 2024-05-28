//
//  FindDJsView.swift
//  DJA
//
//  Created by Ben St Arnaud on 2024/05/25.
//
import SwiftUI

struct DiscJockey: Identifiable {
    var id = UUID()
    var name: String
    var location: String
}

struct FindDJsView: View {
    @State private var searchQuery = ""
    let allDJs: [DiscJockey] = [
        DiscJockey(name: "DJ Cool Mix", location: "New York"),
        DiscJockey(name: "DJ Beat Master", location: "Los Angeles"),
        DiscJockey(name: "DJ Groove", location: "Chicago"),
        DiscJockey(name: "DJ Rock", location: "New York"),
        DiscJockey(name: "DJ Wave", location: "Miami")
    ]
    
    var filteredDJs: [DiscJockey] {
        if searchQuery.isEmpty {
            return allDJs
        } else {
            return allDJs.filter { $0.location.lowercased().contains(searchQuery.lowercased()) }
        }
    }

    var body: some View {
        NavigationView {
            VStack {
                TextField("Enter location", text: $searchQuery)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                    .padding(.horizontal)
                    .padding(.top)
                
                List(filteredDJs) { dj in
                    VStack(alignment: .leading) {
                        Text(dj.name)
                            .font(.headline)
                        Text(dj.location)
                            .font(.subheadline)
                    }
                    .padding(.vertical, 5)
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("Find DJs")
        }
    }
}

#Preview {
    FindDJsView()
}

