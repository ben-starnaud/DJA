import SwiftUI

struct ProfileView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                ZStack {
                    LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.8), Color.white.opacity(0.4)]), startPoint: .top, endPoint: .bottom)
                        .edgesIgnoringSafeArea(.top)
                        .frame(height: 90)
                    
                    Text("Profile")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.blue)
                        .shadow(color: .black.opacity(0.2), radius: 2, x: 1, y: 1)
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
                            Text("benstarnaudwork@gmail.com") // Example data
                        }
                    }

                    NavigationLink(destination: PaymentBankingDetailsView()) {
                        Text("Payments and Banking Details")
                    }
                    
                    NavigationLink(destination: PreferencesView()) {
                        Text("Preferences")
                    }
                    
                    NavigationLink(destination: ActivityView()) {
                        Text("Activity")
                    }
                    
                    NavigationLink(destination: AccountSettingsView()) {
                        Text("Account Settings")
                    }
                }
                .listStyle(GroupedListStyle())
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(true)
        }
    }
}

struct PaymentBankingDetailsView: View {
    var body: some View {
        List {
            Section(header: Text("Payments")) {
                HStack {
                    Text("Payment Method:")
                    Spacer()
                    Text("Bens's Credit Card") // Example data
                }
                HStack {
                    Text("Billing Address:")
                    Spacer()
                    Text("37 Froetang Road") // Example data
                }
            }

            Section(header: Text("Banking Details")) {
                HStack {
                    Text("Bank Name:")
                    Spacer()
                    Text("ABSA Bank") // Example data
                }
                HStack {
                    Text("Account Number:")
                    Spacer()
                    Text("912532532") // Example data
                }
            }
        }
        .navigationTitle("Payments and Banking")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct PreferencesView: View {
    var body: some View {
        List {
            Section(header: Text("Notifications")) {
                Toggle("Email Notifications", isOn: .constant(true))
                Toggle("Push Notifications", isOn: .constant(false))
            }

            Section(header: Text("Language")) {
                HStack {
                    Text("Language:")
                    Spacer()
                    Text("English") // Example data
                }
            }
        }
        .navigationTitle("Preferences")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ActivityView: View {
    var body: some View {
        List {
            Section(header: Text("Recent Activity")) {
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

            Section(header: Text("Statistics")) {
                HStack {
                    Text("Total Logins:")
                    Spacer()
                    Text("10") // Example data
                }
                HStack {
                    Text("Events Attended:")
                    Spacer()
                    Text("3") // Example data
                }
            }
        }
        .navigationTitle("Activity")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AccountSettingsView: View {
    var body: some View {
        List {
            Section(header: Text("Account")) {
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

            Section(header: Text("Security")) {
                HStack {
                    Text("Change Password")
                    Spacer()
                    Text("********") // Example data
                }
                HStack {
                    Text("Two-Factor Authentication")
                    Spacer()
                    Text("Enabled") // Example data
                }
            }
        }
        .navigationTitle("Account Settings")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ProfileView()
}

