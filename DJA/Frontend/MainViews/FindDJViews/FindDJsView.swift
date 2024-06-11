import SwiftUI

struct DiscJockey: Identifiable {
    var id = UUID()
    var name: String
    var location: String
    var genre: String
    var experience: String
    var available: Bool
    var image: String // Image name in the asset catalog
}

struct FindDJsView: View {
    @State private var searchQuery = ""
    @State private var selectedGenre = "All"
    @State private var selectedExperience = "All"
    @State private var isAvailable = false
    
    let allDJs: [DiscJockey] = [
        DiscJockey(name: "DJ Cool Mix", location: "New York", genre: "House", experience: "Expert", available: true, image: "dj_cool_mix"),
        DiscJockey(name: "DJ Beat Master", location: "Los Angeles", genre: "Hip-Hop", experience: "Intermediate", available: false, image: "dj_beat_master"),
        DiscJockey(name: "DJ Groove", location: "Chicago", genre: "EDM", experience: "Beginner", available: true, image: "dj_groove"),
        DiscJockey(name: "DJ Rock", location: "New York", genre: "Rock", experience: "Expert", available: true, image: "dj_rock"),
        DiscJockey(name: "DJ Wave", location: "Miami", genre: "Pop", experience: "Intermediate", available: false, image: "dj_wave")
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
                    LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.8), Color.white.opacity(0.4)]), startPoint: .top, endPoint: .bottom)
                        .edgesIgnoringSafeArea(.top)
                        .frame(height: 90)
                    
                    Text("Find DJ's")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.blue)
                        .shadow(color: .black.opacity(0.2), radius: 2, x: 1, y: 1)
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
                
                List {
                    ForEach(filteredDJs.indices, id: \.self) { index in
                        HStack {
                            Text("\(index + 1).")
                                .font(.headline)
                                .fontWeight(.bold)
                                .frame(width: 20, alignment: .leading)
                            
                            Image(filteredDJs[index].image)
                                .resizable()
                                .frame(width: 50, height: 50)
                                .clipShape(Circle())
                            
                            VStack(alignment: .leading) {
                                Text(filteredDJs[index].name)
                                    .font(.headline)
                                Text(filteredDJs[index].location)
                                    .font(.subheadline)
                                Text("Genre: \(filteredDJs[index].genre)")
                                    .font(.subheadline)
                                Text("Experience: \(filteredDJs[index].experience)")
                                    .font(.subheadline)
                                Text("Available: \(filteredDJs[index].available ? "Yes" : "No")")
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

