//
//  SpaceRow.swift
//  wooma
//
//  Created by Carlo on 3/12/25.
//

import SwiftUI


// Space row component
struct SpaceRow: View {
    let space: Space
    @State private var navigateToSpaceDetail = false
    
    var body: some View {
        NavigationLink(destination: EditSpaceView(space: space)) {
            HStack {
                Text("\(space.icon) \(space.name)")
                    .font(.custom("SofiaSans-Regular", size: 18))
                    .foregroundColor(.black)
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .foregroundColor(.black)
                    .font(.system(size: 14, weight: .semibold))
            }
            .padding(.vertical, 14)
            .padding(.horizontal, 16)
        }
        .buttonStyle(PlainButtonStyle())
    }
}
// Placeholder for SpaceDetailView
struct SpaceDetailView: View {
    let space: Space
    
    var body: some View {
        Text("Details for \(space.name)")
            .navigationTitle(space.name)
    }
}

