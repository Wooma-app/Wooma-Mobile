//
//  TipRow.swift
//  wooma
//
//  Created by Carlo on 3/12/25.
//
import SwiftUI

struct TipRow: View {
    let emoji: String
    let title: String
    let description: String
    
    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            Text(emoji)
                .font(.system(size: 20))
            
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.custom("SofiaSans-Bold", size: 18))
                + Text(description)
                    .font(.custom("SofiaSans-Regular", size: 18))
            }
        }
        .padding(.vertical, 4)
    }
}
