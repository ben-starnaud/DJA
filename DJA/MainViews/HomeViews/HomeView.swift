import SwiftUI

struct HomeView: View {
    @State private var selectedTab = 0

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
                
                CustomTabSwitcher(selectedTab: $selectedTab)
                    .padding()
                
                TabView(selection: $selectedTab) {
                    UpcomingEventsView()
                        .tag(0)
                    TrendingDJsView()
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

#Preview {
    HomeView()
}

