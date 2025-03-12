//
//  woomaApp.swift
//  wooma
//
//  Created by Carlo on 2/14/25.
//

import SwiftUI

@main
struct woomaApp: App {
    @State private var showSplash = true // Track the splash screen state
    
    var body: some Scene {
        WindowGroup {
            if showSplash {
                SplashScreenView()
                    .onAppear{
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            showSplash = false
                        }
                    }
            } else {
                LoginView()
            }
            
        }
    }
}
