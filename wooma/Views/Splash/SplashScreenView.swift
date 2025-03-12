//
//  SplashScreenView.swift
//  wooma
//
//  Created by Carlo on 2/26/25.
//

import SwiftUI

struct SplashScreenView: View {
    var body: some View {
        VStack {
            Spacer() // Push content down to center it vertically

            // Display the logo image
            Image("wooma")  // The name of your image asset (wooma.jpg or wooma.png)
                .resizable()  // Allow resizing the image
                .scaledToFit()  // Scale to maintain aspect ratio
                .frame(width: 208, height: 36)  // Set the image size

            Spacer() // Push content up to center it vertically
        }
        .edgesIgnoringSafeArea(.all)  // Ensure the background extends to all edges (full-screen)
        .frame(maxWidth: .infinity, maxHeight: .infinity) // Ensure the background takes up the entire screen
        .background(Color.woomaGreen)  // Set the background color to green
    }
}
