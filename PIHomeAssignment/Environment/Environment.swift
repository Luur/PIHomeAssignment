//
//  Environment.swift
//  PIHomeAssignment
//
//  Created by Svyat Zubyak on 16.10.2022.
//

import Foundation

enum Environment {
    case sandbox
    case development
    
    static var rapidBaseURL: String {
        let settings = Bundle.main.infoDictionary?["environment_settings"] as? Dictionary<String, Any>
        guard let baseURL = settings?["rapid_base_url"] as? String else { fatalError("rapid_base_url is not provided in plist file.") }
        return baseURL
    }
    
    static var rapidApiKey: String {
        let settings = Bundle.main.infoDictionary?["environment_settings"] as? Dictionary<String, Any>
        guard let apiKey = settings?["rapid_api_key"] as? String else { fatalError("rapid_api_key is not provided in plist file.") }
        return apiKey
    }
    
    static var rapidApiHost: String {
        let settings = Bundle.main.infoDictionary?["environment_settings"] as? Dictionary<String, Any>
        guard let apiHost = settings?["rapid_api_host"] as? String else { fatalError("rapid_api_host is not provided in plist file.") }
        return apiHost
    }
    
    static var rapidPerformanceID: String {
        let settings = Bundle.main.infoDictionary?["environment_settings"] as? Dictionary<String, Any>
        guard let performanceID = settings?["rapid_performance_id"] as? String else { fatalError("rapid_performance_id is not provided in plist file.") }
        return performanceID
    }
}
