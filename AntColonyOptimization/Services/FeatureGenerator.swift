import Foundation

class FeatureGenerator {
    private let featureNames = [
        "Age", "Income", "Education", "Location", "Gender", "Occupation",
        "Credit Score", "Loan Amount", "Employment Years", "Marital Status",
        "Dependents", "Property Type", "Vehicle Owned", "Insurance Type",
        "Health Score", "Risk Level", "Transaction History", "Account Balance",
        "Payment History", "Debt Ratio", "Savings Rate", "Investment Portfolio",
        "Social Score", "Behavioral Pattern", "Geographic Region", "Industry Type",
        "Company Size", "Job Title", "Experience Level", "Certifications"
    ]
    
    func generateFeatures() -> [ObservableFeature] {
        let featureCount = Int.random(in: 15...30)
        var features: [ObservableFeature] = []
        
        for i in 0..<featureCount {
            let name = featureNames[i % featureNames.count]
            let importance = Double.random(in: 0.1...1.0)
            let feature = ObservableFeature(name: name, importance: importance)
            features.append(feature)
        }
        
        return features
    }
} 
