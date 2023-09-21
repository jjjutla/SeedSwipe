//
//  CompanyView.swift
//  SeedSwipe
//
//  Created by Artemiy Malyshau on 19/09/2023.
//

import SwiftUI

struct CompanyView: View {
    
    let columns = [
        GridItem(.adaptive(minimum: 100))
    ]
    
    var company: Company
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 10) {
                Image(company.imageUrl)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 64, height: 64)
                    .cornerRadius(50)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(company.name)
                        .font(.system(size: 18, weight: .bold))
                    
                    HStack {
                        Image(systemName: "map")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 14, height: 14)
                        
                        Text(company.location)
                    }
                }
                
                Spacer()
            }
            
            Divider()
                .padding(.bottom, 8)
            
            Text("Overview")
                .font(.system(size: 17, weight: .bold))
                      
            VStack(alignment: .leading) {
                HStack {
                    Image(systemName: "person.2.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 18, height: 18)
                    
                    Text(company.size)
                }
                
                HStack {
                    Image(systemName: "dollarsign")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 18, height: 18)
                    
                    Text(company.funding)
                }
                
                HStack {
                    Image(systemName: "globe")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 18, height: 18)
                    
                    Button {
                        
                    } label: {
                        Text(company.websiteUrl)
                            .underline()
                    }
                }
            }
            .padding(.bottom, 16)
            
            Text("Media")
                .font(.system(size: 17, weight: .bold))
            
            Image(company.mediaUrl)
                .resizable()
                .scaledToFill()
                .frame(width: 300, height: 200)
                .cornerRadius(6)
                .padding(.top, 10)
            
            Spacer()
        }
        .frame(width: UIScreen.screenWidth * 0.76, height: UIScreen.screenHeight * 0.56)
        .padding(20)
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 16,style: .continuous))
        .overlay{
            RoundedRectangle(cornerRadius: 16,style: .continuous).stroke(.white.opacity(0.2))
        }
        .shadow(radius: 8)
    }
}

//#Preview {
//    CompanyView(company: companies[0])
//        .preferredColorScheme(.dark)
//}
