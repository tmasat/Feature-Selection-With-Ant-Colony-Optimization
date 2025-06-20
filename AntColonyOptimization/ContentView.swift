//
//  ContentView.swift
//  AntColonyOptimization
//
//  Created by Tugberk Masat on 20.06.2025.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = FeatureSelectionViewModel()
    @State private var isSimulationRunning = false
    @State private var isControlPanelExpanded = true
    
    var body: some View {
        ZStack {
            backgroundGradient
            
            VStack(spacing: 0) {
                HeaderView(
                    onGenerateFeatures: viewModel.generateFeatures,
                    onToggleSimulation: toggleSimulation,
                    isSimulationRunning: isSimulationRunning
                )
                
                FeatureVisualizationView(viewModel: viewModel)
                
                ControlPanelView(
                    isExpanded: $isControlPanelExpanded,
                    viewModel: viewModel
                )
            }
        }
        .preferredColorScheme(.dark)
    }
    
    private var backgroundGradient: some View {
        LinearGradient(
            colors: [Color.black, Color.gray.opacity(0.3)],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        .ignoresSafeArea()
    }
    
    private func toggleSimulation() {
        if isSimulationRunning {
            viewModel.stopSimulation()
        } else {
            viewModel.startSimulation()
        }
        isSimulationRunning.toggle()
    }
}

struct FeatureVisualizationView: View {
    @ObservedObject var viewModel: FeatureSelectionViewModel
    
    var body: some View {
        VStack(spacing: 16) {
            StatisticsView(
                bestScore: viewModel.bestScore,
                currentIteration: viewModel.currentIteration,
                featuresCount: viewModel.features.count,
                bestFeaturesCount: viewModel.bestSolution.count,
                activeAntsCount: viewModel.ants.count,
                averagePheromone: averagePheromoneLevel
            )
            
            FeatureGridView(features: viewModel.features)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black.opacity(0.2))
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .padding()
    }
    
    private var averagePheromoneLevel: Double {
        guard !viewModel.features.isEmpty else { return 0.0 }
        return viewModel.features.map { $0.pheromoneLevel }.reduce(0, +) / Double(viewModel.features.count)
    }
}

struct FeatureGridView: View {
    let features: [ObservableFeature]
    
    private let columns = Array(repeating: GridItem(.flexible(), spacing: 12), count: 4)
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 12) {
                ForEach(features) { feature in
                    FeatureCircleView(feature: feature)
                }
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
