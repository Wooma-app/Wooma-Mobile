import SwiftUI

// MARK: - Models and Enums
enum ReportStep {
    case selectCategory
    case selectIssueType
    case addDetails
}

struct IssueData: Identifiable {
    let id = UUID()
    let category: String
    let location: String?
    let issueTypes: [String]
    let details: String?
}

// MARK: - Main View
struct ReportIssuesView: View {
    @Environment(\.presentationMode) var presentationMode
    
    // State variables to control the flow
    @State private var currentStep: ReportStep = .selectCategory
    @State private var selectedCategory: String? = nil
    @State private var selectedLocation: String = ""
    @State private var selectedIssueTypes: [String] = []
    @State private var additionalDetails: String = ""
    @State private var issues: [IssueData] = []
    
    // Categories for "Where's the problem?"
    let categories = [
        "Walls", "Ceiling", "Flooring",
        "Windows", "Doors", "Skirting boards",
        "Lighting", "Curtains / blinds",
        "Furniture", "Kitchen cabinets",
        "Bathroom fittings", "Heating / radiators"
    ]
    
    // Issues for "What's the issue?"
    let issueTypes = [
        "Cracked", "Stained", "Damaged", "Dirty",
        "Doesn't work", "Loose", "Scuffed",
        "Uneven", "Missing"
    ]
    
    var body: some View {
        VStack(spacing: 0) {
            // Custom Navigation bar
            HStack {
                Button(action: {
                    // Go back based on current step
                    switch currentStep {
                    case .selectCategory:
                        presentationMode.wrappedValue.dismiss()
                    case .selectIssueType:
                        currentStep = .selectCategory
                        selectedIssueTypes = []
                    case .addDetails:
                        currentStep = .selectIssueType
                    }
                }) {
                    Image(systemName: "arrow.left")
                        .font(.system(size: 24))
                        .foregroundColor(.green)
                }
                
                Spacer()
                
                // Tips button
                Button(action: {
                    // Action for tips button
                    print("Tips button tapped")
                }) {
                    Text("Tips")
                        .font(.system(size: 16))
                        .foregroundColor(.green)
                }
            }
            .padding(.horizontal, 24)
            .padding(.top, 12)
            .padding(.bottom, 16)
            
            Text(stepTitle)
                .font(.system(size: 32, weight: .bold))
                .padding(.horizontal, 24)
                .padding(.bottom, 24)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            // Content based on current step
            ScrollView {
                VStack(alignment: .leading, spacing: 32) {
                    // Different content based on step
                    switch currentStep {
                    case .selectCategory:
                        selectCategoryView
                    case .selectIssueType:
                        selectIssueTypeView
                    case .addDetails:
                        addDetailsView
                    }
                }
                .padding(.bottom, 100) // Add padding for the buttons
            }
            
            Spacer()
            
            // Bottom buttons (Skip and Next)
            bottomButtons
        }
        .background(Color(UIColor.systemBackground))
        .edgesIgnoringSafeArea(.bottom)
        .navigationBarHidden(true) // Hide the default navigation bar
    }
    
    // MARK: - Step Specific Views
    
    // Step 1: Category Selection View
    var selectCategoryView: some View {
        VStack(alignment: .leading, spacing: 24) {
            // Categories in a wrapping grid
            CategoryFlowLayout(
                items: categories,
                selectedItem: $selectedCategory,
                itemSelected: { category in
                    selectedCategory = category
                    // No longer automatically advancing to next step
                }
            )
            .padding(.horizontal, 24)
            
            // "Something else" button
            Button(action: {
                selectedCategory = "Something else"
                // No longer automatically advancing to next step
            }) {
                Text("Something else")
                    .font(.system(size: 16))
                    .foregroundColor(.black)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 12)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(selectedCategory == "Something else" ? Color.black : Color.clear, lineWidth: 1)
                    )
            }
            .padding(.horizontal, 24)
            
            // Location section - only enabled when "Something else" is selected
            VStack(alignment: .leading, spacing: 8) {
                Text("Problem location")
                    .font(.system(size: 16))
                    .foregroundColor(selectedCategory == "Something else" ? Color.gray : Color.gray.opacity(0.5))
                    .padding(.top, 16)
                    .padding(.horizontal, 24)
                
                TextField("Dishwasher", text: $selectedLocation)
                    .font(.system(size: 24))
                    .padding(.horizontal, 24)
                    .padding(.vertical, 8)
                    .disabled(selectedCategory != "Something else")
                    .foregroundColor(selectedCategory == "Something else" ? .primary : .gray)
            }
        }
    }
    
    // Step 2: Issue Type Selection View
    var selectIssueTypeView: some View {
        VStack(alignment: .leading, spacing: 24) {
            // Selected category info
            if let category = selectedCategory {
                Text("Selected: \(category)")
                    .font(.system(size: 18, weight: .medium))
                    .foregroundColor(.gray)
                    .padding(.horizontal, 24)
                    .padding(.bottom, 8)
            }
            
            // Issue types in a wrapping grid
            IssueFlowLayout(
                items: issueTypes,
                selectedItems: $selectedIssueTypes
            )
            .padding(.horizontal, 24)
            
            // Additional details section
            VStack(alignment: .leading, spacing: 8) {
                Text("Add other / more details")
                    .font(.system(size: 16))
                    .foregroundColor(Color.gray)
                    .padding(.top, 16)
                    .padding(.horizontal, 24)
                
                ZStack(alignment: .topLeading) {
                    // Placeholder text
                    if additionalDetails.isEmpty {
                        Text("Write anything extra here...")
                            .font(.system(size: 18))
                            .foregroundColor(Color.gray.opacity(0.5))
                            .padding(.horizontal, 24)
                            .padding(.top, 8)
                    }
                    
                    // Actual TextEditor
                    TextEditor(text: $additionalDetails)
                        .font(.system(size: 18))
                        .padding(.horizontal, 20)
                        .frame(minHeight: 100)
                        .background(Color.white.opacity(0.001)) // Makes it tappable but invisible
                }
            }
        }
    }
    
    // Step 3: Details View (not fully shown in screenshots, implementing based on what's visible)
    var addDetailsView: some View {
        VStack(alignment: .leading, spacing: 16) {
            // Show category and issue type selections
            if let category = selectedCategory {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Selected: \(category)")
                        .font(.system(size: 18, weight: .medium))
                        .foregroundColor(.gray)
                        .padding(.horizontal, 24)
                    
                    Text("Issues: \(selectedIssueTypes.joined(separator: ", "))")
                        .font(.system(size: 18))
                        .foregroundColor(.gray)
                        .padding(.horizontal, 24)
                    
                    if selectedCategory == "Something else" && !selectedLocation.isEmpty {
                        Text("Location: \(selectedLocation)")
                            .font(.system(size: 18))
                            .foregroundColor(.gray)
                            .padding(.horizontal, 24)
                    }
                }
                .padding(.bottom, 16)
            }
            
            // Display additional details if provided
            if !additionalDetails.isEmpty {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Additional Details:")
                        .font(.system(size: 18, weight: .medium))
                        .padding(.horizontal, 24)
                    
                    Text(additionalDetails)
                        .font(.system(size: 18))
                        .padding(.horizontal, 24)
                }
            } else {
                Text("No additional details provided")
                    .font(.system(size: 18))
                    .foregroundColor(.gray)
                    .padding(.horizontal, 24)
            }
        }
    }
    
    // MARK: - Supporting UI Elements
    
    // Bottom buttons (Skip and Next)
    var bottomButtons: some View {
        VStack(spacing: 0) {
            // Next button
            Button(action: {
                handleNextAction()
            }) {
                Text(currentStep == .selectCategory ? "Next" : "Save & next")
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 16)
                    .background(isNextButtonEnabled ? Color.green : Color.gray)
                    .cornerRadius(30)
                    .padding(.horizontal, 24)
            }
            .disabled(!isNextButtonEnabled)
            .padding(.bottom, 8)
            
            // Skip button - only show Skip button, not both buttons
            Button(action: {
                handleSkipAction()
            }) {
                Text("Skip")
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 16)
                    .background(Color.green)
                    .cornerRadius(30)
                    .padding(.horizontal, 24)
            }
            .padding(.bottom, 32)
        }
    }
    
    // MARK: - Helper Functions
    
    var stepTitle: String {
        switch currentStep {
        case .selectCategory:
            return "Where's the problem?"
        case .selectIssueType, .addDetails:
            return "What's the issue?"
        }
    }
    
    // Check if next button should be enabled
    var isNextButtonEnabled: Bool {
        switch currentStep {
        case .selectCategory:
            if selectedCategory == "Something else" {
                return !selectedLocation.isEmpty
            }
            return selectedCategory != nil
        case .selectIssueType:
            return !selectedIssueTypes.isEmpty
        case .addDetails:
            return true
        }
    }
    
    // Handle next button action
    func handleNextAction() {
        switch currentStep {
        case .selectCategory:
            if selectedCategory != nil {
                currentStep = .selectIssueType
            }
        case .selectIssueType:
            if !selectedIssueTypes.isEmpty {
                saveCurrentIssue()
                // Go back to first screen after saving
                currentStep = .selectCategory
                selectedCategory = nil
                selectedIssueTypes = []
                additionalDetails = ""
                selectedLocation = ""
            }
        case .addDetails:
            // Save and go back to start
            saveCurrentIssue()
            currentStep = .selectCategory
            selectedCategory = nil
            selectedIssueTypes = []
            additionalDetails = ""
            selectedLocation = ""
        }
    }
    
    // Handle skip button action
    func handleSkipAction() {
        switch currentStep {
        case .selectCategory:
            // Skip this step completely
            presentationMode.wrappedValue.dismiss()
        case .selectIssueType:
            // Just go back without saving
            currentStep = .selectCategory
            selectedIssueTypes = []
            selectedCategory = nil
            selectedLocation = ""
        case .addDetails:
            // Save this issue with details and go back to first step
            saveCurrentIssue()
            currentStep = .selectCategory
            selectedCategory = nil
            selectedIssueTypes = []
            additionalDetails = ""
            selectedLocation = ""
        }
    }
    
    func saveCurrentIssue() {
        if let category = selectedCategory {
            let newIssue = IssueData(
                category: category,
                location: (selectedCategory == "Something else" && !selectedLocation.isEmpty) ? selectedLocation : nil,
                issueTypes: selectedIssueTypes,
                details: additionalDetails.isEmpty ? nil : additionalDetails
            )
            issues.append(newIssue)
        }
    }
}

// MARK: - Custom Components

struct CategoryFlowLayout: View {
    let items: [String]
    @Binding var selectedItem: String?
    let itemSelected: (String) -> Void
    
    private let spacing: CGFloat = 12
    
    var body: some View {
        VStack(alignment: .leading, spacing: spacing) {
            var width = CGFloat.zero
            var height = CGFloat.zero
            var lastHeight = CGFloat.zero
            
            ZStack(alignment: .topLeading) {
                ForEach(items, id: \.self) { item in
                    Button(action: {
                        selectedItem = (selectedItem == item) ? nil : item
                        itemSelected(item)
                    }) {
                        Text(item)
                            .font(.system(size: 16))
                            .foregroundColor(.black)
                            .padding(.horizontal, 12)
                            .padding(.vertical, 10)
                            .background(Color.white)
                            .cornerRadius(20)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(selectedItem == item ? Color.black : Color.clear, lineWidth: 1)
                            )
                            .shadow(color: Color.black.opacity(0.05), radius: 2, x: 0, y: 1)
                    }
                    .alignmentGuide(.leading) { d in
                        if abs(width - d.width) > UIScreen.main.bounds.width - 48 {
                            width = 0
                            height -= lastHeight + spacing
                            lastHeight = d.height
                        }
                        
                        let result = width
                        if item == items.last! {
                            width = 0
                        } else {
                            width -= d.width + spacing
                        }
                        return result
                    }
                    .alignmentGuide(.top) { _ in
                        let result = height
                        if item == items.last! {
                            height = 0
                        }
                        return result
                    }
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

// FlowLayout for Issue Type buttons
struct IssueFlowLayout: View {
    let items: [String]
    @Binding var selectedItems: [String]
    
    private let spacing: CGFloat = 12
    
    var body: some View {
        VStack(alignment: .leading, spacing: spacing) {
            var width = CGFloat.zero
            var height = CGFloat.zero
            var lastHeight = CGFloat.zero
            
            ZStack(alignment: .topLeading) {
                ForEach(items, id: \.self) { item in
                    Button(action: {
                        if selectedItems.contains(item) {
                            selectedItems.removeAll { $0 == item }
                        } else {
                            selectedItems.append(item)
                        }
                    }) {
                        Text(item)
                            .font(.system(size: 16))
                            .foregroundColor(.black)
                            .padding(.horizontal, 12)
                            .padding(.vertical, 10)
                            .background(Color.white)
                            .cornerRadius(20)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(selectedItems.contains(item) ? Color.black : Color.clear, lineWidth: 1)
                            )
                            .shadow(color: Color.black.opacity(0.05), radius: 2, x: 0, y: 1)
                    }
                    .alignmentGuide(.leading) { d in
                        if abs(width - d.width) > UIScreen.main.bounds.width - 48 {
                            width = 0
                            height -= lastHeight + spacing
                            lastHeight = d.height
                        }
                        
                        let result = width
                        if item == items.last! {
                            width = 0
                        } else {
                            width -= d.width + spacing
                        }
                        return result
                    }
                    .alignmentGuide(.top) { _ in
                        let result = height
                        if item == items.last! {
                            height = 0
                        }
                        return result
                    }
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}
