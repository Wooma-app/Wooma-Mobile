import SwiftUI

struct SettingsView: View {
    @State private var phoneNumber = "07767367362"
    
    var body: some View {
        ZStack(alignment: .bottom) {
            // Main content
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    // Title
                    Text("Settings")
                        .font(.custom("SofiaSans-Bold", size: 20))
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(.top, 8)
                    
                    // Phone number section
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Phone number")
                            .font(.custom("SofiaSans-Regular", size: 16))
                            .foregroundColor(.gray)
                        
                        Text(phoneNumber)
                            .font(.custom("SofiaSans-Regular", size: 20))
                    }
                    .padding(.horizontal, 24)
                    
                    // About section
                    CardSectionView(title: "About") {
                        MenuLinkItem(title: "How it works", hasChevron: true)
                        MenuLinkItem(title: "The Wooma story", hasChevron: true)
                    }
                    
                    // Account section
                    CardSectionView(title: "Account") {
                        MenuLinkItem(title: "Log out", hasChevron: true)
                        MenuLinkItem(title: "Delete my account", hasChevron: true, isDestructive: true)
                    }
                    
                    // Support section
                    CardSectionView(title: "Support and feedback") {
                        MenuLinkItem(title: "Contact support", hasChevron: true)
                        MenuLinkItem(title: "Give feedback", hasChevron: true)
                        MenuLinkItem(title: "Rate on the App Store", hasChevron: true)
                    }
                    
                    // Legal section
                    CardSectionView(title: "Legal") {
                        MenuLinkItem(title: "Terms of service", hasChevron: true)
                        MenuLinkItem(title: "Privacy policy", hasChevron: true)
                    }
                    
                    // Add extra space at the bottom to account for tab bar
                    Spacer().frame(height: 100)
                }
                .padding(.horizontal, 24)
            }
            .background(Color(hex: "#FAFDF8"))
            
            // Tab bar
            AppTabBar(selectedTab: 3)
        }
        .navigationBarHidden(true)
    }
}
