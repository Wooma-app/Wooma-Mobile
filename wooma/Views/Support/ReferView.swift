import SwiftUI

struct ReferView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            // Custom navigation bar
            HStack {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "arrow.left")
                        .font(.system(size: 24))
                        .foregroundColor(.green)
                }
                
                Spacer()
                
                Button(action: {
                    // Handle edit button action
                }) {
                    Text("Edit")
                        .font(.custom("SofiaSans-Bold", size: 18))
                        .foregroundColor(.green)
                }
            }
            .padding(.horizontal, 24)
            .padding(.top, 10)
            .padding(.bottom, 24)
            
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    // Title with gift emoji
                    HStack(spacing: 8) {
                        Text("Refer friends, get your next report on us!🎁")
                            .font(.custom("SofiaSans-Bold", size: 28))
                            .foregroundColor(.black)
                            .fixedSize(horizontal: false, vertical: true)
                        
                    }
                    .padding(.horizontal, 24)
                    
                    // Subtitle
                    Text("Make sure your mates don't get ripped off. A Wooma report means no deposit drama later.")
                        .font(.custom("SofiaSans-Regular", size: 18))
                        .foregroundColor(Color(hex: "#606060"))
                        .padding(.horizontal, 24)
                        .padding(.top, 16)
                        .padding(.bottom, 32)
                    
                    // How it works section
                    Text("How it works")
                        .font(.custom("SofiaSans-Bold", size: 18))
                        .foregroundColor(.black)
                        .padding(.horizontal, 24)
                        .padding(.bottom, 16)
                    
                    // How it works card
                    VStack(spacing: 0) {
                        // Invite your mates
                        ReferStepItem(
                            title: "Invite your mates",
                            description: "Send your link to mates moving in—it's quick & easy.",
                            icon: "location.north",
                            iconRotation: 90
                        )
                        
                        Divider()
                            .padding(.leading, 64)
                        
                        // They get 50% off
                        ReferStepItem(
                            title: "They get 50% off",
                            description: "Your mate gets 50% off their first Wooma report.",
                            icon: "checkmark",
                            iconRotation: 0
                        )
                        
                        Divider()
                            .padding(.leading, 64)
                        
                        // You get a free report
                        ReferStepItem(
                            title: "You get a free report",
                            description: "Once 3 friends complete & pay for their reports, your next one is free!",
                            icon: "checkmark",
                            iconRotation: 0
                        )
                    }
                    .padding(.vertical, 16)
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(color: Color.black.opacity(0.05), radius: 4, x: 0, y: 2)
                    .padding(.horizontal, 24)
                    .padding(.bottom, 32)
                    
                    // Progress section
                    Text("Progress")
                        .font(.custom("SofiaSans-Bold", size: 18))
                        .foregroundColor(.black)
                        .padding(.horizontal, 24)
                        .padding(.bottom, 16)
                    
                    // Progress card
                    VStack(spacing: 16) {
                        // Referrals completed
                        HStack {
                            Text("Referrals completed")
                                .font(.custom("SofiaSans-Regular", size: 20))
                                .foregroundColor(.black)
                            
                            Spacer()
                            
                            Text("3")
                                .font(.custom("SofiaSans-Bold", size: 20))
                                .foregroundColor(.black)
                        }
                        .padding(.horizontal, 24)
                        
                        // Free reports earned
                        VStack(alignment: .leading, spacing: 4) {
                            HStack(alignment: .center) {
                                VStack(alignment: .leading, spacing: 4) {
                                    Text("Free reports earned")
                                        .font(.custom("SofiaSans-Regular", size: 20))
                                        .foregroundColor(.black)
                                    
                                    Text("Max 3 reports at a time")
                                        .font(.custom("SofiaSans-Regular", size: 18))
                                        .foregroundColor(Color(hex: "#606060"))
                                }
                                
                                Spacer()
                                
                                Text("1")
                                    .font(.custom("SofiaSans-Bold", size: 20))
                                    .foregroundColor(.green)
                                }
                            }
                        .padding(.horizontal, 24)
                    }
                    .padding(.vertical, 16)
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(color: Color.black.opacity(0.05), radius: 4, x: 0, y: 2)
                    .padding(.horizontal, 24)
                    .padding(.bottom, 32)
                    
                    Spacer(minLength: 100)
                }
            }
            
            // Bottom button
            BottomButtonView(
                text: "Give mates 50% off",
                action: {
                    // Handle share action
                },
                showArrow: false,
                backgroundColor: .woomaGreen
            )
        }
        .background(Color(hex: "#FAFDF8"))
        .navigationBarHidden(true)
    }
}

