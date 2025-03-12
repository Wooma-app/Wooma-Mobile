//
//  EmptyReportsView.swift
//  wooma
//
//  Created by Carlo on 3/12/25.
//

import SwiftUI


struct EmptyReportsView: View {
    @State private var navigateToCreateReport = false
    
    var body: some View {
        VStack {
            Spacer()
            
            // Main headline
            Text("No reports, no proof.")
                .font(.custom("SofiaSans-Bold", size: 28))
                .multilineTextAlignment(.center)
            
            Text("Let's fix that!")
                .font(.custom("SofiaSans-Bold", size: 28))
                .multilineTextAlignment(.center)
                .padding(.bottom, 24)
            
            // Subtitle
            Text("Lock in your deposit protection in minutes.")
                .font(.custom("SofiaSans-Regular", size: 18))
                .foregroundColor(.woomaGray)
                .multilineTextAlignment(.center)
            
            HStack(spacing: 4) {
                Text("Quick, simple, done.")
                    .font(.custom("SofiaSans-Regular", size: 18))
                    .foregroundColor(.woomaGray)
                
                Text("🔒")
                    .font(.system(size: 20))
            }
            .padding(.bottom, 60)
            
            // How it works button
            Button(action: {
                // Show how it works
            }) {
                Text("How does Wooma work?")
                    .font(.custom("SofiaSans-Bold", size: 18))
                    .foregroundColor(.woomaGreen)
            }
            
            Spacer()
            
            // Bottom button using your reusable component
            BottomButtonView(
                text: "Protect your deposit",
                action: {
                    navigateToCreateReport = true
                }
            )
            .navigationDestination(isPresented: $navigateToCreateReport) {
                // Navigate to create report screen
                // Replace with your actual view
                GuideView() // Or whatever view should come next
            }
            AppTabBar(selectedTab: 0)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.woomaBackground)
    }
}

