//
//  CustomSpaceBottomSheet.swift
//  wooma
//
//  Created by Carlo on 3/12/25.
//

import SwiftUI

struct CustomSpaceBottomSheet: View {
    @Binding var isShowing: Bool
    @Binding var newSpaceName: String
    var onAddSpace: () -> Void
    
    var body: some View {
        ZStack(alignment: .bottom) {
            // Semi-transparent background
            if isShowing {
                Color.black.opacity(0.3)
                    .ignoresSafeArea()
                    .onTapGesture {
                        isShowing = false
                    }
            }
            
            // Bottom Sheet
            VStack(spacing: 0) {
                // Close Button (X)
                HStack {
                    Button(action: {
                        isShowing = false
                    }) {
                        Image(systemName: "xmark")
                            .font(.system(size: 24))
                            .foregroundColor(.woomaGreen)
                            .padding()
                    }
                    Spacer()
                }
                
                // Title
                Text("Add a custom space")
                    .font(.custom("SofiaSans-Medium", size: 16))
                    .foregroundStyle(Color.woomaGray)
                    .padding(.horizontal)
                    .padding(.bottom, 20)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                // Text Field
                TextField("Bedroom 2", text: $newSpaceName)
                    .font(.custom("SofiaSans-Regular", size: 20))
                    .padding()
                    .background(Color.white)
                    .cornerRadius(8)
                    .padding(.horizontal)
                
                Spacer()
                
                // Continue Button
                Button(action: {
                    onAddSpace()
                    isShowing = false
                }) {
                    Text("Continue")
                        .font(.custom("SofiaSans-Bold", size: 18))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.woomaGreen)
                        .cornerRadius(35)
                        .padding(.horizontal)
                }
                .padding(.bottom, 40)
                .padding(.top, 20)
            }
            .background(Color.white)
            .cornerRadius(16, corners: [.topLeft, .topRight])
            .offset(y: isShowing ? 0 : UIScreen.main.bounds.height)
            .animation(.spring(), value: isShowing)
            .frame(height: 300)
        }
        .ignoresSafeArea()
    }
}

// Title section
struct SpacesTitleSection: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Pick the spaces you want to check over")
                .font(.custom("SofiaSans-Bold", size: 28))
                .padding(.top, 8)
        }
        .padding(.horizontal)
    }
}
