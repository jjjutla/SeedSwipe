//
//  CircleImage.swift
//  SeedSwipe
//
//  Created by Artemiy Malyshau on 19/09/2023.
//

import SwiftUI

struct CircleImage: View {
    
    var url : String = ""
    var body: some View {

    Image("monke")
        .resizable()
        .aspectRatio(contentMode: .fill)
        .frame(width: 64,height: 64)
        .foregroundColor(.primary.opacity(0.6))
        .background(.gray.opacity(0.4))
        .mask(Circle())
        .backgroundAngularGradient()
        .overlay {
            Circle().stroke().foregroundLinearGradient()
                .blendMode(.overlay)
        }
    }
}


#Preview {
    CircleImage()
}
