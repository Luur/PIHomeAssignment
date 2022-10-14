//
//  ProfileSectionHeaderView.swift
//  PIHomeAssignment
//
//  Created by Svyat Zubyak on 14.10.2022.
//

import SwiftUI

struct SectionHeaderView: View {
    
    let image: Image
    let title: String
    
    var body: some View {
       
        HStack(spacing: 8) {
            
            image
            
            Text(title)
                .font(.system(size: 20, weight: .semibold))
                .foregroundColor(.white)
        }
    }
}
