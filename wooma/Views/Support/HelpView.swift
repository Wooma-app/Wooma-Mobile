import SwiftUI

struct HelpView: View {
    // Get the safe area bottom inset to properly position content above tab bar
    @State private var bottomSafeArea: CGFloat = 0
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .bottom) {
                // Main scrollable content
                ScrollView {
                    VStack(alignment: .leading, spacing: 0) {
                        // Title with light bulb emoji
                        HStack(spacing: 4) {
                            Text("Don't Get Ripped Off — Know Your Rights💡")
                                .font(.custom("SofiaSans-Bold", size: 28))
                                .foregroundColor(.black)
                                .fixedSize(horizontal: false, vertical: true)
                        }
                        .padding(.top, 24)
                        .padding(.horizontal, 24)
                        
                        // Subtitle
                        Text("Make sure you don't get ripped off. Landlords hate you knowing your rights. Luckily for you, Wooma's got your back.")
                            .font(.custom("SofiaSans-Regular", size: 18))
                            .foregroundColor(.woomaTextGray)
                            .padding(.top, 16)
                            .padding(.horizontal, 24)
                            .fixedSize(horizontal: false, vertical: true)
                        
                        // Deposits 101 Section with Left-Aligned Title
                        VStack(alignment: .leading, spacing: 0) {
                            Text("Deposits 101")
                                .font(.custom("SofiaSans-Bold", size: 18))
                                .foregroundColor(.black)
                                .padding(.top, 32)
                                .padding(.horizontal, 24)
                                .frame(maxWidth: .infinity, alignment: .leading) // Ensure left alignment
                            
                            // Deposits 101 Card
                            VStack(spacing: 0) {
                                // Deposit info items
                                HelpInfoItem(
                                    emoji: "📸",
                                    title: "Your deposit must be protected in a government-approved scheme."
                                )
                                
                                HelpInfoItem(
                                    emoji: "🛠️",
                                    title: "You should get your deposit details within 30 days."
                                )
                                
                                HelpInfoItem(
                                    emoji: "🏡",
                                    title: "Your deposit must be returned within 10 days if there are no disputes."
                                )
                            }
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(color: Color.black.opacity(0.02), radius: 4, x: 0, y: 2)
                            .padding(.horizontal, 24)
                            .padding(.top, 12)
                        }
                        
                        // Common landlord tricks section with Left-Aligned Title
                        VStack(alignment: .leading, spacing: 0) {
                            Text("Common landlord tricks")
                                .font(.custom("SofiaSans-Bold", size: 18))
                                .foregroundColor(.black)
                                .padding(.top, 32)
                                .padding(.horizontal, 24)
                                .frame(maxWidth: .infinity, alignment: .leading) // Ensure left alignment
                            
                            // Landlord tricks Card
                            VStack(spacing: 0) {
                                // Landlord tricks items
                                HelpInfoItem(
                                    emoji: "🧹",
                                    title: "Charging you for stuff that's just wear and tear"
                                )
                                
                                HelpInfoItem(
                                    emoji: "💰",
                                    title: "Withholding your deposit without proof"
                                )
                                
                                HelpInfoItem(
                                    emoji: "🧼",
                                    title: "Unfair deductions for things like cleaning"
                                )
                            }
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(color: Color.black.opacity(0.02), radius: 4, x: 0, y: 2)
                            .padding(.horizontal, 24)
                            .padding(.top, 12)
                        }
                        
                        // Extra space at the bottom to ensure content doesn't go behind tab bar
                        Spacer()
                            .frame(height: 80 + bottomSafeArea) // Height of tab bar + safe area
                    }
                }
                .background(Color.woomaBackground)
                .edgesIgnoringSafeArea(.bottom)
                .navigationBarHidden(true)
                
                // Get the safe area inset
                Color.clear
                    .frame(height: 0)
                    .background(GeometryReader { geo in
                        Color.clear.onAppear {
                            bottomSafeArea = geo.safeAreaInsets.bottom
                        }
                    })
                
                // Tab bar with fixed position at bottom
                VStack(spacing: 0) {
                    AppTabBar(selectedTab: 1)
                }
                .background(Color.white)
            }
        }
    }
}

// Help Info Item Component
struct HelpInfoItem: View {
    let emoji: String
    let title: String
    @State private var showDetail = false
    var body: some View {
        Button(action: {
            showDetail = true
        }) {
            HStack(spacing: 16) {
                Text(emoji)
                    .font(.system(size: 28))
                    .frame(width: 20)
                
                Text(title)
                    .font(.custom("SofiaSans-Medium", size: 18))
                    .foregroundColor(.black)
                    .fixedSize(horizontal: false, vertical: true)
                    .multilineTextAlignment(.leading)
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .foregroundColor(.black)
                    .font(.system(size: 16, weight: .semibold))
            }
            .padding(.vertical, 16)
            .padding(.horizontal, 24)
        }
        .buttonStyle(PlainButtonStyle())
        .background(Color.white)
        .sheet(isPresented: $showDetail) {
            DepositDetailSheet(title: title, emoji: emoji)
        }
    }
}
