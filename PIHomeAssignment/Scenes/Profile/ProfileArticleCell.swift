//
//  ProfileArticleCell.swift
//  PIHomeAssignment
//
//  Created by Svyat Zubyak on 14.10.2022.
//

import SwiftUI

struct ProfileArticleCell: View {
    
    let article: Article
    
    var body: some View {
        
        HStack(alignment: .top, spacing: 20) {
            
            article.picture
                .resizable()
                .frame(width: 80, height: 80)
            
            VStack(alignment: .leading, spacing: 10) {
                
                HStack(spacing: 10) {
                    
                    Text(article.sourceName)
                        .font(.system(size: 12, weight: .semibold))
                        .foregroundColor(R.color.spun_pearl.swiftUI)
                    
                    Circle()
                        .fill(R.color.spun_pearl.swiftUI)
                        .frame(width: 5, height: 5)
                    
                    if let timeAgo = article.timeAgo {
                        Text(timeAgo)
                            .font(.system(size: 12, weight: .semibold))
                            .foregroundColor(R.color.spun_pearl.swiftUI)
                    }
                }
                
                Text(article.title)
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(.white)
                    .lineLimit(3)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .padding(.horizontal, 20)
    }
}
