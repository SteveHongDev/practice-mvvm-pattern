//
//  SettingsViewModel.swift
//  GoodWeather
//
//  Created by 홍성범 on 2022/10/26.
//

import Foundation

enum Unit: String, CaseIterable {
    case celcius = "metric"
    case fahrenheit = "imperial"
}

extension Unit {
    
    var displayName: String {
        get {
            switch self {
            case .celcius:
                return "Celcius"
            case .fahrenheit:
                return "Fahrenheit"
            }
        }
    }
}

class SettingsViewModel {
    
    let units = Unit.allCases
    
    var selectedUnit: Unit {
        get {
            let userDefaults = UserDefaults.standard
            var unitValue = ""
            
            // unit 뽑아내기
            if let value = userDefaults.value(forKey: "unit") as? String {
                unitValue = value
            }
            
            return Unit(rawValue: unitValue)!
        }
        set {
            let userDefaults = UserDefaults.standard
            
            
            
            userDefaults.set(newValue.rawValue, forKey: "unit")
        }
    }
    
}
