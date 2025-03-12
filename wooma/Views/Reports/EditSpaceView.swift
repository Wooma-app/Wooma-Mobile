import SwiftUI

struct EditSpaceView: View {
    let spaceName: String
    
    init(space: Space) {
        self.spaceName = space.name
    }
    @Environment(\.presentationMode) var presentationMode
    @State private var showingTips = true  // Controls PhotoTipsSheet
    @State private var showingRememberSection = true  // Controls Remember section visibility
    @State private var photoCount = 12  // For photo counter
    @State private var isManageMode = false  // Controls whether we're in manage mode
    @State private var photos = Array(repeating: "bedroom-photo", count: 12)  // Array to store photo identifiers
    
    // New state variables for issue flagging
    @State private var isShowingIssueView = false
    @State private var tipsSheetType: TipsSheetType = .photo  // Determines which tips to show
    
    // Navigation state for ReportIssuesView
    @State private var navigateToReportIssuesView = false
    
    var body: some View {
        ZStack {  // Wrap everything in a ZStack to show the sheet on top
            VStack(spacing: 0) {
                // Navigation Bar
                ZStack {
                    HStack {
                        Button(action: {
                            if isShowingIssueView {
                                isShowingIssueView = false
                            } else {
                                presentationMode.wrappedValue.dismiss()
                            }
                        }) {
                            Image(systemName: "arrow.left")
                                .font(.system(size: 24))
                                .foregroundColor(.woomaGreen)
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            if isShowingIssueView {
                                tipsSheetType = .issue  // Set tips type to issues
                            } else {
                                tipsSheetType = .photo  // Set tips type to photos
                            }
                            showingTips = true  // Show the tips sheet
                        }) {
                            Text("Tips")
                                .font(.custom("SofiaSans-Bold", size: 18))
                                .foregroundColor(.woomaGreen)
                        }
                    }
                    .padding(.horizontal, 20)
                    
                    Text(isShowingIssueView ? "\(spaceName) Issues" : "\(spaceName) Photos")
                        .font(.custom("SofiaSans-Bold", size: 20))
                }
                .padding(.top, 8)
                .padding(.bottom, 16)
                
                // Main Content
                if isShowingIssueView {
                    // Issue Flagging View
                    ScrollView {
                        VStack(alignment: .leading, spacing: 24) {
                            // Title
                            Text("Now let's flag any issues in the space")
                                .font(.custom("SofiaSans-Bold", size: 28))
                                .padding(.horizontal, 24)
                            
                            
                            Button(action: {
                                // Navigate to ReportIssuesView
                                navigateToReportIssuesView = true
                            }) {
                                VStack {
                                    Image(systemName: "plus.bubble")
                                        .font(.system(size: 36))
                                        .foregroundColor(.black)
                                    
                                    Text("Add issue")
                                        .font(.custom("SofiaSans-Regular", size: 18))
                                        .foregroundColor(.black)
                                        .padding(.top, 8)
                                }
                                .frame(maxWidth: .infinity)
                                .frame(height: 160)
                                .background(
                                    RoundedRectangle(cornerRadius: 12)
                                        .strokeBorder(style: StrokeStyle(lineWidth: 2, dash: [6, 6]))
                                        .foregroundColor(.green.opacity(0.4))
                                        .background(Color.green.opacity(0.2).cornerRadius(12))
                                )
                            }
                            .padding(.horizontal, 20)
                            
                            // Remember Section - Card Style
                            VStack(alignment: .leading, spacing: 0) {
                                HStack {
                                    Text("Remember")
                                        .font(.custom("SofiaSans-Bold", size: 18))
                                    
                                    Spacer()
                                    
                                    Button(action: {
                                        // Hide the Remember section
                                    }) {
                                        Image(systemName: "xmark")
                                            .font(.system(size: 22))
                                            .foregroundColor(.green)
                                    }
                                }
                                .padding(.top, 12)
                                .padding(.bottom, 16)
                                
                                // Tips List for Issues
                                VStack(spacing: 24) {
                                    TipRow(
                                        emoji: "🧐",
                                        title: "Spot the problems—",
                                        description: "Look for cracks, stains, damage, or anything else that seems off."
                                    )
                                    
                                    Divider()
                                    
                                    TipRow(
                                        emoji: "📸",
                                        title: "Take clear photos—",
                                        description: "Make sure all the photos you take are well-lit and easy to see."
                                    )
                                    
                                    Divider()
                                    
                                    TipRow(
                                        emoji: "✏️",
                                        title: "Be specific—",
                                        description: "In the next step, describe clearly what's wrong and exactly where it is."
                                    )
                                    .padding(.bottom, 12)
                                }
                            }
                            .padding(.horizontal, 20)
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(color: Color.black.opacity(0.05), radius: 4, x: 0, y: 2)
                            .padding(.horizontal, 20)
                        }
                    }
                    
                    // Bottom Button for Issue View
                    BottomButtonView(
                        text: "Skip",
                        action: {
                            // Skip action - move to next step
                            // This would be where you handle proceeding to the next screen
                        },
                        showArrow: false
                    )
                    
                } else {
                    // Original Photos View
                    ScrollView {
                        VStack(alignment: .leading, spacing: 24) {
                            // Title
                            Text("Let's take some general photos of the space")
                                .font(.custom("SofiaSans-Bold", size: 28))
                                .padding(.horizontal, 24)
                            
                            // Add Photos Button
                            Button(action: {
                                // Add photos action
                            }) {
                                VStack {
                                    Image(systemName: "camera")
                                        .font(.system(size: 36))
                                        .foregroundColor(.black)
                                        .overlay(
                                            Image(systemName: "plus")
                                                .font(.system(size: 16, weight: .bold))
                                                .foregroundColor(.black)
                                                .offset(x: 12, y: -12)
                                        )
                                    
                                    Text("Add photos")
                                        .font(.custom("SofiaSans-Regular", size: 18))
                                        .foregroundColor(.black)
                                        .padding(.top, 8)
                                }
                                .frame(maxWidth: .infinity)
                                .frame(height: 160)
                                .background(
                                    RoundedRectangle(cornerRadius: 12)
                                        .strokeBorder(style: StrokeStyle(lineWidth: 2, dash: [6, 6]))
                                        .foregroundColor(.green.opacity(0.4))
                                        .background(Color.green.opacity(0.2).cornerRadius(12))
                                )
                            }
                            .padding(.horizontal, 20)
                            
                            // Remember Section - Card Style (conditionally shown)
                            if showingRememberSection {
                                VStack(alignment: .leading, spacing: 0) {
                                    HStack {
                                        Text("Remember")
                                            .font(.custom("SofiaSans-Bold", size: 18))
                                        
                                        Spacer()
                                        
                                        Button(action: {
                                            // Hide the Remember section
                                            showingRememberSection = false
                                        }) {
                                            Image(systemName: "xmark")
                                                .font(.system(size: 22))
                                                .foregroundColor(.green)
                                        }
                                    }
                                    .padding(.top, 12)
                                    .padding(.bottom, 16)
                                    
                                    // Tips List
                                    VStack(spacing: 24) {
                                        TipRow(
                                            emoji: "🌟",
                                            title: "Stand in each corner—",
                                            description: "Capture walls, floors, ceilings, and key features like windows and doors."
                                        )
                                        
                                        Divider()
                                        
                                        TipRow(
                                            emoji: "📸",
                                            title: "Take more than you think you need—",
                                            description: "Up to 25 photos per space ensures nothing is missed."
                                        )
                                        
                                        Divider()
                                        
                                        TipRow(
                                            emoji: "🖼️",
                                            title: "Keep it general—",
                                            description: "Specific issues come next—focus on the general space for now."
                                        )
                                        .padding(.bottom, 12)
                                    }
                                }
                                .padding(.horizontal, 20)
                                .background(Color.white)
                                .cornerRadius(10)
                                .shadow(color: Color.black.opacity(0.05), radius: 4, x: 0, y: 2)
                                .padding(.horizontal, 20)
                            }
                            
                            // Photo Grid Section (always visible, placed below Remember section)
                            VStack(alignment: .leading, spacing: 0) {
                                HStack {
                                    Text("Photos")
                                        .font(.custom("SofiaSans-Bold", size: 18))
                                    
                                    Text("\(photoCount)/25")
                                        .font(.custom("SofiaSans-Regular", size: 16))
                                        .foregroundColor(.white)
                                        .padding(.horizontal, 8)
                                        .padding(.vertical, 4)
                                        .background(photoCount == 25 ? Color.green : Color.gray.opacity(0.6))
                                        .cornerRadius(12)
                                    
                                    Spacer()
                                    
                                    Button(action: {
                                        // Toggle manage mode
                                        isManageMode.toggle()
                                    }) {
                                        Text(isManageMode ? "Done" : "Manage")
                                            .font(.custom("SofiaSans-Bold", size: 18))
                                            .foregroundColor(.green)
                                    }
                                }
                                .padding(.horizontal, 20)
                                .padding(.top, 12)
                                .padding(.bottom, 16)
                                
                                // Photo Grid
                                LazyVGrid(columns: [
                                    GridItem(.flexible()),
                                    GridItem(.flexible())
                                ], spacing: 12) {
                                    ForEach(photos.indices, id: \.self) { index in
                                        ZStack(alignment: .center) {
                                            Image(photos[index]) // Use photo from array
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .frame(width: UIScreen.main.bounds.width / 3, height: UIScreen.main.bounds.width / 3)
                                                .cornerRadius(12)
                                            
                                            // Delete button (only visible in manage mode)
                                            if isManageMode {
                                                Button(action: {
                                                    // Remove this photo from the array
                                                    photos.remove(at: index)
                                                    photoCount -= 1
                                                }) {
                                                    Image(systemName: "xmark")
                                                        .font(.system(size: 14, weight: .bold))
                                                        .foregroundColor(.black)
                                                        .padding(8)
                                                        .background(Circle().fill(Color.white))
                                                        .shadow(color: Color.black.opacity(0.2), radius: 2, x: 0, y: 1)
                                                }
                                            }
                                        }
                                    }
                                }
                                .padding(.horizontal, 16)
                                .padding(.bottom, 16)
                            }
                            .padding(.horizontal, 10)
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(color: Color.black.opacity(0.05), radius: 4, x: 0, y: 2)
                            .padding(.horizontal, 20)
                            .padding(.top, 20) // Add space between this and the Remember section
                            
                            Spacer()
                        }
                    }
                    
                    // Bottom Button for Photos View
                    BottomButtonView(
                        text: "Skip",
                        action: {
                            // Skip action - switch to issue flagging view
                            isShowingIssueView = true
                            // Show issue tips automatically when entering issue view
                            tipsSheetType = .issue  // Set tips type to issues
                            showingTips = true      // Show the tips sheet
                        },
                        showArrow: false
                    )
                }
            }
            .navigationBarHidden(true)
        }
        .sheet(isPresented: $showingTips) {
            TipsSheet(isShowing: $showingTips, spaceName: spaceName, sheetType: tipsSheetType)
        }
        // Using NavigationLink instead of sheet
    }
    
    // Function to add a new issue (now implemented as navigation to ReportIssuesView)
    private func addNewIssue() {
        navigateToReportIssuesView = true
    }
    
    // Function to retrieve updated issues when returning from ReportIssuesView
    private func retrieveUpdatedIssues() {
        // Implement your logic to refresh the issues data
        // This could involve fetching from a database, shared storage, etc.
        
        // For example, you might have a shared data service:
        // issues = IssueDataService.shared.getIssuesForSpace(spaceName)
    }
}

