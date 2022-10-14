//
//  ProfileTrandingView.swift
//  PIHomeAssignment
//
//  Created by Svyat Zubyak on 14.10.2022.
//

import SwiftUI

struct ProfileTrandingView: View {
    
    let currencies: [Currency]
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 20) {
            
            SectionHeaderView(image: R.image.profile_tranding_fire.swiftUI, title: R.string.localizable.profile_trending())
                .padding(.leading, 20)
            
            ScrollView(.horizontal, showsIndicators: false) {
                
                HStack(spacing: 16) {
                    ForEach(currencies) { currency in
                        ProfileTrandingCell(currency: currency)
                    }
                }
                .padding(.horizontal, 20)
            }
        }
    }
}
