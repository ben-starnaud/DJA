import SwiftUI
import UIKit

struct ProfileView: View {
    @State private var profileImage: UIImage? = UIImage(named: "defaultProfileImage") // Placeholder image
    @State private var isImagePickerPresented = false
    
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
                        VStack {
                            Button(action: {
                                isImagePickerPresented = true
                            }) {
                                if let profileImage = profileImage {
                                    Image(uiImage: profileImage)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 100, height: 100)
                                        .clipShape(Circle())
                                        .overlay(Circle().stroke(Color.blue, lineWidth: 3))
                                        .shadow(radius: 10)
                                        .padding(.top, 10)
                                } else {
                                    Image(systemName: "person.circle.fill")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 100, height: 100)
                                        .foregroundColor(.gray)
                                        .clipShape(Circle())
                                        .overlay(Circle().stroke(Color.blue, lineWidth: 3))
                                        .shadow(radius: 10)
                                        .padding(.top, 10)
                                }
                            }
                            .sheet(isPresented: $isImagePickerPresented) {
                                CustomImagePicker(selectedImage: $profileImage)
                            }
                        }
                        .frame(maxWidth: .infinity) // Center the profile image
                        
                        VStack(alignment: .leading, spacing: 15) {
                            HStack {
                                Text("Name:")
                                    .font(.headline)
                                    .foregroundColor(.gray)
                                Spacer()
                                Text("Ben St Arnaud") // Example data
                                    .font(.body)
                                    .foregroundColor(.primary)
                            }
                            .padding(.vertical, 5)
                            
                            HStack {
                                Text("Email:")
                                    .font(.headline)
                                    .foregroundColor(.gray)
                                Spacer()
                                Text("benstarnaudwork@gmail.com") // Example data
                                    .font(.body)
                                    .foregroundColor(.primary)
                            }
                            .padding(.vertical, 5)
                            
                            HStack {
                                Text("Phone:")
                                    .font(.headline)
                                    .foregroundColor(.gray)
                                Spacer()
                                Text("+1 123 456 7890") // Example data
                                    .font(.body)
                                    .foregroundColor(.primary)
                            }
                            .padding(.vertical, 5)
                            
                            HStack {
                                Text("Date of Birth:")
                                    .font(.headline)
                                    .foregroundColor(.gray)
                                Spacer()
                                Text("January 1, 2000") // Example data
                                    .font(.body)
                                    .foregroundColor(.primary)
                            }
                            .padding(.vertical, 5)
                        }
                        .padding()
                        .background(Color(UIColor.secondarySystemBackground))
                        .cornerRadius(10)
                        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)

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
                    Text("Ben's Credit Card") // Example data
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

struct CustomImagePicker: UIViewControllerRepresentable {
    @Binding var selectedImage: UIImage?

    class CustomCoordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        @Binding var selectedImage: UIImage?
        let parent: CustomImagePicker

        init(selectedImage: Binding<UIImage?>, parent: CustomImagePicker) {
            _selectedImage = selectedImage
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let uiImage = info[.originalImage] as? UIImage {
                selectedImage = uiImage
            }
            picker.dismiss(animated: true)
        }

        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            picker.dismiss(animated: true)
        }
    }

    func makeCoordinator() -> CustomCoordinator {
        CustomCoordinator(selectedImage: $selectedImage, parent: self)
    }

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

