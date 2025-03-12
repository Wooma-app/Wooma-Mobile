//
//  ContentView.swift
//  wooma
//
//  Created by Carlo on 2/14/25.
//

import SwiftUI

struct Report: Identifiable {
    let id = UUID()
    let title: String
    let address: String
    let status: String
    let statusColor: Color
    let actionText: String?
    let progress: Double? // 0.2 = 20%
}

struct ReportListView: View {
    @State private var navigateToReportComplete = false
    let reports: [Report] = [
        Report(title: "88 Grape Grove", address: "London, N42 5BA", status: "Pending Payment", statusColor: Color(hex: "#FFF8B400"), actionText: " - Tap to Finalise", progress: nil),
        Report(title: "88 Grape Grove", address: "London, N42 5BA", status: "Upload Failed", statusColor: Color(hex: "E03B3B"), actionText: " - Try Again", progress: nil),
        Report(title: "88 Grape Grove", address: "London, N42 5BA", status: "20% Done", statusColor: .woomaGreen, actionText: " - Your deposit’s counting on you!", progress: 0.2),
        Report(title: "88 Grape Grove", address: "London, N42 5BA", status: "Complete", statusColor: .woomaGreen, actionText: nil, progress: nil)
    ]
    
    var body: some View {
        NavigationStack {
            VStack {
                // Header
                VStack(alignment: .leading, spacing: 6) {
                    HStack {
                        Text("2 unfinished")
                            .font(.custom("SofiaSans-Bold", size: 28))
                            .foregroundColor(Color(hex: "#FFF8B400"))
                            .bold()
                        Text("reports")
                            .font(.custom("SofiaSans-Bold", size: 28))
                            .foregroundColor(.black)
                            .bold()
                    }
                    
                    Text("Finish them now and protect your deposit.")
                        .font(.custom("SofiaSans-Bold", size: 16))
                        .foregroundColor(Color(hex: "#606060"))
                }
                .frame(maxWidth: .infinity, alignment: .leading) // Align to the leading edge
                .padding(.horizontal, 24)
                .padding(.top)
                
                // Reports List
                ScrollView {
                    VStack(spacing: 16) {
                        ForEach(reports) { report in
                            ReportCard(report: report)
                        }
                    }
                    .padding(.horizontal, 24)
                }
                
                // Divider + Continue Button + Navigation
                VStack(spacing: 0) {
                    Divider()
                    
                    BottomButtonView(
                        text: "Continue your report",
                        action: {
                            navigateToReportComplete = true
                        }
                    )
                    .padding(.vertical, 0)
                    
                    // Add the navigation destination
                    .navigationDestination(isPresented: $navigateToReportComplete) {
                        ReportCompleteView()
                    }
                    
                    // Bottom Navigation
                    AppTabBar(selectedTab: 0)
                }
            }
            .background(Color(hex: "#FAFDF8"))
        }
        .navigationBarHidden(true)
    }
}

// MARK: - Report Card View
