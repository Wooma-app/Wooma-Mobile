import SwiftUI

struct EditReportView: View {
    @State private var address: String = "74 Grape Grove, London, Great..." // Default text
    @Environment(\.presentationMode) var presentationMode // For back button
    
    // Add state variables to control the alert
    @State private var showingDeleteAlert = false
    
    var body: some View {
        VStack {
            // Custom Navigation Bar
            HStack {
                Button(action: {
                    presentationMode.wrappedValue.dismiss() // Go back
                }) {
                    Image(systemName: "arrow.left")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.woomaGreen)
                }
                
                Spacer()
                
                Text("Edit report")
                    .font(.custom("SofiaSans-Bold", size: 20))
                    .foregroundColor(.black)
                
                Spacer()
            }
            .padding()
            .background(Color.woomaBackground)
            
            // Property Address Section
            VStack(alignment: .leading, spacing: 8) {
                Text("Property address")
                    .font(.custom("SofiaSans-Bold", size: 16))
                    .foregroundColor(.gray)
                
                // Address Box
                TextField("", text: $address)
                    .disabled(true) // Non-editable
                    .padding()
                    .background(Color.white)
                    .cornerRadius(8)
                
                // Delete Button (Placed right below the address field)
                Button(action: {
                    // Show delete confirmation alert
                    showingDeleteAlert = true
                }) {
                    Text("Delete this report")
                        .font(.custom("SofiaSans-Bold", size: 16))
                        .foregroundColor(.woomaErrorRed)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(8)
                }
            }
            .padding(.horizontal)
            .padding(.top, 20)
            
            Spacer()
        }
        .background(Color.woomaBackground)
        .navigationBarHidden(true) // Hide default navigation bar
        // Add alert presentation
        .alert(isPresented: $showingDeleteAlert) {
            Alert(
                title: Text("Are you sure?"),
                message: Text("Once you've deleted a report, this action can't be undone."),
                primaryButton: .destructive(
                    Text("Delete")
                        .foregroundColor(.red),
                    action: {
                        // Handle delete action
                        deleteReport()
                    }
                ),
                secondaryButton: .cancel(
                    Text("Cancel")
                        .foregroundColor(.blue)
                )
            )
        }
    }
    
    // Function to handle report deletion
    func deleteReport() {
        // Implement your delete logic here
        // This could involve API calls, database operations, etc.
        
        // After deletion, typically you would navigate back
        presentationMode.wrappedValue.dismiss()
    }
}
