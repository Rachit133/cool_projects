//
//  Articles.swift
//  Good News
//
//  Created by Rachit Sharma on 03/02/22.
//

import Foundation

struct ArticleList: Decodable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}

struct Article: Decodable {
    var title: String?
    var description: String?
 }

