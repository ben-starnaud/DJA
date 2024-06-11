//
//  MainView.swift
//  DJA
//
//  Created by Ben St Arnaud  on 2024/05/25.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            MessagingView()
                .tabItem {
                    Image(systemName: "message.fill")
                    Text("Messages")
                }
            FindDJsView()
                .tabItem {
                    Image(systemName: "music.mic")
                    Text("Find DJs")
                }
            ProfileView()
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
            
        }
    }
}
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
