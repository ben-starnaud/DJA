//
//  ProfileView.swift
//  DJA
//
//  Created by Ben St Arnaud  on 2024/05/25.
//
import SwiftUI

struct ProfileView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                ZStack {
                    Color.gray
                        .edgesIgnoringSafeArea(.top)
                        .frame(height: 90)
                    
                    Text("Profile")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.yellow)
                }
                
                List {
                    Section(header: Text("User Information")) {
                        HStack {
                            Text("Name:")
                            Spacer()
                            Text("Ben St Arnaud") // Example data
                        }
                        HStack {
                            Text("Email:")
                            Spacer()
                            Text("benstarnaudwork.com") // Example data
                        }
                    }

                    Section(header: Text("Account Details")) {
                        HStack {
                            Text("Username:")
                            Spacer()
                            Text("ben123") // Example data
                        }
                        HStack {
                            Text("Member Since:")
                            Spacer()
                            Text("May 2024") // Example data
                        }
                    }

                    Section(header: Text("Preferences")) {
                        HStack {
                            Text("Notifications:")
                            Spacer()
                            Text("Enabled") // Example data
                        }
                        HStack {
                            Text("Language:")
                            Spacer()
                            Text("English") // Example data
                        }
                    }

                    Section(header: Text("Activity")) {
                        HStack {
                            Text("Last Login:")
                            Spacer()
                            Text("May 25, 2024") // Example data
                        }
                        HStack {
                            Text("Posts:")
                            Spacer()
                            Text("0") // Example data
                        }
                    }
                }
                .listStyle(GroupedListStyle())
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(true)
        }
    }
}

#Preview {
    ProfileView()
}
