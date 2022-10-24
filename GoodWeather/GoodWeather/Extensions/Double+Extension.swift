//
//  Double+Extension.swift
//  GoodWeather
//
//  Created by 홍성범 on 2022/10/24.
//

import Foundation

extension Double {
    
    func formatAsDegree() -> String {
        return String(format: "%.0f°", self)
    }
}
