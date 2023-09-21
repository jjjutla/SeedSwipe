//
//  CompanySwipeView.swift
//  SeedSwipe
//
//  Created by Artemiy Malyshau on 20/09/2023.
//

import SwiftUI

struct CompanySwipeView: View {
    
    let company: Company
    let onRemove: (LikeType) -> Void
    @State private var offset = CGSize.zero
    
    var body: some View {
        ZStack {
            CompanyView(company: company)
            
            Group {
                
                StampView(label: "Liked", color: .green)
                    .rotationEffect(.degrees(7))
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                    .offset(y: 0)
                    .opacity(Double(offset.width / 50))
                
                StampView(label: "Disliked", color: .red)
                    .rotationEffect(.degrees(-7))
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                    .offset(y: 0)
                    .opacity(abs(min(Double(offset.width / 50), 0)))

                StampView(label: "Interested", color: .orange)
                    .padding(.bottom, 30)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
                    .opacity(abs(min(Double(offset.height / 100), 0)))
            }
        }
        .cornerRadius(20)
        .rotationEffect(.degrees(Double(offset.width / 5)))
        .offset(x: offset.width, y: offset.height)
        .opacity(2 - Double(abs(offset.width / 50)))
        .gesture(
            DragGesture()
                .onChanged { gesture in
                    offset = gesture.translation
                }
                .onEnded { gesture in
                    if offset.width > 100 {
                        onRemove(.dislike)
                    } else if offset.width < -100 {
                        onRemove(.like)
                    } else if offset.height < -100 {
                        onRemove(.interested)
                    } else {
                        withAnimation(.spring()) {
                            offset = .zero
                        }
                    }
                }
        )
    }
}

//#Preview {
//    CompanySwipeView(company: companies[0]) { _ in }
//        .preferredColorScheme(.dark)
//}
