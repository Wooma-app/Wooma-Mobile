import SwiftUI

struct BottomButtonView: View {
    let buttonText: String
    let buttonAction: () -> Void
    let showArrow: Bool
    let backgroundColor: Color
    let textColor: Color
    
    init(
        text: String,
        action: @escaping () -> Void,
        showArrow: Bool = true,
        backgroundColor: Color = .woomaGreen,  // Using named color constant
        textColor: Color = .white
    ) {
        self.buttonText = text
        self.buttonAction = action
        self.showArrow = showArrow
        self.backgroundColor = backgroundColor
        self.textColor = textColor
    }
    
    var body: some View {
        VStack {
            Button(action: buttonAction) {
                HStack {
                    Text(buttonText)
                        .font(.custom("SofiaSans-Bold", size: 18))
                        .foregroundColor(textColor)
                    
                    if showArrow {
                        Image(systemName: "arrow.right")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundColor(textColor)
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 16)
                .background(backgroundColor)
                .cornerRadius(35)
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 16)
        .background(
            Rectangle()
                .fill(Color(.systemBackground))
                .shadow(color: Color.black.opacity(0.05), radius: 4, x: 0, y: -2)
        )
    }
}
