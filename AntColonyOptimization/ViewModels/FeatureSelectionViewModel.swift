import Foundation
import Combine

class FeatureSelectionViewModel: ObservableObject {
    @Published var features: [ObservableFeature] = []
    @Published var ants: [Ant] = []
    @Published var bestSolution: [ObservableFeature] = []
    @Published var bestScore: Double = 0.0
    @Published var currentIteration: Int = 0
    
    @Published var numberOfAnts: Int = 15 {
        didSet {
            print("Number of ants changed to: \(numberOfAnts)")
        }
    }
    @Published var evaporationRate: Double = 0.1 {
        didSet {
            print("Evaporation rate changed to: \(evaporationRate)")
        }
    }
    @Published var alpha: Double = 1.0 {
        didSet {
            print("Alpha changed to: \(alpha)")
        }
    }
    @Published var beta: Double = 2.0 {
        didSet {
            print("Beta changed to: \(beta)")
        }
    }
    @Published var simulationSpeed: Double = 1.0 {
        didSet {
            print("Simulation speed changed to: \(simulationSpeed)")
            if isRunning {
                restartTimer()
            }
        }
    }
    @Published var maxFeaturesPerAnt: Int = 8 {
        didSet {
            print("Max features per ant changed to: \(maxFeaturesPerAnt)")
        }
    }
    
    private var timer: Timer?
    private var isRunning = false
    private let featureGenerator = FeatureGenerator()
    private let fitnessCalculator = FitnessCalculator()
    
    init() {
        generateFeatures()
        resetSimulation()
    }
    
    func generateFeatures() {
        features = featureGenerator.generateFeatures()
        resetSimulation()
    }
    
    func resetSimulation() {
        ants.removeAll()
        bestSolution.removeAll()
        bestScore = 0.0
        currentIteration = 0
        
        for feature in features {
            feature.isSelected = false
            feature.isInBestSolution = false
            feature.pheromoneLevel = 0.1
        }
        
        for _ in 0..<numberOfAnts {
            let ant = Ant(selectedFeatures: [])
            ants.append(ant)
        }
    }
    
    func startSimulation() {
        stopSimulation()
        isRunning = true
        startTimer()
    }
    
    func stopSimulation() {
        timer?.invalidate()
        timer = nil
        isRunning = false
    }
    
    private func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.5 / simulationSpeed, repeats: true) { _ in
            self.runIteration()
        }
    }
    
    private func restartTimer() {
        if isRunning {
            timer?.invalidate()
            startTimer()
        }
    }
    
    private func runIteration() {
        currentIteration += 1
        
        for feature in features {
            feature.isSelected = false
        }
        
        for i in 0..<ants.count {
            ants[i].selectedFeatures.removeAll()
            ants[i].isExploring = true
            
            let selectedCount = Int.random(in: 3...maxFeaturesPerAnt)
            for _ in 0..<selectedCount {
                if let selectedFeature = selectNextFeature(for: ants[i]) {
                    ants[i].selectedFeatures.append(selectedFeature)
                    selectedFeature.isSelected = true
                }
            }
            
            ants[i].currentScore = fitnessCalculator.calculateFitnessScore(ants[i].selectedFeatures)
            ants[i].isExploring = false
        }
        
        evaporatePheromones()
        depositPheromones()
        updateBestSolution()
    }
    
    private func selectNextFeature(for ant: Ant) -> ObservableFeature? {
        let unselectedFeatures = features.filter { feature in
            !ant.selectedFeatures.contains(feature)
        }
        
        if unselectedFeatures.isEmpty {
            return nil
        }
        
        var probabilities: [Double] = []
        var totalProbability = 0.0
        
        for feature in unselectedFeatures {
            let pheromone = feature.pheromoneLevel
            let heuristic = feature.importance
            
            let probability = pow(pheromone, alpha) * pow(heuristic, beta)
            probabilities.append(probability)
            totalProbability += probability
        }
        
        for i in 0..<probabilities.count {
            probabilities[i] /= totalProbability
        }
        
        let random = Double.random(in: 0...1)
        var cumulativeProbability = 0.0
        
        for (index, probability) in probabilities.enumerated() {
            cumulativeProbability += probability
            if random <= cumulativeProbability {
                return unselectedFeatures[index]
            }
        }
        
        return unselectedFeatures.last
    }
    
    private func evaporatePheromones() {
        for feature in features {
            feature.pheromoneLevel *= (1.0 - evaporationRate)
        }
    }
    
    private func depositPheromones() {
        for ant in ants {
            let pheromoneAmount = ant.currentScore / 100.0
            
            for feature in ant.selectedFeatures {
                feature.pheromoneLevel += pheromoneAmount
            }
        }
    }
    
    private func updateBestSolution() {
        for ant in ants {
            if ant.currentScore > bestScore {
                bestScore = ant.currentScore
                bestSolution = ant.selectedFeatures
                
                for feature in features {
                    feature.isInBestSolution = bestSolution.contains(feature)
                }
            }
        }
    }
} 