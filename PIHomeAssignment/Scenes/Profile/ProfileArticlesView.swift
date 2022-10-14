//
//  ProfileArticlesView.swift
//  PIHomeAssignment
//
//  Created by Svyat Zubyak on 14.10.2022.
//

import SwiftUI

struct ProfileArticlesView: View {
    
    let articles: [Article]
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 20) {
            
            HStack {
                
                SectionHeaderView(image: R.image.profile_news_coin.swiftUI, title: R.string.localizable.profile_news())
                
                Spacer()
                
                Button(action: {}) {
                    Gradients.pink
                        .mask(
                            Text(R.string.localizable.profile_show_all())
                                .font(Font.system(size: 16, weight: .semibold))
                        )
                }
                .frame(width: 66)
            }
            .padding(.horizontal, 20)
            
            LazyVStack(spacing: 16) {
                ForEach(articles) { article in
                    ProfileArticleCell(article: article)
                }
            }
        }
        .padding(.bottom, 20)
    }
}
