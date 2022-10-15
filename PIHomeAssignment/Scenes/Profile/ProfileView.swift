//
//  ProfileView.swift
//  PIHomeAssignment
//
//  Created by Svyat Zubyak on 14.10.2022.
//

import SwiftUI

struct ProfileView<ViewModel: ProfileViewModelProtocol>: View {
    
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        
        ZStack {
            
            R.color.midnight_express.swiftUI
            
            VStack(alignment: .leading, spacing: 32) {
                
                ProfileHeaderView(user: User.current)
                
                ScrollView {
                    
                    VStack(spacing: 42) {
                        
                        ProfileBalanceView(balance: User.current.formattedBalance)
                        
                        ProfileTrandingView(currencies: Currency.tranding)
                        
                        if !viewModel.articles.isEmpty {
                            ProfileArticlesView(articles: viewModel.articles)
                        }
                    }
                    .frame(maxWidth: .infinity)
                }
            }
        }
        .edgesIgnoringSafeArea(.top)
        .onFirstAppear(perform: viewModel.fetchArticles)
    }
}
