import SwiftUI

struct DeleteAccountView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var confirmationText = ""
    @State private var showAlert = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            // Custom navigation bar with centered title
            ZStack {
                HStack {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "arrow.left")
                            .font(.system(size: 24))
                            .foregroundColor(.green)
                    }
                    
                    Spacer()
                }
                
                Text("Delete your account")
                    .font(.custom("SofiaSans-Bold", size: 18))
                    .frame(maxWidth: .infinity, alignment: .center)
            }
            .padding(.horizontal, 24)
            .padding(.top, 10)
            .padding(.bottom, 24)
            
            ScrollView {
                VStack(alignment: .leading, spacing: 28) {
                    // Explanation text
                    Text("Deleting your account will")
                        .font(.custom("SofiaSans-Bold", size: 16))
                        .padding(.horizontal, 24)
                    
                    // Consequences list
                    VStack(alignment: .leading, spacing: 20) {
                        ConsequenceItem(
                            icon: "doc.text",
                            title: "Remove all your reports",
                            description: "You won't be able to access them again."
                        )
                        
                        ConsequenceItem(
                            icon: "arrow.right.square",
                            title: "Sign you out permanently",
                            description: "You'll need to start fresh if you return."
                        )
                        
                        ConsequenceItem(
                            icon: "trash",
                            title: "Erase your account details",
                            description: "This can't be undone."
                        )
                    }
                    .padding(.horizontal, 24)
                    
                    // Confirmation input
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Type DELETE to confirm")
                            .font(.custom("SofiaSans-Regular", size: 14))
                            .foregroundColor(.gray)
                        
                        TextField("DELETE", text: $confirmationText)
                            .font(.custom("SofiaSans-Bold", size: 16))
                            .padding(12)
                            .background(Color(.systemGray6))
                            .cornerRadius(8)
                    }
                    .padding(.horizontal, 24)
                    .padding(.top, 12)
                    
                    Spacer()
                }
            }
            
            // Delete Button
            BottomButtonView(
                text: "Delete account",
                action: {
                    if confirmationText == "DELETE" {
                        showAlert = true
                    }
                },
                showArrow: false,
                backgroundColor: confirmationText == "DELETE" ? .red : Color.red.opacity(0.7),
                textColor: .white
            )
        }
        .background(Color.woomaBackground)
        .navigationBarHidden(true)
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Account Deleted"),
                message: Text("Your account has been successfully deleted."),
                dismissButton: .default(Text("OK")) {
                    // Handle account deletion and navigation back to login
                }
            )
        }
    }
}

// Consequence Item Component
struct ConsequenceItem: View {
    let icon: String
    let title: String
    let description: String
    
    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            Image(systemName: icon)
                .font(.system(size: 20))
                .foregroundColor(.black)
                .frame(width: 24)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.custom("SofiaSans-Bold", size: 18))
                    .foregroundColor(.black)
                
                Text(description)
                    .font(.custom("SofiaSans-Regular", size: 18))
                    .foregroundColor(.gray)
            }
        }
    }
}
