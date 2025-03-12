import SwiftUI

struct AppTabBar: View {
    var selectedTab: Int
    @State private var navigateToHelp = false
    
    var body: some View {
        HStack {
            Spacer()
            NavigationLink(destination: ReportListView()) {
                TabBarItem(iconName: "house.fill", isSelected: selectedTab == 0)
            }
            Spacer()
            NavigationLink(destination: HelpView()) {
                TabBarItem(iconName: "questionmark.circle", isSelected: selectedTab == 1)
            }
            Spacer()
            NavigationLink(destination: ReferView()) {
                TabBarItem(iconName: "gift", isSelected: selectedTab == 2)
            }
            Spacer()
            NavigationLink(destination: SettingsView()) {
                TabBarItem(iconName: "gear", isSelected: selectedTab == 3)
            }
            Spacer()
        }
        .padding()
        .background(
            Rectangle()
                .fill(Color(.systemBackground))
                .shadow(color: Color.black.opacity(0.05), radius: 4, x: 0, y: -2)
        )
    }
}

struct TabBarItem: View {
    var iconName: String
    var isSelected: Bool
    
    var body: some View {
        Image(systemName: iconName)
            .foregroundColor(isSelected ? .black : .gray)
            .font(.system(size: 24))
    }
}
