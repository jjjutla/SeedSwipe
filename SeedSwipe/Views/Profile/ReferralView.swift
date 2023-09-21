//
//  ReferralView.swift
//  SeedSwipe
//
//  Created by Artemiy Malyshau on 21/09/2023.
//

import SwiftUI

struct ReferralView: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack {
            Capsule()
                .fill(.white.opacity(0.4))
                .frame(width: 60, height: 4)
                .padding(.top, 14)
            
            HStack(spacing: 20) {
                Image("fastgen")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60, height: 60)
                    .cornerRadius(20)
                    .offset(x: 10)
                
                Text("Sign up to Fastgen")
                    .bold()
                    .offset(x: 10)
                
                Button {
                    UIPasteboard.general.string = "https://fastgen.cello.so/Vl1DaWiuAWy"
                } label: {
                    Image(systemName: "doc.on.doc.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 26, height: 26)
                        .padding(8)
                        .background(.blue)
                        .cornerRadius(50)
                        .offset(x: 30)
                }
                
                Spacer()
            }
            .frame(width: UIScreen.screenWidth * 0.84, height: 80)
            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 16,style: .continuous))
            .overlay{
                RoundedRectangle(cornerRadius: 16,style: .continuous).stroke(.white.opacity(0.2))
            }
            .shadow(radius: 8)
            .padding(.top)
            
            Spacer()
        }
    }
}

#Preview {
    ReferralView()
}
