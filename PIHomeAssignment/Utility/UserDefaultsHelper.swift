//
//  UserDefaultsHelper.swift
//  PIHomeAssignment
//
//  Created by Svyat Zubyak on 13.10.2022.
//

import Foundation

@propertyWrapper
struct UserDefault<T: Codable> {
    let key: String
    let defaultValue: T
    var container: UserDefaults = .standard

    var wrappedValue: T {
        get {
            guard let data = container.object(forKey: key) as? Data else { return defaultValue }
            let value = try? JSONDecoder().decode(T.self, from: data)
            return value ?? defaultValue
        }
        set {
            if let optional = newValue as? OptionalProtocol, optional.isNil {
                container.removeObject(forKey: key)
            } else {
                let data = try? JSONEncoder().encode(newValue)
                container.set(data, forKey: key)
            }
        }
    }
}

private protocol OptionalProtocol {
    var isNil: Bool { get }
}

extension Optional: OptionalProtocol {
    var isNil: Bool { return self == nil }
}

extension UserDefault where T: ExpressibleByNilLiteral {
    
    init(key: String, _ container: UserDefaults = .standard) {
        self.init(key: key, defaultValue: nil, container: container)
    }
}

extension UserDefaults {
    
    @UserDefault(key: "is_onboarding_presented", defaultValue: false)
    static var isOnboardingPresented: Bool
}
