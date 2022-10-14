//
//  ProfileHeaderView.swift
//  PIHomeAssignment
//
//  Created by Svyat Zubyak on 14.10.2022.
//

import SwiftUI
import Kingfisher

struct ProfileHeaderView: View {
    
    let user: User
    
    var body: some View {
        
        HStack {
            
            VStack(alignment: .leading) {
                
                Text("Welcome back,")
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(R.color.spun_pearl.swiftUI)
                
                HStack(spacing: 10) {
                    
                    Text(user.name)
                        .font(.system(size: 24, weight: .semibold))
                        .foregroundColor(.white)
                    
                    R.image.profile_header_hand.swiftUI
                }
            }
            
            Spacer()
            
            KFImage.url(user.avatarURL)
                .fade(duration: 0.25)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(30)
        }
        .frame(height: 60)
        .padding(.top, 60)
        .padding(.horizontal, 20)
    }
}

struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView(user: User.current)
    }
}
