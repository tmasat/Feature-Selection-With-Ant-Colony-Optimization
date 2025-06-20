import Foundation

class FitnessCalculator {
    func calculateFitnessScore(_ selectedFeatures: [ObservableFeature]) -> Double {
        guard !selectedFeatures.isEmpty else { return 0.0 }
        
        let totalImportance = selectedFeatures.reduce(0.0) { $0 + $1.importance }
        let averageImportance = totalImportance / Double(selectedFeatures.count)
        
        let featureCount = selectedFeatures.count
        let countPenalty = 1.0 - abs(Double(featureCount - 6)) / 10.0
        
        let score = averageImportance * countPenalty * 100.0
        return min(100.0, max(0.0, score))
    }
} 