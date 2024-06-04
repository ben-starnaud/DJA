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
            VStack(spacing: 0) {
                ZStack {
                    Color.gray
                        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                        .frame(height: 90)
                       
                    Text("Find DJs")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.yellow)
                }
                
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
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(true)
        }
    }
}

#Preview {
    FindDJsView()
}

