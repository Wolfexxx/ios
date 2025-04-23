import Foundation

struct Aircraft: Identifiable {
    let id = UUID()
    let serialNumber: String
    let model: String
    let colorHex: String
    let totalFlightHours: Double
}
