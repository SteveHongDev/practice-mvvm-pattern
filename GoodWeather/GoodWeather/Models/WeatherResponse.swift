//
//  WeatherResponse.swift
//  GoodWeather
//
//  Created by 홍성범 on 2022/10/24.
//

import Foundation

struct WeatherResponse: Decodable {
    let main: Weather
    let name: String
}

struct Weather: Decodable {
    let temp: Double
    let humidity: Double
}
