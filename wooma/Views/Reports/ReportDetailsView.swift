import SwiftUI

struct ReportDetailsView: View {
    // Accept report title or report object
    let reportTitle: String
    
    let spaces: [Space] = [
        Space(icon: "🛏", name: "Bedroom"),
        Space(icon: "🛋", name: "Living room"),
        Space(icon: "🍳", name: "Kitchen"),
        Space(icon: "🛁", name: "Bathroom"),
        Space(icon: "🚽", name: "Toilet / WC"),
        Space(icon: "🪵", name: "Hallway"),
        Space(icon: "🧺", name: "Utility room")
    ]
    
    @Environment(\.presentationMode) var presentationMode
    @State private var navigateToEditReport = false
    
    // Initialize with report title
    init(reportTitle: String) {
        self.reportTitle = reportTitle
    }
    
    // Initialize with Report object
    init(report: Report) {
        self.reportTitle = report.title
    }
    
    var body: some View {
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
                
                Text(reportTitle)
                    .font(.custom("SofiaSans-Bold", size: 20))
                    .foregroundColor(.black)
                
                Spacer()
                
                Button(action: {
                    navigateToEditReport = true
                }) {
                    Text("Edit")
                        .font(.custom("SofiaSans-Bold", size: 18))
                        .foregroundColor(.woomaGreen)
                }
            }
            .padding()
            .background(Color(hex: "#FAFDF8"))
            
            ScrollView {
                // Space List Card
                VStack(alignment: .leading, spacing: 0) {
                    Text("Spaces")
                        .font(.custom("SofiaSans-Bold", size: 18))
                        .foregroundColor(.black)
                        .padding(.leading, 15)
                        .padding(.top, 18)
                    
                    // List of Spaces inside a Card
                    VStack(spacing: 0) {
                        ForEach(spaces) { space in
                            SpaceRow(space: space)
                            
                            if space.id != spaces.last?.id {
                                Divider()
                            }
                        }
                    }
                    .background(Color.white)
                    .cornerRadius(8)
                    
                    // Add Another Space Button
                    Button(action: {
                        // Add space action
                    }) {
                        Text("Add another space")
                            .font(.custom("SofiaSans-Regular", size: 18))
                            .foregroundColor(.woomaGreen)
                            .padding(.vertical, 10)
                    }
                    .padding(.leading, 15)
                    .padding(.top, 8)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .shadow(color: Color.black.opacity(0.05), radius: 4, x: 0, y: 2)
                .padding(.horizontal)
                .padding(.top, 16)
            }
            
            Spacer()
            
            // Bottom button
            BottomButtonView(
                text: "Review and finalise",
                action: {
                    // Finalize action
                }
            )
        }
        .background(Color(hex: "#FAFDF8"))
        .navigationBarHidden(true)
        .navigationDestination(isPresented: $navigateToEditReport) {
            EditReportView()
        }
    }
}
