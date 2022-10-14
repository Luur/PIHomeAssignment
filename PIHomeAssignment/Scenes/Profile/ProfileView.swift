//
//  ProfileView.swift
//  PIHomeAssignment
//
//  Created by Svyat Zubyak on 14.10.2022.
//

import SwiftUI

struct ProfileView: View {
    
    var body: some View {
        
        ZStack {
            
            R.color.midnight_express.swiftUI
            
            VStack(alignment: .leading, spacing: 32) {
                
                ProfileHeaderView(user: User.current)
                
                ScrollView {
                    
                    VStack(spacing: 42) {
                        
                        ProfileBalanceView(balance: User.current.formattedBalance)
                        
                        ProfileTrandingView(currencies: Currency.tranding)
                        
                        ProfileArticlesView(articles: [Article(id: "1", sourceName: "Altcoin news", publishedDate: "2022-02-17T14:11:00-06:00", title: "Six XRP Token Holders to Speak in Ripple-SEC Case as Circle Gets Subpoena"), Article(id: "2", sourceName: "Altcoin news", publishedDate: "2022-02-17T14:11:00-06:00", title: "Six XRP Token Holders to Speak in Ripple-SEC Case as Circle Gets Subpoena"), Article(id: "3", sourceName: "Altcoin news", publishedDate: "2022-02-17T14:11:00-06:00", title: "Six XRP Token Holders to Speak in Ripple-SEC Case as Circle Gets Subpoena")
                        ])
                    }
                    .frame(maxWidth: .infinity)
                }
            }
        }
        .edgesIgnoringSafeArea(.top)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
