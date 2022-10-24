//
//  Constants.swift
//  GoodWeather
//
//  Created by 홍성범 on 2022/10/24.
//

import Foundation

struct Constants {
    
    struct Urls {
        
        static func urlForWeatherByCity(city: String) -> URL {
            
            let userDefaults = UserDefaults.standard
            let unit = (userDefaults.value(forKey: "unit") as? String) ?? "metric"
            
            return URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city.escaped())&appid=c1b4f5242aeeedbe9a50804396a13515&units=\(unit)")!
        }
    }
}
