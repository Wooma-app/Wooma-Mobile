//
//  OnboardingStepSecondView.swift
//  wooma
//
//  Created by Carlo on 2/27/25.
//

import SwiftUI

struct WoomaStoryView: View {
    var body: some View {
        ZStack {
            // Background color
            Color(.systemBackground).edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 0) {
                // Header with back button and "Get in touch" text
                SecondViewHeaderView()
                
                // Main scrollable content
                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        // Story headline and profile
                        StoryHeadlineView()
                        
                    
                        StoryCardView()
                        // Founder's story
                        FounderStoryView()
                        
                        // Call to action at the bottom of scroll
                        Text("Got an idea for Wooma? Go to Settings > Suggest a feature—I read every one.")
                            .font(.custom("SofiaSans-Regular", size: 16))
                            .foregroundColor(.secondary)
                            .padding(.top, 20)
                            .padding(.bottom, 30)
                    }
                    .padding(.horizontal, 24)
                }
                
                // Fixed button at bottom
                NavigationLink(destination: LoginWithPhone()) {
                    BottomButtonView(text: "Get protected now", action:{
                        
                    })
                }
                
            }
        }
        .navigationBarHidden(true) // Hide the default navigation bar
    }
}
struct StoryCardView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            // Long story short text
            Text("Long story short")
                .font(.custom("SofiaSans-Bold", size: 18))
                .padding(.top, 4)
                .padding(.bottom, 8)
            
            // Story points
            StoryPointView(
                iconText: "🛏",
                iconColor: .brown,
                title: "First rental, first shock",
                description: "At uni, I got stung by an unfair deposit deduction. Dodgy landlord, no proof. Money gone."
            )
            Divider()
            StoryPointView(
                iconText: "💬",
                iconColor: .gray,
                title: "Same story, different mates",
                description: "Turns out, I wasn't alone. Friends, family—everyone had a nightmare landlord story."
            )
            Divider()
            StoryPointView(
                iconText: "💡",
                iconColor: .yellow,
                title: "Fixing it with tech",
                description: "I knew an app could solve this. Built my skills, worked in tech, and made Wooma: a simple way to protect your deposit with rock-solid proof."
            )
            Divider()
            StoryPointView(
                iconText: "⚡",
                iconColor: .yellow,
                title: "No stress, no rip-offs",
                description: "Now, renters can fight back. Quick photos, instant report, no arguments. Your deposit, your money."
            )
            Divider()
            StoryPointView(
                iconText: "💪",
                iconColor: .orange,
                title: "Join the movement",
                description: "Landlords have had the power for too long. With Wooma, you're covered."
            )
        }
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.white)
                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 0)
        )
    }
}
// Header with back button and "Get in touch" text
struct SecondViewHeaderView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        HStack {
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "arrow.left")
                    .font(.system(size: 20, weight: .medium))
                    .foregroundColor(.green)
            }
            
            Spacer()
            
            Text("Press? ")
                .foregroundColor(.primary)
                .font(.custom("SofiaSans-Regular", size: 18)) +
            Text("Get in touch")
                .foregroundColor(.green)
                .font(.custom("SofiaSans-Bold", size: 18))
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 12)
    }
}

// Story headline with profile image
struct StoryHeadlineView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("The Wooma Story")
                .font(.custom("SofiaSans-Bold", size: 28))
            
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 4) {
                    Text("How Fraser's uni nightmare")
                        .font(.custom("SofiaSans-Regular", size: 20))
                        .foregroundColor(.secondary)
                    
                    Text("became a fix for renters")
                        .font(.custom("SofiaSans-Regular", size: 20))
                        .foregroundColor(.secondary)
                    
                    Text("everywhere")
                        .font(.custom("SofiaSans-Regular", size: 20))
                        .foregroundColor(.secondary)
                }
                .padding(.trailing, 8)
                
                Spacer()
                
                // Profile image
                Image("founder") // Replace with actual image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 2))
                    .background(Circle().fill(Color.white))
                    .shadow(radius: 1)
            }
        }
        .padding(.top, 8)
        .padding(.bottom, 8)
    }
}

// Story point component
struct StoryPointView: View {
    let iconText: String
    let iconColor: Color
    let title: String
    let description: String
    
    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            Text(iconText)
                .foregroundColor(iconColor)
                .font(.system(size: 20))
                .frame(width: 24, height: 24)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.custom("SofiaSans-Bold", size: 20))
                
                Text(description)
                    .font(.custom("SofiaSans-Regular", size: 18))
                    .foregroundColor(.secondary)
                    .lineSpacing(2)
            }
        }
        .padding(.vertical, 6)
    }
}

// Founder's full story component
struct FounderStoryView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Like a lot of students, I was broke at uni. Rent was my biggest expense, and I needed my deposit back when I moved out.")
                .font(.custom("SofiaSans-Regular", size: 18))
            
            Text("But when the time came, my landlord hit me with unfair deductions for things that weren't even my fault.")
                .font(.custom("SofiaSans-Regular", size: 18))
            
            Text("A mark on the wall? \"That'll be £50.\" A carpet stain that was already there? \"That's £100.\" It didn't matter what I said—I had no proof. I lost money I couldn't afford to lose.")
                .font(.custom("SofiaSans-Regular", size: 18))
            
            Text("Then I started hearing the same story from mates, family—pretty much every renter I knew. Landlords holding onto deposits, dodgy deductions, fights that couldn't be won.")
                .font(.custom("SofiaSans-Regular", size: 18))
            
            Text("And the best advice out there? \"Take some pictures when you move in.\" But random photos buried in a camera roll weren't enough to win a dispute.")
                .font(.custom("SofiaSans-Regular", size: 18))
            
            Text("Fast forward a few years—I got into tech, working on products designed to make life easier for people.")
                .font(.custom("SofiaSans-Regular", size: 18))
            
            Text("And I couldn't shake the thought: why isn't there a simple way to protect renters from getting ripped off?")
                .font(.custom("SofiaSans-Regular", size: 18))
            
            Text("So I built Wooma.")
                .font(.custom("SofiaSans-Bold", size: 18))

            Text("It's the tool I wish I had at uni. A simple, professional report that locks in proof of your place's condition at move-in—so when you move out, you don't lose a penny that you shouldn't.")
                .font(.custom("SofiaSans-Regular", size: 18))
            
            Text("No arguments, no stress, no digging through old photos hoping they'll save you.")
                .font(.custom("SofiaSans-Regular", size: 18))
            
            Text("Because getting your deposit back shouldn't be a gamble.")
                .font(.custom("SofiaSans-Bold", size: 18))
                .padding(.top, 4)
        }
        .padding(.top, 16)
    }
}
