import SwiftUI

struct FeatureCircleView: View {
    @ObservedObject var feature: ObservableFeature
    
    var body: some View {
        VStack(spacing: 4) {
            Circle()
                .fill(featureColor)
                .frame(width: 50, height: 50)
                .overlay(
                    Circle()
                        .stroke(featureStrokeColor, lineWidth: 2)
                )
                .shadow(color: featureShadowColor, radius: 4)
                .scaleEffect(feature.isSelected ? 1.1 : 1.0)
                .animation(.easeInOut(duration: 0.2), value: feature.isSelected)
            
            Text(feature.name)
                .font(.caption2)
                .foregroundColor(.white)
                .lineLimit(2)
                .multilineTextAlignment(.center)
        }
    }
    
    private var featureColor: Color {
        if feature.isInBestSolution {
            return Color.green.opacity(0.8)
        } else if feature.isSelected {
            return Color.orange.opacity(0.7)
        } else {
            return Color.gray.opacity(0.4)
        }
    }
    
    private var featureStrokeColor: Color {
        if feature.isInBestSolution {
            return Color.green
        } else if feature.isSelected {
            return Color.orange
        } else {
            return Color.gray.opacity(0.6)
        }
    }
    
    private var featureShadowColor: Color {
        if feature.isInBestSolution {
            return Color.green.opacity(0.5)
        } else if feature.isSelected {
            return Color.orange.opacity(0.3)
        } else {
            return Color.clear
        }
    }
} 