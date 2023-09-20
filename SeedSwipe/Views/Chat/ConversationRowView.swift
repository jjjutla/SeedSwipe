//
//  ConversationView.swift
//  SeedSwipe
//
//  Created by Artemiy Malyshau on 20/09/2023.
//

import SwiftUI

struct ConversationRowView: View {
    var body: some View {
        HStack(spacing: 16) {
            Image("monke")
                .resizable()
                .scaledToFill()
                .frame(width: 50, height: 50)
                .cornerRadius(50)
            
            VStack(alignment: .leading, spacing: 4) {
                Text("Databricks")
                    .font(.system(size: 18, weight: .bold))
                
                HStack(spacing: 4) {
                    Image(systemName: "checkmark")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 12, height: 12)
                    
                    Text("Oh wow, your guy he is so great at investing vauuu")
                        .lineLimit(1)
                        .truncationMode(.tail)
                        .frame(width: 150)
                        .font(.system(size: 15, weight: .regular))
                }
            }
            
            Spacer()
            
            VStack(spacing: 6) {
                Text("13:45")
                    .font(.caption)
                    .foregroundStyle(.white.opacity(0.8))
                
                Spacer()
            }
            .padding(.top, 4)
        }
    }
}

#Preview {
    ConversationRowView()
}
