//
//  UpcomingEventsView.swift
//  DJA
//
//  Created by Ben St Arnaud on 2024/05/26.
//

import SwiftUI

struct Event: Identifiable {
    var id = UUID()
    var name: String
    var date: String
    var location: String
}

struct UpcomingEventsView: View {
    let upcomingEvents: [Event] = [
        Event(name: "Summer Beats", date: "June 15, 2024", location: "Beach Club"),
        Event(name: "Night Vibes", date: "June 20, 2024", location: "Downtown Arena"),
        Event(name: "Festival Fiesta", date: "July 4, 2024", location: "City Park")
    ]

    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("Upcoming events in Stellenbosch")
                .font(.title2)
                .fontWeight(.semibold)
                .padding(.horizontal)
                .padding(.top)

            List(upcomingEvents) { event in
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
            .listStyle(PlainListStyle())
        }
        .navigationBarTitle("Events", displayMode: .inline)
    }
}

#Preview {
    UpcomingEventsView()
}
