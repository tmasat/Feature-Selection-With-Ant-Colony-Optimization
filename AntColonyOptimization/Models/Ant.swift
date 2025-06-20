import Foundation

struct Ant: Identifiable {
    let id = UUID()
    var selectedFeatures: [ObservableFeature]
    var currentScore: Double = 0.0
    var isExploring: Bool = false
} 