import SwiftUI

struct LoginView: View {
    @StateObject private var authVM = AuthViewModel()
    @State private var isLoggedIn = false

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Bejelentkezés")
                    .font(.title)
                    .bold()

                TextField("Email", text: $authVM.email)
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                SecureField("Password", text: $authVM.password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                if let error = authVM.errorMessage {
                    Text(error)
                        .foregroundColor(.red)
                }

                Button("Bejelentkezés") {
                    if authVM.login() {
                        isLoggedIn = true
                    }
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.green)
                .foregroundColor(.white)
                .cornerRadius(10)

                NavigationLink(destination: RegisterView()) {
                    Text("Nincs még fiókod? Regisztrálj")
                        .font(.footnote)
                }

                NavigationLink(destination: DashboardView(), isActive: $isLoggedIn) {
                    EmptyView()
                }
            }
            .padding()
        }
    }
}
