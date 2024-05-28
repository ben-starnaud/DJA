import SwiftUI

struct IndividualRegistrationPage: View {
    @State private var fullName = ""
    @State private var surname = ""
    @State private var email = ""
    @State private var location = ""
    @State private var birthDate = Date()

    var body: some View {
        VStack {
            Text("Create Your Profile")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.blue)
                .padding()
            
            VStack(alignment: .center, spacing: 20) { // Align content to the center
                Text("Profile Photo")
                    .font(.headline)
                
                 // Push profile photo to the center
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 120, height: 120)
                    .foregroundColor(.gray)
                    .cornerRadius(60)
                    .padding(.bottom, 20)
                 // Push profile photo to the center
                
                TextField("First Name", text: $fullName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("Surname", text: $surname)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("Email", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("Location", text: $location)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                DatePicker("Date of Birth", selection: $birthDate, in: ...Date(), displayedComponents: .date)
                                    .datePickerStyle(DefaultDatePickerStyle())
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                    .foregroundColor(.black)
                                    .padding(5)
                Spacer()
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

struct IndividualRegistrationPage_Previews: PreviewProvider {
    static var previews: some View {
        IndividualRegistrationPage()
    }
}

