import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var isLoggedIn = false
    @State private var wantsToRegister = false
    @State private var rememberMe = false
    
    var body: some View {
        VStack {
            Spacer()
            
            Image(systemName: "music.note.list")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
                .foregroundColor(.blue)
                .padding(.bottom, 20)
            
            Text("Welcome to DJA")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .padding(.bottom, 40)
            
            VStack(spacing: 20) {
                TextField("Email", text: $email)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
                
                SecureField("Password", text: $password)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
            }
            .padding(.horizontal, 32)
        
            HStack {
                Toggle(isOn: $rememberMe) {
                    Text("Remember Me")
                }
                .toggleStyle(SwitchToggleStyle(tint: .yellow))
                
                Spacer()
            }
            .padding(.horizontal, 32)
            .padding(.top, 10)
            
            Button(action: {
                // For simplicity, we're just setting isLoggedIn to true
                isLoggedIn = true
            }) {
                Text("Login")
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
                    .shadow(radius: 5)
            }
            .padding(.horizontal, 32)
            .padding(.top, 20)
            Spacer()
            Button(action: {
                wantsToRegister = true
            }) {
                Text("Create a Profile")
                    .font(.footnote)
                    .foregroundColor(.black)
                    .padding(.horizontal, 40)
                    .padding(.vertical, 5)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.black, lineWidth: 1.5)
                    )
            }.background(Color(.systemGray6))
            
            Spacer()
        }
        .padding()
        .fullScreenCover(isPresented: $isLoggedIn) {
            MainView()
        }
        .fullScreenCover(isPresented: $wantsToRegister) {
            RegistrationPage()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

