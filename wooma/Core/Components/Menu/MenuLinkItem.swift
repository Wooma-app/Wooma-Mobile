//
//  MenuLinkItem.swift
//  wooma
//
//  Created by Carlo on 3/12/25.
//

import SwiftUI

// Menu Link Item Component
struct MenuLinkItem: View {
    let title: String
    let hasChevron: Bool
    var isDestructive: Bool = false
    @State private var navigateToDeleteAccount = false
    @State private var navigateToGuideView = false
    @State private var navigateToWoomaStory = false
    
    var body: some View {
        Button(action: {
            if isDestructive && title == "Delete my account" {
                navigateToDeleteAccount = true
            } else if title == "How it works" {
                navigateToGuideView = true
            } else if title == "The Wooma story" {
                navigateToWoomaStory = true
            }
            // Handle other button actions
        }) {
            HStack {
                Text(title)
                    .font(.custom("SofiaSans-Regular", size: 16))
                    .foregroundColor(isDestructive ? .red : .black)
                
                Spacer()
                
                if hasChevron {
                    Image(systemName: "chevron.right")
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                }
            }
            .padding(.vertical, 16)
            .padding(.horizontal, 16)
        }
        .buttonStyle(PlainButtonStyle())
        .navigationDestination(isPresented: $navigateToDeleteAccount) {
            DeleteAccountView()
        }
        .navigationDestination(isPresented: $navigateToGuideView) {
            GuideView()
        }
        .navigationDestination(isPresented: $navigateToWoomaStory) {
            WoomaStoryView()
        }
    }
}

