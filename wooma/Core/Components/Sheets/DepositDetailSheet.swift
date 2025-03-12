//
//  DepositDetailSheet.swift
//  wooma
//
//  Created by Carlo on 3/11/25.
//


import SwiftUI

struct DepositDetailSheet: View {
    @Environment(\.dismiss) private var dismiss
    let title: String
    let emoji: String
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Top navigation area with close button
                HStack {
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "xmark")
                            .font(.system(size: 20))
                            .foregroundColor(.green)
                    }
                    Spacer()
                }
                .padding(.top, 20)
                
                // Main title
                Text(title)
                    .font(.custom("SofiaSans-Bold", size: 28))
                    .foregroundColor(.black)
                    .padding(.top, 10)
                
                // Main description
                Text("When you rent a place in the UK, your deposit must be placed in a government-approved tenancy deposit scheme (TDP) within 30 days of payment.")
                    .font(.custom("SofiaSans-Regular", size: 20))
                    .foregroundColor(.black)
                
                // These schemes ensure section
                Text("These schemes ensure:")
                    .font(.custom("SofiaSans-Bold", size: 20))
                    .foregroundColor(.black)
                    .padding(.top, 10)
                
                // Checkmark items
                CheckmarkItem(text: "Your money is safe and can't be unfairly withheld.")
                CheckmarkItem(text: "You get a clear process for disputes.")
                CheckmarkItem(text: "Landlords can't just keep your deposit without a valid reason.")
                
                // Which schemes are approved section
                Text("Which schemes are approved?")
                    .font(.custom("SofiaSans-Bold", size: 20))
                    .foregroundColor(.black)
                    .padding(.top, 10)
                
                // Bullet list
                VStack(alignment: .leading, spacing: 8) {
                    BulletItem(text: "Deposit Protection Service (DPS)")
                    BulletItem(text: "MyDeposits")
                    BulletItem(text: "Tenancy Deposit Scheme (TDS)")
                }
                
                // How to check section
                Text("How to check if your deposit is protected")
                    .font(.custom("SofiaSans-Bold", size: 20))
                    .foregroundColor(.black)
                    .padding(.top, 10)
                
                Text("Your landlord must provide proof of which scheme your deposit is in. If you haven't received this, ask them!")
                    .font(.custom("SofiaSans-Regular", size: 20))
                    .foregroundColor(.black)
                
                Text("You can also check directly with the deposit schemes using your tenancy details.")
                    .font(.custom("SofiaSans-Regular", size: 20))
                    .foregroundColor(.black)
                    .padding(.top, 8)
                
                // Warning section
                HStack(alignment: .top, spacing: 8) {
                    Text("⚠️")
                        .font(.system(size: 20))
                    
                    Text("If your deposit isn't protected Your landlord is breaking the law. You could be entitled to compensation worth up to 3x your deposit amount.")
                        .font(.custom("SofiaSans-Regular", size: 16))
                        .foregroundColor(.black)
                }
                .padding(.top, 20)
                
                // Got it button
                BottomButtonView(
                    text: "Got it",
                    action: {
                        dismiss()
                    },
                    showArrow: false
                )
                .padding(.horizontal, -24)
            }
            .padding(.horizontal, 24)
        }
        .background(Color(hex: "#FAFDF8"))
    }
}

// Checkmark Item Component
struct CheckmarkItem: View {
    let text: String
    
    var body: some View {
        HStack(alignment: .top, spacing: 8) {
            Image(systemName: "checkmark.square.fill")
                .foregroundColor(.green)
                .font(.system(size: 20))
            
            Text(text)
                .font(.custom("SofiaSans-Regular", size: 20))
                .foregroundColor(.black)
            
            Spacer()
        }
    }
}

// Bullet Item Component
struct BulletItem: View {
    let text: String
    
    var body: some View {
        HStack(alignment: .top, spacing: 8) {
            Text("•")
                .font(.system(size: 20))
                .foregroundColor(.black)
            
            Text(text)
                .font(.custom("SofiaSans-Regular", size: 20))
                .foregroundColor(.black)
            
            Spacer()
        }
    }
}
