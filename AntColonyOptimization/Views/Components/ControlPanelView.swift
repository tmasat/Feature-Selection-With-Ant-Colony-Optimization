import SwiftUI

struct ControlPanelView: View {
    @Binding var isExpanded: Bool
    @ObservedObject var viewModel: FeatureSelectionViewModel
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Text("Algorithm Parameters")
                    .font(.headline)
                    .foregroundColor(.white)
                
                Spacer()
                
                Button(action: {
                    withAnimation(.easeInOut(duration: 0.3)) {
                        isExpanded.toggle()
                    }
                }) {
                    Image(systemName: isExpanded ? "chevron.down" : "chevron.up")
                        .foregroundColor(.white)
                        .padding(8)
                        .background(Color.blue.opacity(0.3))
                        .clipShape(Circle())
                }
            }
            .padding()
            .background(Color.black.opacity(0.5))
            
            VStack(spacing: 16) {
                VStack(spacing: 12) {
                    ParameterSliderView(
                        title: "Number of Ants",
                        value: Binding(
                            get: { Double(viewModel.numberOfAnts) },
                            set: { 
                                viewModel.numberOfAnts = Int($0)
                                viewModel.resetSimulation()
                            }
                        ),
                        range: 5...30,
                        step: 1
                    )
                    
                    ParameterSliderView(
                        title: "Max Features per Ant",
                        value: Binding(
                            get: { Double(viewModel.maxFeaturesPerAnt) },
                            set: { 
                                viewModel.maxFeaturesPerAnt = Int($0)
                                viewModel.resetSimulation()
                            }
                        ),
                        range: 3...15,
                        step: 1
                    )
                    
                    ParameterSliderView(
                        title: "Evaporation Rate",
                        value: $viewModel.evaporationRate,
                        range: 0.01...0.5
                    )
                    
                    ParameterSliderView(
                        title: "Alpha (Pheromone)",
                        value: $viewModel.alpha,
                        range: 0.1...5.0
                    )
                    
                    ParameterSliderView(
                        title: "Beta (Heuristic)",
                        value: $viewModel.beta,
                        range: 0.1...5.0
                    )
                    
                    ParameterSliderView(
                        title: "Simulation Speed",
                        value: $viewModel.simulationSpeed,
                        range: 0.1...3.0
                    )
                }
                
                StatisticsDetailView(
                    featuresCount: viewModel.features.count,
                    bestFeaturesCount: viewModel.bestSolution.count,
                    activeAntsCount: viewModel.ants.count,
                    averagePheromone: averagePheromoneLevel
                )
            }
            .padding()
            .background(Color.black.opacity(0.5))
            .clipped()
            .frame(maxHeight: isExpanded ? .infinity : 0)
            .opacity(isExpanded ? 1.0 : 0.0)
        }
    }
    
    private var averagePheromoneLevel: Double {
        guard !viewModel.features.isEmpty else { return 0.0 }
        return viewModel.features.map { $0.pheromoneLevel }.reduce(0, +) / Double(viewModel.features.count)
    }
} 
