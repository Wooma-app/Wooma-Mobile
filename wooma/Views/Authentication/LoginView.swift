//
//  LoginView.swift
//  wooma
//
//  Created by Carlo on 2/27/25.
//

import SwiftUI

struct LoginView: View {
    @State private var navigateToOnboarding = false
    @State private var navigateToReport = false
    
    var body: some View {
        NavigationStack {  // Changed from NavigationView to NavigationStack
            VStack(spacing: 0) {
                Spacer()
                
                // Main stats content
                VStack(alignment: .leading, spacing: 4) {
                    HStack(alignment: .firstTextBaseline, spacing: 0) {
                        Text("62%")
                            .foregroundColor(.woomaGreen)
                            .font(.custom("SofiaSans-Bold", size: 38))
                        
                        Text(" of renters lose")
                            .foregroundColor(.black)
                            .font(.custom("SofiaSans-Bold", size: 38))
                    }
                    .padding(.bottom, 2)
                    
                    Text("part of their deposit.")
                        .foregroundColor(.black)
                        .font(.custom("SofiaSans-Bold", size: 38))
                    .padding(.bottom, 2)
                    
                    Text("The average loss is")
                        .foregroundColor(.black)
                        .font(.custom("SofiaSans-Bold", size: 38))
                    .padding(.bottom, 2)
                    
                    Text("£250.")
                        .foregroundColor(.woomaGreen)
                        .font(.custom("SofiaSans-Bold", size: 38))
                }
                .padding(.horizontal, 24)
                
                // Text description
                Text("Wooma helps you keep your money\nwhere it belongs—in your pocket.")
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.woomaGray)
                    .font(.custom("SofiaSans-Regular", size: 20))
                    .padding(.top, 24)
                    .padding(.horizontal, 30)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 40)
                
                // Get protected button
                Button(action: {
                    navigateToOnboarding = true
                }) {
                    HStack {
                        Text("Get protected now")
                            .font(.custom("SofiaSans-Bold", size: 18))
                            .foregroundColor(.white)
                        
                        Image(systemName: "arrow.right")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundColor(.white)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 16)
                    .background(Color.woomaGreen)
                    .cornerRadius(35)
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 16)
                
                // Log in button
                Button(action: {
                    navigateToReport = true
                }) {
                    Text("Log in")
                        .font(.custom("SofiaSans-Bold", size: 18))
                        .foregroundColor(Color.woomaGreen)
                }
                .padding(.bottom, 40)
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.woomaBackground)
            .edgesIgnoringSafeArea(.all)
            .navigationBarHidden(true)
            .navigationDestination(isPresented: $navigateToOnboarding) {
                ReportListView()
            }
            .navigationDestination(isPresented: $navigateToReport) {
                LoginWithPhone()
            }
        }
    }
}
