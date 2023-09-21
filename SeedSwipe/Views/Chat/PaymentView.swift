//
//  PaymentView.swift
//  SeedSwipe
//
//  Created by Artemiy Malyshau on 20/09/2023.
//

import SwiftUI

struct PaymentView: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.openURL) var openURL
    @State private var amount: String = ""

    private var numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        return formatter
    }()

    var body: some View {
        VStack {
            Capsule()
                .fill(.white.opacity(0.4))
                .frame(width: 60, height: 4)
                .padding(.top, 14)
            
            HStack(spacing: 0) {
                Text("Pay with")
                    .bold()
                
                Image("stripe")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 28)
                    .offset(y: 1)
            }
            .padding(.top, 10)
            .padding(.bottom, 40)
            
            HStack(alignment: .bottom) {
                Spacer()
                    .frame(width: 10)
                
                Text("US$")
                    .font(.system(size: 26, weight: .bold, design: .rounded))
                    .offset(y: -10)
                
                TextField("0.00", text: $amount)
                    .keyboardType(.decimalPad)
                    .font(.system(size: 56, weight: .bold, design: .rounded))
                    .onChange(of: amount) { newValue in
                        let filtered = newValue.filter("0123456789.".contains)
                        if filtered != newValue {
                            amount = filtered
                        }

                        if let dotIndex = amount.firstIndex(of: "."), amount.distance(from: dotIndex, to: amount.endIndex) > 3 {
                            amount = String(amount.prefix(upTo: amount.index(dotIndex, offsetBy: 3)))
                        }
                    }
                    .frame(width: 150)
                
                Button {
                    if let url = URL(string: "https://buy.stripe.com/test_14k9BU92O88de5OcMM") {
                        openURL(url)
                    }
                } label: {
                    Image(systemName: "arrow.up.circle.fill")
                        .foregroundColor(.blue)
                        .font(Font.system(size: 34, weight: .regular))
                }
                .offset(x: -6, y: -15)
            }
            
            Spacer()
        }
    }
}

#Preview {
    PaymentView()
        .preferredColorScheme(.dark)
}
