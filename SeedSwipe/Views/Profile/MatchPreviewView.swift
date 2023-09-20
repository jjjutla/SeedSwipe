//
//  MatchPreviewView.swift
//  SeedSwipe
//
//  Created by Artemiy Malyshau on 19/09/2023.
//

import SwiftUI

struct MatchPreviewView: View {
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 16)
                .fill(.ultraThinMaterial)
                .frame(width: 100, height: 130)
                .overlay(
                    ZStack {
                        Image("sf")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 100, height: 130)
                            .blur(radius: 2)
                            .brightness(-0.1)
                        
                        Image("databricks")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 78, height: 78)
                            .cornerRadius(50)
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                )
            
            VStack(alignment: .leading, spacing: 6) {
                Text("Databricks")
                
                HStack {
                    Image(systemName: "location.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 14, height: 14)
                        .foregroundColor(.gray)
                    
                    Text("SF, USA")
                        .font(.caption)
                    .foregroundStyle(.gray)
                }
            }
        }
    }
}

#Preview {
    MatchPreviewView()
}
