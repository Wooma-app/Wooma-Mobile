//
//  CardSectionView.swift
//  wooma
//
//  Created by Carlo on 3/12/25.
//

import SwiftUI


// Card Section View Component
struct CardSectionView<Content: View>: View {
    let title: String
    let content: Content
    
    init(title: String, @ViewBuilder content: () -> Content) {
        self.title = title
        self.content = content()
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(title)
                .font(.custom("SofiaSans-Bold", size: 18))
                .foregroundColor(.black)
                .padding(.bottom, 8)
            
            VStack(spacing: 0) {
                content
            }
            .background(Color.white)
            .cornerRadius(10)
            .shadow(color: Color.black.opacity(0.05), radius: 2, x: 0, y: 1)
        }
    }
}


