//
//  File.swift
//  
//
//  Created by SREININ on 21/9/23.
//

import Foundation
@propertyWrapper
struct UserDefault<T: Codable> {
    private let key: String
    private let defaultValue: T
    
    struct Wrapper<T> : Codable where T : Codable {
        let wrapped : T
    }
    
    init(_ key : String, defaultValue : T) {
        self.key = key
        self.defaultValue = defaultValue
    }
    
    var wrappedValue: T {
        get {
            // Read value from UserDefaults
            guard let data = UserDefaults.standard.object(forKey: key) as? Data else {
                // Return defaultValue when no data in UserDefaults
                return defaultValue
            }
            
            // Convert data to the desire data type
            let value = try? JSONDecoder().decode(Wrapper<T>.self, from: data)
            return value?.wrapped ?? defaultValue
        }
        set {
            // Convert newValue to data
            let encoder = JSONEncoder()
            let data = try? encoder.encode(Wrapper(wrapped: newValue))
            
            // Set value to UserDefaults
            UserDefaults.standard.set(data, forKey: key)
        }
    }
}

@propertyWrapper
struct Capitalized {
    
    var wrappedValue: String {
        didSet { wrappedValue = wrappedValue.capitalized }
    }

    init(wrappedValue: String) {
        self.wrappedValue = wrappedValue.capitalized
    }
}
