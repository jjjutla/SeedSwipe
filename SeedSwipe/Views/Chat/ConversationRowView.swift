//
//  ConversationView.swift
//  SeedSwipe
//
//  Created by Artemiy Malyshau on 20/09/2023.
//

import SwiftUI

struct ConversationRowView: View {
    
    var messagePreview: MessagePreview
    
    var body: some View {
        HStack(spacing: 16) {
            Image(messagePreview.imageUrl)
                .resizable()
                .scaledToFill()
                .frame(width: 50, height: 50)
                .cornerRadius(50)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(messagePreview.name)
                    .font(.system(size: 18, weight: .bold))
                
                HStack(spacing: 4) {
                    if messagePreview.fromYou {
                        Image(systemName: "checkmark")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 12, height: 12)
                        
                        Text(messagePreview.lastMessage)
                            .lineLimit(1)
                            .truncationMode(.tail)
                            .frame(width: 150)
                            .font(.system(size: 15, weight: .regular))
                    } else {
                        Text(messagePreview.lastMessage)
                            .lineLimit(1)
                            .truncationMode(.tail)
                            .frame(width: 150)
                            .font(.system(size: 15, weight: .regular))
                            .offset(x: -5)
                    }
                }
            }
            
            Spacer()
            
            VStack(spacing: 6) {
                Text(messagePreview.time)
                    .font(.caption)
                    .foregroundStyle(.white.opacity(0.8))
                
                Spacer()
            }
            .padding(.top, 4)
        }
    }
}

//#Preview {
//    ConversationRowView()
//}
