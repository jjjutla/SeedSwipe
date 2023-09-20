//
//  CompanyView.swift
//  SeedSwipe
//
//  Created by Artemiy Malyshau on 19/09/2023.
//

import SwiftUI

struct CompanyView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image("monkey")
            }
        }
        .frame(maxWidth: .infinity)
        .padding(20)
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 16,style: .continuous))
        .overlay{
            RoundedRectangle(cornerRadius: 16,style: .continuous).stroke(.white.opacity(0.2))
        }
        .shadow(radius: 8)
    }
}

#Preview {
    CompanyView()
}
