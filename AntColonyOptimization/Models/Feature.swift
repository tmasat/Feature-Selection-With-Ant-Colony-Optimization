import Foundation

struct Feature: Identifiable, Equatable {
    let id = UUID()
    let name: String
    let importance: Double
    var isSelected: Bool = false
    var isInBestSolution: Bool = false
    var pheromoneLevel: Double = 0.1
    
    static func == (lhs: Feature, rhs: Feature) -> Bool {
        lhs.id == rhs.id
    }
}

class ObservableFeature: ObservableObject, Identifiable, Equatable {
    let id = UUID()
    let name: String
    let importance: Double
    @Published var isSelected: Bool = false
    @Published var isInBestSolution: Bool = false
    @Published var pheromoneLevel: Double = 0.1
    
    init(name: String, importance: Double) {
        self.name = name
        self.importance = importance
    }
    
    static func == (lhs: ObservableFeature, rhs: ObservableFeature) -> Bool {
        lhs.id == rhs.id
    }
} 