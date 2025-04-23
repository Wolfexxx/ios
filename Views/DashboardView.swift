import SwiftUI
import SceneKit

struct DashboardView: View {
    @StateObject private var viewModel = AircraftViewModel()

    var body: some View {
        VStack(spacing: 16) {
            Text("Üdv, pilóta!")
                .font(.title)
                .bold()

            Text("Gép: \(viewModel.aircraft.serialNumber)")
                .font(.subheadline)

            SceneView(
                scene: SCNScene(named: "3DModels.scnassets/Helicopter.scn"),
                options: [.autoenablesDefaultLighting, .allowsCameraControl]
            )
            .frame(height: 250)
            .cornerRadius(12)

            HStack {
                VStack(alignment: .leading) {
                    Text("Típus: \(viewModel.aircraft.model)")
                    Text("Repült idő: \(String(format: "%.1f", viewModel.aircraft.totalFlightHours)) óra")
                }
                Spacer()
            }
            .padding()

            NavigationLink(destination: WeightBalanceView()) {
                Text("Weight & Balance")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }

            NavigationLink(destination: MaintenanceView()) {
                Text("Maintenance log")
                    .padding()
                    .background(Color.orange)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }

            Spacer()
        }
        .padding()
    }
}
