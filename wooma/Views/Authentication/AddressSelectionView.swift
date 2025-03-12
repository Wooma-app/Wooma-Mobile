//
//  AddressSelectionView.swift
//  wooma
//
//  Created by Carlo on 2/27/25.
//

import SwiftUI

struct AddressSelectionView: View {
    // Public postcode property so it can be set from LoginWithPhone
    public var postcode: String
    @State private var selectedAddress: String?
    @State private var navigateToSpaces = false
    @Environment(\.presentationMode) private var presentationMode
    var onAddressSelected: ((String) -> Void)?
    
    // Public initializer
    public init(postcode: String, onAddressSelected: ((String) -> Void)? = nil) {
        self.postcode = postcode
        self.onAddressSelected = onAddressSelected
    }
    
    // Mock addresses based on the postcode
    private var addresses: [String] = [
        "77 Apple Drive, London, Greater London, NW3 4TX",
        "77 Apple Drive, London, Greater London, NW3 4TX",
        "77 Apple Drive, London, Greater London, NW3 4TX",
        "77 Apple Drive, London, Greater London, NW3 4TX",
        "77 Apple Drive, London, Greater London, NW3 4TX",
        "77 Apple Drive, London, Greater London, NW3 4TX",
        "77 Apple Drive, London, Greater London, NW3 4TX",
        "77 Apple Drive, London, Greater London, NW3 4TX",
        "77 Apple Drive, London, Greater London, NW3 4TX"
    ]
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                // Header with back button and title
                HStack {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "arrow.left")
                            .font(.title2)
                            .foregroundColor(.green)
                    }
                    
                    Spacer()
                    
                    Text("Your address")
                        .font(.custom("SofiaSans-Bold", size: 20))
                        .foregroundColor(.black)
                    
                    Spacer()
                    
                    // Empty view to balance the layout
                    Image(systemName: "arrow.left")
                        .font(.title2)
                        .foregroundColor(.clear)
                }
                .padding(.horizontal)
                .padding(.top, 10)
                .padding(.bottom, 20)
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 16) {
                        // Postcode input field
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Postcode")
                                .font(.custom("SofiaSans-Bold", size: 16))
                                .foregroundColor(.secondary)
                            
                            Text(postcode)
                                .font(.custom("SofiaSans-Bold", size: 24))
                                .padding(.bottom, 8)
                        }
                        .padding(.horizontal)
                        
                        // Single card containing the entire address list
                        VStack(spacing: 0) {
                            ForEach(0..<addresses.count, id: \.self) { index in
                                let address = addresses[index]
                                
                                NavigationLink(
                                    destination: SpacesView(),
                                    label: {
                                        VStack(spacing: 0) {
                                            HStack {
                                                Text(address)
                                                    .font(.custom("SofiaSans-Regular", size: 20))
                                                    .foregroundColor(.black)
                                                    .padding(.vertical, 16)
                                                
                                                Spacer()
                                                
                                                Image(systemName: "chevron.right")
                                                    .foregroundColor(.black)
                                            }
                                            .padding(.horizontal, 16)
                                            
                                            // Add divider after every item (including the last one)
                                            Rectangle()
                                                .fill(Color.gray.opacity(0.2))
                                                .frame(height: 1)
                                                .padding(.leading, 15)
                                        }
                                    }
                                )
                                .buttonStyle(PlainButtonStyle())
                            }
                        }
                        .background(Color.white)
                        .cornerRadius(12)
                        .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 2)
                        .overlay(
                            RoundedRectangle(cornerRadius: 1)
                                .stroke(Color.gray.opacity(0.2), lineWidth: 0)
                        )
                        .padding(.horizontal)
                        .padding(.bottom, 20)
                    }
                }
            }
            .background(Color.woomaBackground)
            .navigationBarHidden(true)
        }
    }
}
