//
//  StampView.swift
//  SeedSwipe
//
//  Created by Artemiy Malyshau on 20/09/2023.
//

import SwiftUI

struct StampView: View {
    let label: String
    let color: Color

    var body: some View {
        Text(label)
            .tracking(2.5)
            .font(.largeTitle)
            .bold()
            .textCase(.uppercase)
            .multilineTextAlignment(.center)
            .foregroundColor(color)
            .padding(10)
            .border(color, width: 4)
            .cornerRadius(4)
    }
}

#Preview {
    Group {
        StampView(label: "Like", color: .green)
        StampView(label: "Dislike", color: .red)
        StampView(label: "Interested", color: .orange)
    }
    .padding()
    .previewLayout(.sizeThatFits)
}
