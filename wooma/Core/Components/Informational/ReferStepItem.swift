//
//  ReferStepItem.swift
//  wooma
//
//  Created by Carlo on 3/12/25.
//

import SwiftUI


// Refer Step Item Component
struct ReferStepItem: View {
    let title: String
    let description: String
    let icon: String
    let iconRotation: Double
    
    var body: some View {
        HStack(alignment: .center, spacing: 24) {
            // Icon without the circle background
            Image(systemName: icon)
                .font(.system(size: 16, weight: .bold))
                .foregroundColor(.black)
                .rotationEffect(.degrees(iconRotation))
                .frame(width: 20, alignment: .leading)
                .padding(.leading, 24)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.custom("SofiaSans-Bold", size: 20))
                    .foregroundColor(.black)
                
                Text(description)
                    .font(.custom("SofiaSans-Regular", size: 18))
                    .foregroundColor(Color(hex: "#606060"))
                    .fixedSize(horizontal: false, vertical: true)
            }
            
            Spacer()
        }
        .padding(.vertical, 16)
    }
}


