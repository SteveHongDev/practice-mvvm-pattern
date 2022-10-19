//
//  Order.swift
//  HotCoffee
//
//  Created by 홍성범 on 2022/10/18.
//

import Foundation

enum CoffeeType: String, Codable, CaseIterable {
    case cappuccino
    case latte
    case espresso
    case cortado
}

enum CoffeeSize: String, Codable, CaseIterable {
    case tall
    case grande
    case venti
}

struct Order: Codable {
    
    let name: String
    let email: String
    let type: CoffeeType
    let size: CoffeeSize
}
