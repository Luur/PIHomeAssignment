//
//  DateExtensions.swift
//  PIHomeAssignment
//
//  Created by Svyat Zubyak on 16.10.2022.
//

import Foundation

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
