//
//  Article.swift
//  PIHomeAssignment
//
//  Created by Svyat Zubyak on 14.10.2022.
//

import SwiftUI

struct Article: Identifiable, Decodable {
    
    let id: String
    let sourceName: String
    let publishedDate: String
    let title: String
    
    var picture: Image {
        let pictures = [R.image.profile_article_1.swiftUI, R.image.profile_article_2.swiftUI]
        return pictures.randomElement()!
    }
    
    var timeAgo: String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        guard let date = dateFormatter.date(from: publishedDate) else { return nil }
        return R.string.localizable.profile_article_time_ago(date.timeAgo())
    }
}
