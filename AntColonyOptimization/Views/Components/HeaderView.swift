import SwiftUI

struct HeaderView: View {
    let onGenerateFeatures: () -> Void
    let onToggleSimulation: () -> Void
    let isSimulationRunning: Bool
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Feature Selection")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Text("Ant Colony Optimization")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            HStack(spacing: 12) {
                Button(action: onGenerateFeatures) {
                    Image(systemName: "arrow.clockwise")
                        .foregroundColor(.white)
                        .padding(8)
                        .background(Color.blue.opacity(0.3))
                        .clipShape(Circle())
                }
                
                Button(action: onToggleSimulation) {
                    Image(systemName: isSimulationRunning ? "pause.fill" : "play.fill")
                        .foregroundColor(.white)
                        .padding(8)
                        .background(isSimulationRunning ? Color.orange.opacity(0.3) : Color.green.opacity(0.3))
                        .clipShape(Circle())
                }
            }
        }
        .padding()
        .background(Color.black.opacity(0.5))
    }
} 
