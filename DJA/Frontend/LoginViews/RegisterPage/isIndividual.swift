import SwiftUI
import UIKit

struct IndividualRegistrationPage: View {
    @State private var fullName = ""
    @State private var surname = ""
    @State private var email = ""
    @State private var phoneNumber = ""
    @State private var birthDate = Date()
    @State private var profileImage: UIImage? = nil
    @State private var isImagePickerPresented = false
    @State private var termsAccepted = false
    @State private var isLoading = false
    @State private var showAlert = false
    @State private var alertMessage = ""

    var body: some View {
        ScrollView {
            VStack {
                Text("Create Your Profile")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.blue)
                    .padding(.top, 40)
                    .padding(.bottom, 20)
                
                VStack(alignment: .center, spacing: 20) {
                    Text("Profile Photo")
                        .font(.headline)
                    
                    Button(action: {
                        isImagePickerPresented = true
                    }) {
                        if let profileImage = profileImage {
                            Image(uiImage: profileImage)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 120, height: 120)
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.blue, lineWidth: 3))
                                .shadow(radius: 10)
                        } else {
                            Image(systemName: "person.circle.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 120, height: 120)
                                .foregroundColor(.gray)
                                .cornerRadius(60)
                                .overlay(Circle().stroke(Color.blue, lineWidth: 3))
                                .shadow(radius: 10)
                        }
                    }
                    .sheet(isPresented: $isImagePickerPresented) {
                        ImagePicker(image: $profileImage)
                    }
                    .padding(.bottom, 20)
                    
                    TextField("First Name", text: $fullName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)
                        .autocapitalization(.words)
                    TextField("Surname", text: $surname)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)
                        .autocapitalization(.words)
                    TextField("Email", text: $email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)
                        .keyboardType(.emailAddress)
                    TextField("Phone Number", text: $phoneNumber)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)
                        .keyboardType(.phonePad)
                    DatePicker("Date of Birth", selection: $birthDate, in: ...Date(), displayedComponents: .date)
                        .datePickerStyle(DefaultDatePickerStyle())
                        .padding(.horizontal)
                        .foregroundColor(.black)
                    
                    Toggle(isOn: $termsAccepted) {
                        Text("I agree to the Terms and Conditions")
                    }
                    .padding(.horizontal)
                    
                    if isLoading {
                        ProgressView()
                            .padding()
                    } else {
                        Button(action: {
                            registerUser()
                        }) {
                            Text("Register")
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(termsAccepted ? Color.blue : Color.gray)
                                .cornerRadius(10)
                                .shadow(radius: 5)
                        }
                        .padding(.top, 20)
                        .padding(.horizontal)
                        .disabled(!termsAccepted)
                    }
                    
                    Button(action: {
                        // Handle social media login
                    }) {
                        HStack {
                            Image(systemName: "person.circle")
                            Text("Register with Social Media")
                        }
                        .foregroundColor(.blue)
                        .padding()
                    }
                    
                    Spacer()
                    
                    Text("By creating an account, you agree to our")
                        .font(.footnote)
                    Button(action: {
                        // Open Privacy Policy link
                    }) {
                        Text("Privacy Policy")
                            .font(.footnote)
                            .foregroundColor(.blue)
                    }
                }
                .padding()
            }
            .padding(.top, 20) // Additional padding to avoid overlap with the notch
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Registration Error"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
        }
    }
    
    private func registerUser() {
        // Validate inputs
        guard !fullName.isEmpty, !surname.isEmpty, !email.isEmpty, !phoneNumber.isEmpty else {
            alertMessage = "All fields are required."
            showAlert = true
            return
        }
        
        isLoading = true
        
        // Perform registration action
        // Example: Simulate network request delay
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            isLoading = false
            // Handle success or failure
            // For example, navigate to another screen or show success message
        }
    }
}

struct ImagePicker: UIViewControllerRepresentable {
    @Binding var image: UIImage?

    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        @Binding var image: UIImage?
        let parent: ImagePicker

        init(image: Binding<UIImage?>, parent: ImagePicker) {
            _image = image
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let uiImage = info[.originalImage] as? UIImage {
                image = uiImage
            }
            picker.dismiss(animated: true)
        }

        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            picker.dismiss(animated: true)
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(image: $image, parent: self)
    }

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
}

struct IndividualRegistrationPage_Previews: PreviewProvider {
    static var previews: some View {
        IndividualRegistrationPage()
    }
}

