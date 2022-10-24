//
//  String+Extension.swift
//  GoodWeather
//
//  Created by 홍성범 on 2022/10/24.
//

import Foundation

extension String {
    
    func escaped() -> String {
        return self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? self
    }
}
