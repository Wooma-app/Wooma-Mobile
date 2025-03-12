//
//  LoginWithPhone.swift
//  wooma
//
//  Created by Carlo on 2/27/25.
//

import SwiftUI

struct LoginWithPhone: View {
    // Track the current screen
    enum LoginScreen {
        case phoneInput
        case verification
        case addressInput
    }
    
    @State private var currentScreen: LoginScreen = .phoneInput
    @State private var phoneNumber: String = ""
    @State private var verificationCode: String = ""
    @State private var postcode: String = ""
    @State private var showAddressSelection: Bool = false
    @FocusState private var isPhoneFieldFocused: Bool
    @FocusState private var isCodeFieldFocused: Bool
    @FocusState private var isPostcodeFieldFocused: Bool
    @Environment(\.presentationMode) private var presentationMode
    // For the verification code UI with 6 boxes
    private let codeLength = 6
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                // Header with back button
                HStack {
                    Button(action: {
                        // Go back to previous screen
                        switch currentScreen {
                        case .phoneInput:
                            // Handle back button action (e.g., dismiss view)
                            break
                        case .verification:
                            currentScreen = .phoneInput
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                isPhoneFieldFocused = true
                            }
                        case .addressInput:
                            currentScreen = .verification
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                isCodeFieldFocused = true
                            }
                        }
                    }) {
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }) {
                            Image(systemName: "arrow.left")
                                .font(.title2)
                                .foregroundColor(.green)
                        }
                    }
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.top, 10)
                .padding(.bottom, 30)
                
                // Display appropriate screen content
                switch currentScreen {
                case .phoneInput:
                    phoneInputView
                case .verification:
                    verificationCodeView
                case .addressInput:
                    addressInputView
                }
                
                Spacer()
                
                // Continue button
                ContinueButton(action: {
                    switch currentScreen {
                    case .phoneInput:
                        // Go to verification screen
                        currentScreen = .verification
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                            isCodeFieldFocused = true
                        }
                    case .verification:
                        // Go to address screen
                        currentScreen = .addressInput
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                            isPostcodeFieldFocused = true
                        }
                    case .addressInput:
                        // Show address selection screen
                        if !postcode.isEmpty {
                            showAddressSelection = true
                        }
                    }
                })
            }
            .background(Color.white)
            .onAppear {
                // Set initial focus
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    switch currentScreen {
                    case .phoneInput:
                        isPhoneFieldFocused = true
                    case .verification:
                        isCodeFieldFocused = true
                    case .addressInput:
                        isPostcodeFieldFocused = true
                    }
                }
            }
            .navigationDestination(isPresented: $showAddressSelection) {
                AddressSelectionView(postcode: postcode)
            }
        }
        .navigationBarHidden(true)
    }
    
    // Phone number input screen
    private var phoneInputView: some View {
        VStack(alignment: .leading, spacing: 0) {
            // Welcome text
            HStack {
                VStack(alignment: .leading, spacing: 20) {
                    Text("Welcome back!")
                        .font(.custom("SofiaSans-Bold", size: 28))
                        .fontWeight(.bold)
                    
                    Text("Phone number")
                        .font(.custom("SofiaSans-Bold", size: 16))
                        .foregroundColor(.secondary)
                }
                Spacer()
            }
            .padding(.horizontal)
            
            // Phone number field
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.clear, lineWidth: 1)
                    .frame(height: 50)
                
                TextField("Enter phone number", text: $phoneNumber)
                    .font(.custom("SofiaSans-Bold", size: 20))
                    .keyboardType(.numberPad)
                    .focused($isPhoneFieldFocused)
            }
            .padding(.horizontal)
            
            // Verification info text
            HStack {
                Text("We'll send you a code to verify. No spam, ever.")
                    .font(.custom("SofiaSans-Bold", size: 14))
                    .foregroundColor(.secondary)
                Spacer()
            }
            .padding(.horizontal)
            .padding(.top, 10)
        }
    }
    
    // Verification code screen
    private var verificationCodeView: some View {
        VStack(alignment: .leading, spacing: 0) {
            // Title and subtitle
            VStack(alignment: .leading, spacing: 16) {
                Text("Enter 6-digit code")
                    .font(.custom("SofiaSans-Bold", size: 28))
                    .fontWeight(.bold)
                
                Text("Your code was sent to +\(phoneNumber)")
                    .font(.custom("SofiaSans-Bold", size: 16))
                    .foregroundColor(.secondary)
            }
            .padding(.horizontal)
            
            // Code input boxes
            HStack(spacing: 8) {
                ForEach(0..<codeLength, id: \.self) { index in
                    codeDigitBox(index: index)
                }
            }
            .padding(.horizontal)
            .padding(.top, 30)
            
            // Hidden actual text field for handling input
            TextField("", text: $verificationCode)
                .keyboardType(.numberPad)
                .focused($isCodeFieldFocused)
                .opacity(0)
                .frame(width: 0, height: 0)
                .onChange(of: verificationCode) { newValue in
                    // Limit to 6 digits
                    if newValue.count > codeLength {
                        verificationCode = String(newValue.prefix(codeLength))
                    }
                    
                    // Only allow numeric input
                    let filtered = newValue.filter { "0123456789".contains($0) }
                    if filtered != newValue {
                        verificationCode = filtered
                    }
                }
            
            // Resend code button
            Button(action: {
                // Handle resend code action
            }) {
                Text("Resend code")
                    .font(.custom("SofiaSans-Bold", size: 16))
                    .foregroundColor(.woomaGreen)
            }
            .padding(.horizontal)
            .padding(.top, 24)
        }
    }
    
    // Address input screen
    private var addressInputView: some View {
        VStack(alignment: .leading, spacing: 0) {
            // Title
            VStack(alignment: .leading, spacing: 16) {
                Text("What's the address of the place you're moving in to?")
                    .font(.custom("SofiaSans-Bold", size: 28))
                    .fontWeight(.bold)
                
                Text("Postcode")
                    .font(.custom("SofiaSans-Bold", size: 16))
                    .foregroundColor(.secondary)
            }
            .padding(.horizontal)
            
            // Postcode field
            TextField("", text: $postcode)
                .font(.custom("SofiaSans-Bold", size: 24))
                .padding(.horizontal)
                .padding(.top, 16)
                .focused($isPostcodeFieldFocused)
                .keyboardType(.asciiCapable)
                .disableAutocorrection(true)
                .onChange(of: postcode) { newValue in
                    // Convert to uppercase
                    if newValue != newValue.uppercased() {
                        postcode = newValue.uppercased()
                    }
                }
        }
    }
    
    // Individual box for a digit in the verification code
    private func codeDigitBox(index: Int) -> some View {
        let digit: String = index < verificationCode.count ?
            String(verificationCode[verificationCode.index(verificationCode.startIndex, offsetBy: index)]) : ""
        
        return ZStack {
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                .frame(height: 56)
                .background(RoundedRectangle(cornerRadius: 8).fill(Color.white))
            
            Text(digit)
                .font(.custom("SofiaSans-Bold", size: 24))
                .foregroundColor(.black)
        }
        .frame(maxWidth: .infinity)
        .onTapGesture {
            isCodeFieldFocused = true
        }
    }
}

// Fixed button at bottom with action parameter
struct ContinueButton: View {
    var action: () -> Void
    
    var body: some View {
        VStack {
            Button(action: action) {
                HStack {
                    Text("Continue")
                        .font(.custom("SofiaSans-Bold", size: 18))
                        .foregroundColor(.white)
                    
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 16)
                .background(Color.woomaGreen)
                .cornerRadius(35)
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 16)
        .background(
            Rectangle()
                .fill(Color(.systemBackground))
                .shadow(color: Color.black.opacity(0.05), radius: 4, x: 0, y: -2)
        )
    }
}
