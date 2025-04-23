import Foundation
import Combine

class AuthViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var serialNumber = ""
    @Published var errorMessage: String?

    func register() {
        errorMessage = nil

        guard !email.isEmpty, email.contains("@") else {
            errorMessage = "Érvénytelen email."
            return
        }

        guard password.count >= 6 else {
            errorMessage = "A jelszó legyen legalább 6 karakter."
            return
        }

        guard serialNumber.starts(with: "HC02-") else {
            errorMessage = "Serial number nem megfelelő formátumú."
            return
        }

        // Ide jönne az API hívás (stub most)
        print("Regisztráció sikeres: \(email), SN: \(serialNumber)")
    }
}

func login() -> Bool {
    errorMessage = nil

    guard !email.isEmpty, !password.isEmpty else {
        errorMessage = "Tölts ki minden mezőt."
        return false
    }

    // Dummy check (valódi API-val majd lecseréljük)
    if email == "pilot@hc.hu" && password == "123456" {
        return true
    } else {
        errorMessage = "Hibás bejelentkezési adatok."
        return false
    }
}
