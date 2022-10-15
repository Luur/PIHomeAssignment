//
//  Article.swift
//  PIHomeAssignment
//
//  Created by Svyat Zubyak on 14.10.2022.
//

import SwiftUI

struct Beer: Decodable {
    let id: Int
}

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
        let date = dateFormatter.date(from: publishedDate)
        return date?.timeAgo()
    }
}

extension Date {
    func timeAgo() -> String {
        var calendar = Calendar.current
        calendar.locale = Locale(identifier: "en_US")
        let formatter = DateComponentsFormatter()
        formatter.calendar = calendar
        formatter.unitsStyle = .full
        formatter.allowedUnits = [.year, .month, .day, .hour, .minute, .second]
        formatter.zeroFormattingBehavior = .dropAll
        formatter.maximumUnitCount = 1
        return formatter.string(from: self, to: Date()) ?? ""
    }
}

