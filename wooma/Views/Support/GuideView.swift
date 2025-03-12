//
//  OnboardingStepFirstView.swift
//  wooma
//
//  Created by Carlo on 2/27/25.
//

import SwiftUI

struct GuideView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                // Background color
                Color(.systemBackground).edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 0) {
                    // Header with title on the right
                    HeaderView()
                    
                    // Main scrollable content
                    ScrollView {
                        VStack(alignment: .leading, spacing: 24) {
                            // Title section
                            TitleSection()
                            
                            // Why you need Wooma section
                            WhyYouNeedWoomaSection()
                            
                            // How it works section
                            HowItWorksSection()
                            
                            // Extra space at bottom to ensure scrolling works properly
                            // when content is shorter than screen
                            Spacer().frame(height: 20)
                        }
                        .padding(.horizontal, 24)
                    }
                    
                    BottomButtonView(
                       text: "Get protected now",
                       action: {

                       }
                   )
                }
            }
            .navigationBarHidden(true) // Hide the default back button
        }
        
    }
}

// Header with title on the right
struct HeaderView: View {
    
    @Environment(\.presentationMode) var presentationMode // For back button
    var body: some View {
        HStack {
            Button(action: {
                presentationMode.wrappedValue.dismiss() // Go back
            }) {
                Image(systemName: "arrow.left")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(.woomaGreen)
            }
            Spacer()
            
            NavigationLink(destination: WoomaStoryView()) {
                            Text("The Wooma Story")
                                .foregroundColor(.green)
                                .font(.custom("SofiaSans-Bold", size: 18))
                        }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 12)
    }
}

// Title section
struct TitleSection: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Moving in? Lock in deposit protection now.")
                .font(.custom("SofiaSans-Bold", size: 28))
                .padding(.top, 8)
            
        }
    }
}

// Why you need Wooma section with checkpoints
// Why you need Wooma section with checkpoints
struct WhyYouNeedWoomaSection: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Why you need Wooma")
                .font(.custom("SofiaSans-Bold", size: 18))
                .padding(.top, 4)
                
            VStack(alignment: .leading, spacing: 16) {
                FeatureRow(
                    iconText: "🤷",
                    iconColor: .green,
                    title: "Landlords can play dirty",
                    description: "We all know someone who's lost money over unfair deductions. Wooma gives you rock-solid proof—so you don't get ripped off."
                )
                Divider() // Added divider
                FeatureRow(
                    iconText: "📸",
                    iconColor: Color(.darkGray),
                    title: "Screenshots won't save you",
                    description: "Screenshots alone won't settle a deposit dispute. Wooma turns them into a professional report landlords can't ignore."
                )
                Divider() // Added divider
                FeatureRow(
                    iconText: "✅",
                    iconColor: .green,
                    title: "Your future self will thank you",
                    description: "No stress. No missing money. No panic. Lock in your deposit protection in minutes."
                )
            }
            .padding(16)
            .background(Color.white)
            .cornerRadius(10)
            .shadow(color: Color.black.opacity(0.05), radius: 4, x: 0, y: 2)
        }
    }
}

// How it works section
struct HowItWorksSection: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("How it works")
                .font(.system(size: 16, weight: .semibold))
                .padding(.top, 8)
            
            VStack(alignment: .leading, spacing: 16) {
                FeatureRow(
                    iconText: "📝",
                    iconColor: .green,
                    title: "Snap & log your place",
                    description: "Take photos and notes—Wooma makes sure every detail is covered."
                )
                Divider() // Added divider
                FeatureRow(
                    iconText: "📄",
                    iconColor: .green,
                    title: "Instant, pro-level report",
                    description: "Your photos turn into a slick, time-stamped report that landlords can't argue with."
                )
                Divider() // Added divider
                FeatureRow(
                    iconText: "🛡️",
                    iconColor: .green,
                    title: "Stay protected, no stress",
                    description: "When you move out, you've got proof. No arguments, no stress."
                )
            }
            .padding(16)
            .background(Color.white)
            .cornerRadius(10)
            .shadow(color: Color.black.opacity(0.05), radius: 4, x: 0, y: 2)
        }
    }
}

