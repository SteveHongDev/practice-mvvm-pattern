//
//  Article.swift
//  GoodNews
//
//  Created by 홍성범 on 2022/10/18.
//

import Foundation

struct ArticleList: Decodable {
    let articles: [Article]
}

struct Article: Decodable {
    let title: String
    let description: String?
}
