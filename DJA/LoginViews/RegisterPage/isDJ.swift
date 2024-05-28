import SwiftUI

struct DJRegistrationPage: View {
    @State private var fullName = ""
    @State private var surname = ""
    @State private var email = ""
    @State private var location = ""
    @State private var stageName = ""
    @State private var contactNumber = ""
    @State private var birthDate = Date()
    @State private var bio = "" // Added state for bio

    var body: some View {
        ScrollView {
            VStack {
                Text("Create Your Profile")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.blue)
                    .padding()
                
                VStack(alignment: .center, spacing: 20) { // Align content to the center
                    Text("Profile Photo")
                        .font(.headline)
                    
                    Spacer() // Push profile photo to the center
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 120, height: 120)
                        .foregroundColor(.gray)
                        .cornerRadius(60)
                        .padding(.bottom, 20)
                
                    
                    ZStack(alignment: .topLeading) {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.gray, lineWidth: 1) // Add border stroke
                                .background(Color(.systemGray6)) // Set background color
                            TextEditor(text: $bio)
                                .frame(minHeight: 100) // Set a minimum height for the bio section
                                .padding(.horizontal, 3) // Add horizontal padding to match other fields
                                .padding(.vertical, 5) // Add vertical padding
                    }
                    
                    TextField("First Name", text: $fullName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    TextField("Surname", text: $surname)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    TextField("Stage Name / DJ Name", text: $stageName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    TextField("Email", text: $email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    TextField("Contact Number", text: $contactNumber)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    TextField("Location", text: $location)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    DatePicker("Date of Birth", selection: $birthDate, in: ...Date(), displayedComponents: .date)
                        .datePickerStyle(DefaultDatePickerStyle())
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .foregroundColor(.black)
                        .padding(5)
                    
                    Button(action: {
                        // Perform registration action
                    }) {
                        Text("Register")
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                    }
                    .padding(.top, 20)
                }
                .padding()
            }
        }
    }
}

struct DJRegistrationPage_Previews: PreviewProvider {
    static var previews: some View {
        DJRegistrationPage()
    }
}

