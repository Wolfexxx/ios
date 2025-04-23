import Foundation

class AircraftViewModel: ObservableObject {
    @Published var aircraft: Aircraft = Aircraft(
        serialNumber: "HC02-042",
        model: "Hungarocopter HC-02",
        colorHex: "#E60012", // piros
        totalFlightHours: 248.7
    )
}
