import SwiftUI

struct Event: Identifiable {
    var id = UUID()
    var name: String
    var date: String
    var location: String
    var image: String // Image name in the asset catalog
}

struct UpcomingEventsView: View {
    var selectedLocation: String
    
    let upcomingEvents: [Event] = [
        Event(name: "Summer Beats", date: "June 15, 2024", location: "Beach Club", image: "summer_beats"),
        Event(name: "Night Vibes", date: "June 20, 2024", location: "Downtown Arena", image: "night_vibes"),
        Event(name: "Festival Fiesta", date: "July 4, 2024", location: "City Park", image: "festival_fiesta")
    ]

    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                
                List {
                    ForEach(upcomingEvents.indices, id: \.self) { index in
                        HStack {
                            Text("\(index + 1).")
                                .font(.headline)
                                .fontWeight(.bold)
                                .frame(width: 30, alignment: .leading)
                            
                            Image(upcomingEvents[index].image)
                                .resizable()
                                .frame(width: 50, height: 50)
                                .clipShape(Circle())
                            
                            VStack(alignment: .leading) {
                                Text(upcomingEvents[index].name)
                                    .font(.headline)
                                Text(upcomingEvents[index].date)
                                    .font(.subheadline)
                                Text(upcomingEvents[index].location)
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
    UpcomingEventsView(selectedLocation: "Stellenbosch")
}

