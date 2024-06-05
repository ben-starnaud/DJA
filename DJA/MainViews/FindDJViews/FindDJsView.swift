import SwiftUI

struct DiscJockey: Identifiable {
    var id = UUID()
    var name: String
    var location: String
    var genre: String
    var experience: String
    var available: Bool
}

struct FindDJsView: View {
    @State private var searchQuery = ""
    @State private var selectedGenre = "All"
    @State private var selectedExperience = "All"
    @State private var isAvailable = false
    
    let allDJs: [DiscJockey] = [
        DiscJockey(name: "DJ Cool Mix", location: "New York", genre: "House", experience: "Expert", available: true),
        DiscJockey(name: "DJ Beat Master", location: "Los Angeles", genre: "Hip-Hop", experience: "Intermediate", available: false),
        DiscJockey(name: "DJ Groove", location: "Chicago", genre: "EDM", experience: "Beginner", available: true),
        DiscJockey(name: "DJ Rock", location: "New York", genre: "Rock", experience: "Expert", available: true),
        DiscJockey(name: "DJ Wave", location: "Miami", genre: "Pop", experience: "Intermediate", available: false)
    ]
    
    var filteredDJs: [DiscJockey] {
        return allDJs.filter { dj in
            (searchQuery.isEmpty || dj.location.lowercased().contains(searchQuery.lowercased())) &&
            (selectedGenre == "All" || dj.genre == selectedGenre) &&
            (selectedExperience == "All" || dj.experience == selectedExperience) &&
            (!isAvailable || dj.available)
        }
    }

    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                ZStack {
                    Color.gray
                        .edgesIgnoringSafeArea(.all)
                        .frame(height: 90)
                    
                    Text("Find DJs")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.yellow)
                }
                
                VStack(spacing: 10) {
                    TextField("Enter location", text: $searchQuery)
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(10)
                        .padding(.horizontal)
                    
                    NavigationLink(destination: FiltersView(selectedGenre: $selectedGenre, selectedExperience: $selectedExperience, isAvailable: $isAvailable)) {
                        Text("Filters")
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(10)
                            .padding(.horizontal)
                    }
                }
                .padding(.top)
                
                List(filteredDJs) { dj in
                    VStack(alignment: .leading) {
                        Text(dj.name)
                            .font(.headline)
                        Text(dj.location)
                            .font(.subheadline)
                        Text("Genre: \(dj.genre)")
                            .font(.subheadline)
                        Text("Experience: \(dj.experience)")
                            .font(.subheadline)
                        Text("Available: \(dj.available ? "Yes" : "No")")
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

struct FiltersView: View {
    @Binding var selectedGenre: String
    @Binding var selectedExperience: String
    @Binding var isAvailable: Bool
    
    let genres = ["All", "House", "Hip-Hop", "EDM", "Rock", "Pop"]
    let experiences = ["All", "Beginner", "Intermediate", "Expert"]
    
    var body: some View {
        Form {
            Section(header: Text("Genre")) {
                Picker("Genre", selection: $selectedGenre) {
                    ForEach(genres, id: \.self) { genre in
                        Text(genre)
                    }
                }
                .pickerStyle(WheelPickerStyle())
            }
            
            Section(header: Text("Experience")) {
                Picker("Experience", selection: $selectedExperience) {
                    ForEach(experiences, id: \.self) { experience in
                        Text(experience)
                    }
                }
                .pickerStyle(WheelPickerStyle())
            }
            
            Section(header: Text("Availability")) {
                Toggle(isOn: $isAvailable) {
                    Text("Available")
                }
            }
        }
        .navigationTitle("Filters")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    FindDJsView()
}

