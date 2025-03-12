//
//  ReportCard.swift
//  wooma
//
//  Created by Carlo on 3/12/25.
//

import SwiftUI

struct ReportCard: View {
    let report: Report
    @State private var navigateToDetails = false
    
    var body: some View {
        Button(action: {
            navigateToDetails = true
        }) {
            HStack {
                // Left Section: Report Details
                VStack(spacing: 0) {
                    HStack {
                        VStack(alignment: .leading, spacing: 0) {
                            Text(report.title)
                                .font(.custom("SofiaSans-Bold", size: 20))
                                .bold()
                                .foregroundColor(.black) // Ensure text color stays black in button
                            
                            Spacer().frame(height: 4) // 4px spacing
                            
                            Text(report.address)
                                .font(.custom("SofiaSans-Regular", size: 16))
                                .foregroundColor(.gray)
                            
                            Spacer().frame(height: 8) // 8px spacing
                            
                            // Status and Action in Same Line
                            HStack(spacing: 4) {
                                Text(report.status)
                                    .font(.custom("SofiaSans-Bold", size: 14))
                                    .foregroundColor(report.statusColor)
                                    .bold()
                                
                                if let actionText = report.actionText {
                                    Text(actionText)
                                        .font(.custom("SofiaSans-Bold", size: 14))
                                        .foregroundColor(report.progress != nil ? .woomaGreen : .gray)
                                        .bold()
                                }
                            }
                        }
                        
                        Spacer()
                        
                        // Right Section: Chevron Icon (Vertically Centered)
                        Image(systemName: "chevron.right")
                            .foregroundColor(.black)
                            .bold()
                            .font(.system(size: 16))
                            .padding(.trailing, 16)
                    }
                    .padding()
                    
                    // Progress Bar (Full Width)
                    if let progress = report.progress {
                        ProgressView(value: progress)
                            .progressViewStyle(LinearProgressViewStyle(tint: .woomaGreen))
                            .frame(height: 4)
                            .frame(maxWidth: .infinity) // Ensures full width
                            .padding(.horizontal, 16 ) // Aligns with the card's padding
                            .padding(.bottom, 20)
                    }
                }
            }
            .background(Color.white) // Matches #FFF
            .cornerRadius(10) // Rounded corners
            .shadow(color: Color.black.opacity(0.01), radius: 6, x: 0, y: 2) // Matches shadow specs
        }
        .buttonStyle(PlainButtonStyle()) // Keeps the original styling without button appearance
        .navigationDestination(isPresented: $navigateToDetails) {
            ReportDetailsView(reportTitle: report.title)
        }
    }
}

