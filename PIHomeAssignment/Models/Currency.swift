//
//  Currency.swift
//  PIHomeAssignment
//
//  Created by Svyat Zubyak on 14.10.2022.
//

import SwiftUI

struct Currency: Identifiable {
    
    private let priceFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: "en_US")
        formatter.numberStyle = .currency
        formatter.decimalSeparator = "."
        formatter.maximumFractionDigits = 2
        return formatter
    }()
    
    let id: UUID
    let name: String
    let shortName: String
    let icon: Image
    var chartImage: Image?
    let price: Double
    let direction: Direction
    let percentage: Double
    var details = Details.current
    
    var formattedPrice: String {
        priceFormatter.string(from: NSNumber(value: price))!
    }
    
    var formattedPercentage: String {
        String(format: "%0.2f%%", percentage)
    }
    
    var formattedPercentageWithOperator: String {
        return String(format: "%+0.2f%%", percentage)
    }
    
    static let tranding = [
        Currency(id: UUID(), name: "Binance Coin", shortName: "BNB", icon: R.image.market_binance.swiftUI, chartImage: R.image.profile_chart_binance.swiftUI, price: 352.20, direction: .down, percentage: 0.27),
        Currency(id: UUID(), name: "Cardano", shortName: "ADA", icon: R.image.market_cardano.swiftUI, chartImage: R.image.profile_chart_cardano.swiftUI, price: 2936136.20, direction: .up, percentage: 4.11)
    ]
    
    static let all = [
        Currency(id: UUID(), name: "Etherium", shortName: "ETH", icon: R.image.market_ethereum.swiftUI, price: 2678.95, direction: .up, percentage: 4.95),
        Currency(id: UUID(), name: "Etherium 2", shortName: "ETH2", icon: R.image.market_ethereum_2.swiftUI, price: 2383.65, direction: .up, percentage: 4.91),
        Currency(id: UUID(), name: "Tether", shortName: "USDT", icon: R.image.market_tether.swiftUI, price: 2.0, direction: .down, percentage: -0.05),
        Currency(id: UUID(), name: "Binance Coin", shortName: "BNB", icon: R.image.market_binance.swiftUI, price: 352.50, direction: .down, percentage: -0.27),
        Currency(id: UUID(), name: "Cardano", shortName: "ADA", icon: R.image.market_cardano.swiftUI, price: 2836137.20, direction: .up, percentage: 4.11),
        Currency(id: UUID(), name: "Chain link", shortName: "LINK", icon: R.image.market_chain_link.swiftUI, price: 2836137.20, direction: .up, percentage: 2.23),
        Currency(id: UUID(), name: "Bitcoin", shortName: "BTC", icon: R.image.market_bitcoin.swiftUI, price: 36751.20, direction: .up, percentage: 2.23),
    ]
}

extension Currency {
    
    enum Direction {
        case up
        case down
        
        var forgroundColor: Color {
            switch self {
            case .up:
                return R.color.jungle_green.swiftUI
            case .down:
                return R.color.burnt_sienna.swiftUI
            }
        }
    }
    
    struct Details {
        
        private let priceFormatter: NumberFormatter = {
            let formatter = NumberFormatter()
            formatter.locale = Locale(identifier: "en_US")
            formatter.numberStyle = .currency
            formatter.decimalSeparator = "."
            formatter.maximumFractionDigits = 2
            return formatter
        }()
        
        private let dateFormatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.locale = Locale(identifier: "en_US")
            formatter.dateStyle = .medium
            return formatter
        }()
        
        let dayAndNightMinValue: Double
        let dayAndNightMaxValue: Double
        let volume: Double
        let rank: Int
        let lounchDate: TimeInterval
        
        var formattedDayAndNightMinValue: String {
            priceFormatter.string(from: NSNumber(value: dayAndNightMinValue))!
        }
        
        var formattedDayAndNightMaxValue: String {
            priceFormatter.string(from: NSNumber(value: dayAndNightMaxValue))!
        }
        
        var formattedVolume: String {
            String(format: "%0.4f", volume)
        }
        
        var formattedLaunchDate: String {
            let date = Date(timeIntervalSince1970: lounchDate)
            return dateFormatter.string(from: date)
        }
        
        var formattedRank: String {
            String(format: "№%d", rank)
        }
        
        var description: String {
            "Bitcoin is a decentralized digital currency created in January 2009. It follows the ideas set out in a whitepaper by the mysterious and pseudonymous Satoshi Nakamoto.\n\nThe identity of the person or persons who created the technology is still a mystery. Bitcoin offers the"
        }
        
        static let current = Details(dayAndNightMinValue: 45848, dayAndNightMaxValue: 49300, volume: 0.0387, rank: 17, lounchDate: Date().timeIntervalSince1970)
    }
}
