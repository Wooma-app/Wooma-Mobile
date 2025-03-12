import SwiftUI

struct Space: Identifiable {
    let id = UUID()
    let icon: String
    let name: String
    var isSelected: Bool = false
}

struct SpacesView: View {
    
    @State private var spaces: [Space] = [
        Space(icon: "🛏", name: "Bedroom"),
        Space(icon: "🛋", name: "Living room"),
        Space(icon: "🍳", name: "Kitchen"),
        Space(icon: "🛁", name: "Bathroom"),
        Space(icon: "🚽", name: "Toilet / WC"),
        Space(icon: "🪵", name: "Hallway"),
        Space(icon: "🧺", name: "Utility room")
    ]
    
    @State private var isShowingCustomSpaceSheet = false
    @State private var newSpaceName = ""
    @State private var navigateToReport = false
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                // Custom Navigation Bar
                HStack {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "arrow.left")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(.woomaGreen)
                    }
                    
                    Spacer()
                }
                .padding()
                .background(Color(hex: "#FAFDF8"))
                
                SpacesTitleSection()
                
                // Main content including scrollable list
                VStack(spacing: 0) {
                    // Space List Card in a ScrollView
                    ScrollView {
                        VStack(alignment: .leading, spacing: 0) {
                            Text("Spaces")
                                .font(.custom("SofiaSans-Bold", size: 18))
                                .foregroundColor(.black)
                                .padding(.leading, 15)
                                .padding(.top, 18)
                            
                            // List of Spaces inside a Card
                            VStack(spacing: 0) {
                                ForEach(spaces.indices, id: \.self) { index in
                                    Button(action: {
                                        spaces[index].isSelected.toggle()
                                    }) {
                                        HStack {
                                            Text("\(spaces[index].icon) \(spaces[index].name)")
                                                .font(.custom("SofiaSans-Regular", size: 20))
                                                .foregroundColor(.black)
                                            
                                            Spacer()
                                            
                                            Image(systemName: spaces[index].isSelected ? "checkmark.square.fill" : "square")
                                                .foregroundColor(spaces[index].isSelected ? .woomaGreen : .gray)
                                                .font(.system(size: 20))
                                        }
                                        .contentShape(Rectangle())
                                    }
                                    .buttonStyle(PlainButtonStyle())
                                    .padding(.vertical, 13)
                                    .padding(.horizontal)
                                    
                                    Divider()
                                }
                            }
                            .background(Color.white)
                            .cornerRadius(5)
                            
                            // Add Another Space Button
                            Button(action: {
                                isShowingCustomSpaceSheet = true
                            }) {
                                Text("Add custom space")
                                    .font(.custom("SofiaSans-Regular", size: 20))
                                    .foregroundColor(.woomaGreen)
                                    .padding(.vertical, 10)
                            }
                            .padding(.leading, 15)
                            .padding(.bottom, 10)
                        }
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
                        .padding(.horizontal)
                    }
                    
                    Spacer(minLength: 0)
                    
                    // Bottom Section with Button - Fixed at bottom
                    // Bottom Section with Button - Fixed at bottom
                    VStack(spacing: 0) {
                        Divider()
                        
                        Spacer().frame(height: 16)
                        
                        BottomButtonView(
                            text: "Start reporting",
                            action: {
                                navigateToReport = true
                            }
                        )
                        .padding(.vertical, 0)
                        
                        // Change the navigation destination to EditSpaceView
                        .navigationDestination(isPresented: $navigateToReport) {
                            // Get the first selected space, or default to the first space if none selected
                            let selectedSpace = spaces.first(where: { $0.isSelected }) ?? spaces.first!
                            EditSpaceView(space: selectedSpace)
                        }
                    }
                }
            }
            .background(Color(hex: "#FAFDF8"))
            .navigationBarHidden(true)
            
            // Custom Space Sheet
            if isShowingCustomSpaceSheet {
                CustomSpaceBottomSheet(
                    isShowing: $isShowingCustomSpaceSheet,
                    newSpaceName: $newSpaceName,
                    onAddSpace: {
                        if !newSpaceName.isEmpty {
                            let newSpace = Space(icon: "🏠", name: newSpaceName, isSelected: true)
                            spaces.append(newSpace)
                            newSpaceName = ""
                        }
                    }
                )
            }
        }
    }
}


