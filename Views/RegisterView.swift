import SwiftUI

struct RegisterView: View {
    @StateObject private var authVM = AuthViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Hungarocopter HC-02")
                .font(.largeTitle)
                .bold()
                .padding(.top)

            TextField("Email", text: $authVM.email)
                .keyboardType(.emailAddress)
                .autocapitalization(.none)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            SecureField("Password", text: $authVM.password)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            TextField("HC-02 Serial Number", text: $authVM.serialNumber)
                .autocapitalization(.allCharacters)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            if let error = authVM.errorMessage {
                Text(error)
                    .foregroundColor(.red)
            }

            Button(action: {
                authVM.register()
            }) {
                Text("Register")
                    .bold()
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }

            Spacer()
        }
        .padding()
    }
}
