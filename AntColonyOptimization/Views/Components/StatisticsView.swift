import SwiftUI

struct StatisticsView: View {
    let bestScore: Double
    let currentIteration: Int
    let featuresCount: Int
    let bestFeaturesCount: Int
    let activeAntsCount: Int
    let averagePheromone: Double
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Best Score")
                    .font(.caption)
                    .foregroundColor(.gray)
                Text("\(String(format: "%.1f", bestScore))%")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.green)
            }
            
            Spacer()
            
            VStack(alignment: .trailing) {
                Text("Iteration")
                    .font(.caption)
                    .foregroundColor(.gray)
                Text("\(currentIteration)")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.blue)
            }
        }
        .padding()
        .background(Color.black.opacity(0.3))
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

struct StatisticsDetailView: View {
    let featuresCount: Int
    let bestFeaturesCount: Int
    let activeAntsCount: Int
    let averagePheromone: Double
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Features: \(featuresCount)")
                    .font(.caption)
                    .foregroundColor(.gray)
                
                Text("Best Features: \(bestFeaturesCount)")
                    .font(.caption)
                    .foregroundColor(.green)
            }
            
            Spacer()
            
            VStack(alignment: .trailing) {
                Text("Active Ants: \(activeAntsCount)")
                    .font(.caption)
                    .foregroundColor(.orange)
                
                Text("Avg Pheromone: \(String(format: "%.2f", averagePheromone))")
                    .font(.caption)
                    .foregroundColor(.yellow)
            }
        }
        .padding(.horizontal)
    }
} 