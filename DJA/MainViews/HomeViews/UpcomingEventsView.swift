import SwiftUI

struct Event: Identifiable {
    var id = UUID()
    var name: String
    var date: String
    var location: String
}

struct UpcomingEventsView: View {
    var selectedLocation: String
    
    let upcomingEvents: [Event] = [
        Event(name: "Summer Beats", date: "June 15, 2024", location: "Beach Club"),
        Event(name: "Night Vibes", date: "June 20, 2024", location: "Downtown Arena"),
        Event(name: "Festival Fiesta", date: "July 4, 2024", location: "City Park")
    ]

    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                
                
                List(Array(upcomingEvents.enumerated()), id: \.element.id) { index, event in
                    HStack(alignment: .top) {
                        Text("\(index + 1).")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        
                        VStack(alignment: .leading) {
                            Text(event.name)
                                .font(.headline)
                            Text(event.date)
                                .font(.subheadline)
                            Text(event.location)
                                .font(.subheadline)
                        }
                        .padding(.vertical, 5)
                    }
                }
                .listStyle(PlainListStyle())
                
    
            }
            .navigationBarTitle("Events", displayMode: .inline)
        }
    }
}

#Preview {
    UpcomingEventsView(selectedLocation: "Stellenbosch")
}

