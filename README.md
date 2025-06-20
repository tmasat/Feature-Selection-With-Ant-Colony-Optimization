# Ant Colony Optimization - Feature Selection

<div style="display: flex; justify-content: center; align-items: center; gap: 60px;">
  <img src="https://github.com/user-attachments/assets/e69d75b8-a8d9-468d-906d-4f5be0552c8f" width="300" />
  <img src="https://github.com/user-attachments/assets/2e9235e2-1e02-477f-9cfc-b7c2f21e0fcb" width="300" />
</div>

<br>


An iOS app that implements the Ant Colony Optimization (ACO) algorithm for feature selection with an interactive visual interface using SwiftUI. The app demonstrates how ants can intelligently select optimal feature subsets for machine learning tasks through pheromone-based optimization.

## 🎯 Project Description

This project visualizes the Ant Colony Optimization algorithm applied to feature selection problems. Instead of traditional pathfinding, ants explore different combinations of features to find the most effective subset for classification or prediction tasks. The app provides real-time visualization of the optimization process with interactive controls and parameter tuning.

## ✨ Features

- **Interactive ACO Simulation**: Real-time visualization of ants selecting feature subsets
- **Dynamic Feature Visualization**: Color-coded feature circles showing selection states
  - Gray: Unselected features
  - Orange: Currently selected by ants
  - Green: Part of the best solution found
- **Parameter Controls**: Adjustable algorithm parameters with real-time effects
  - Number of ants
  - Evaporation rate
  - Alpha (pheromone influence)
  - Beta (heuristic influence)
  - Simulation speed
  - Maximum features per ant
- **Real-time Statistics**: Live updates of best score, iteration count, and algorithm metrics
- **Collapsible Control Panel**: Expandable interface for parameter adjustment
- **Dark Mode UI**: Modern, responsive design with smooth animations
- **Feature Generation**: Random generation of realistic feature sets with varying importance
- **Fitness Evaluation**: Intelligent scoring based on feature importance and subset size

## 📱 Usage

### Getting Started

1. **Launch the app** - The simulation will automatically generate a random set of features
2. **Start simulation** - Tap the play button to begin the ACO optimization process
3. **Observe the process** - Watch as ants select features and the best solution emerges
4. **Adjust parameters** - Use the collapsible control panel to fine-tune algorithm behavior

### Key Interactions

- **Play/Pause Button**: Start or stop the simulation
- **Reset Button**: Generate new random features and restart
- **Parameter Sliders**: Adjust algorithm behavior in real-time
- **Expand/Collapse**: Toggle the control panel for more space
- **Feature Circles**: Observe color changes as features are selected

### Understanding the Visualization

- **Gray circles**: Unselected features
- **Orange circles**: Features currently selected by ants in this iteration
- **Green circles**: Features that are part of the best solution found so far
- **Statistics panel**: Shows current best score, iteration count, and other metrics
- **Control panel**: Displays detailed statistics and parameter controls

## 🛠 Technologies Used

### Core Technologies
- **Swift 5.9+**: Primary programming language
- **SwiftUI**: Modern declarative UI framework
- **Combine**: Reactive programming for data binding
- **Foundation**: Core iOS framework

### Architecture & Design
- **MVVM Pattern**: Model-View-ViewModel architecture
- **ObservableObject**: SwiftUI data binding and state management
- **Property Wrappers**: @Published, @StateObject, @ObservedObject for reactive UI

### Key Features
- **Timer-based Animation**: Smooth simulation updates
- **LazyVGrid**: Efficient feature grid layout
- **GeometryReader**: Responsive layout adaptation
- **LinearGradient**: Modern visual styling

**Note**: This project is for educational and research purposes, demonstrating the application of Ant Colony Optimization to feature selection problems in machine learning.
