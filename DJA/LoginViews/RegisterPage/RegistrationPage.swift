import SwiftUI

struct RegistrationPage: View {
    @State private var selectedRole: String = ""
    @State private var isEmployer = false
    @State private var isIndividual = false
    @State private var isDJ = false

    var body: some View {
        VStack {
            Spacer()
            Text("Select your role")
                .font(.title)// Make the text bold
                .foregroundColor(.black) // Set the text color to blue
                .padding()
                .shadow(color: Color.gray.opacity(0.3), radius: 2, x: 0, y: 2) // Add a shadow for depth
            
            Button(action: {
                selectedRole = "Employers"
                isEmployer = true
                // Navigate to next step or perform action based on selected role
            }) {
                RoleSelectionView(role: "Employer")
            }
            .padding()
            .fullScreenCover(isPresented: $isEmployer) {
                EmployerRegistrationPage()
            }
            
            
            Button(action: {
                selectedRole = "DJs"
                isDJ = true
                // Navigate to next step or perform action based on selected role
            }) {
                RoleSelectionView(role: "DJ")
            }
            .padding()
            .fullScreenCover(isPresented: $isDJ) {
                DJRegistrationPage()
            }
           
            
            Button(action: {
                selectedRole = "Individuals"
                isIndividual = true
                // Navigate to next step or perform action based on selected role
            }) {
                RoleSelectionView(role: "Individual")
            }
            .padding()
            .fullScreenCover(isPresented: $isIndividual) {
                IndividualRegistrationPage()
            }
            
            
            Spacer()
        }.background(.gray)
    }
}

struct RoleSelectionView: View {
    var role: String
    
    var body: some View {
        Text(role)
            .font(.title)
            .foregroundColor(.black)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.yellow)
            .cornerRadius(10)
            .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: 5)
    }
}

struct RegistrationPage_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationPage()
    }
}


