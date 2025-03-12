//
//  ReportCompleteView.swift
//  wooma
//
//  Created by Carlo on 2/16/25.
//

import SwiftUI

struct ReportCompleteView: View {
    @State private var navigateToSpaces = false
    let reports: [Report] = [
        Report(title: "88 Grape Grove", address: "London, N42 5BA", status: "Complete", statusColor: .woomaGreen, actionText: nil, progress: nil),
        Report(title: "88 Grape Grove", address: "London, N42 5BA", status: "Complete", statusColor: .woomaGreen, actionText: nil, progress: nil),
        Report(title: "88 Grape Grove", address: "London, N42 5BA", status: "Complete", statusColor: .woomaGreen, actionText: nil, progress: nil)
    ]
    
    var body: some View {
        NavigationStack {
            if reports.isEmpty {
                EmptyReportsView()
            }
            else {
                VStack {
                    // Header
                    VStack(alignment: .leading, spacing: 8) {
                        HStack(spacing: 0) {
                            Text("All reports ")
                                .font(.custom("SofiaSans-Bold", size: 28))
                                .foregroundColor(.black)
                            Text("complete")
                                .font(.custom("SofiaSans-Bold", size: 28))
                                .foregroundColor(.woomaGreen) // Green
                        }
                        
                        Text("You're all set!")
                            .font(.custom("SofiaSans-Regular", size: 16))
                            .foregroundColor(.gray)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                    
                    .padding(.top)
                    
                    // List of reports
                    ScrollView {
                        VStack(spacing: 16) {
                            ForEach(reports) { report in
                                ReportCard(report: report) // Reuse ReportCardView
                            }
                        }
                        .padding(.horizontal)
                    }
                    
                    // Bottom Section with Divider + Button + Navigation
                    VStack(spacing: 0) {
                        Divider()
                        
                        BottomButtonView(
                            text: "Protect your deposit",
                            action: {
                                navigateToSpaces = true
                            }
                        )
                        .navigationDestination(isPresented: $navigateToSpaces) {
                            SpacesView()
                        }
                        // Bottom Navigation Bar
                        AppTabBar(selectedTab: 0)
                    }
                }
            }
        }
        .background(Color(.systemGroupedBackground))
        .navigationBarBackButtonHidden(true) // Hides the back button
    }
}
