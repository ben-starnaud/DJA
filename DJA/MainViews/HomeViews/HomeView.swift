import SwiftUI

struct HomeView: View {
    @State private var selectedTab = 0
    @State private var selectedLocation = "New York"  // Default location
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                ZStack {
                    Color.gray
                        .edgesIgnoringSafeArea(.top)
                        .frame(height: 90)
                    
                    Text("Home")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.yellow)
                }
                
                LocationBarView(selectedLocation: $selectedLocation)
                    .padding()
                
                CustomTabSwitcher(selectedTab: $selectedTab)
                    .padding()
                
                TabView(selection: $selectedTab) {
                    UpcomingEventsView(selectedLocation: selectedLocation)
                        .tag(0)
                    TrendingDJsView(selectedLocation: selectedLocation)
                        .tag(1)
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            }
            .navigationTitle("")
            .navigationBarHidden(true)
        }
    }
}


struct CustomTabSwitcher: View {
    @Binding var selectedTab: Int

    var body: some View {
        HStack {
            Button(action: {
                selectedTab = 0
            }) {
                Text("Upcoming Events")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(selectedTab == 0 ? Color.gray : Color.clear)
                    .foregroundColor(selectedTab == 0 ? .white : .gray)
                    .cornerRadius(10)
            }

            Button(action: {
                selectedTab = 1
            }) {
                Text("Trending DJs")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(selectedTab == 1 ? Color.gray : Color.clear)
                    .foregroundColor(selectedTab == 1 ? .white : .gray)
                    .cornerRadius(10)
            }
        }
        .background(Color.white.opacity(0.2))
        .cornerRadius(10)
    }
}

struct LocationBarView: View {
    @Binding var selectedLocation: String
    let locations = ["Stellenbosch", "Gardens", "Parrow", "Stilbaai", "Hout Bay"]
    
    var body: some View {
        Picker("Select Location", selection: $selectedLocation) {
            ForEach(locations, id: \.self) {
                Text($0)
            }
        }
        .pickerStyle(MenuPickerStyle())
        .padding()
        .background(Color.white.opacity(0.2))
        .cornerRadius(10)
        .foregroundColor(.black)
        
    }
}


#Preview {
    HomeView()
}

