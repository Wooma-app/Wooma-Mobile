//
//  FeatureRow.swift
//  wooma
//
//  Created by Carlo on 3/12/25.
//
import SwiftUI
// Feature row component with text icon instead of SF Symbol
struct FeatureRow: View {
    let iconText: String
    let iconColor: Color
    let title: String
    let description: String
    
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Text(iconText)
                .foregroundColor(iconColor)
                .font(.system(size: 24))
                .frame(width: 24, height: 24)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.custom("SofiaSans-Bold", size: 20))
                
                Text(description)
                    .font(.custom("SofiaSans-Regular", size: 18))
                    .foregroundColor(Color(.darkGray))
                    .lineSpacing(2)
            }
        }
    }
}
