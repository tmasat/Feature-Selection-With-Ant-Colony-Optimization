import SwiftUI

struct ParameterSliderView: View {
    let title: String
    let value: Binding<Double>
    let range: ClosedRange<Double>
    let step: Double
    
    init(title: String, value: Binding<Double>, range: ClosedRange<Double>, step: Double = 0.1) {
        self.title = title
        self.value = value
        self.range = range
        self.step = step
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack {
                Text(title)
                    .font(.caption)
                    .foregroundColor(.white)
                
                Spacer()
                
                Text(String(format: "%.2f", value.wrappedValue))
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            
            Slider(value: value, in: range, step: step)
                .accentColor(.blue)
        }
    }
} 