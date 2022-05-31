//
//  Webservices.swift
//  Good News
//
//  Created by Rachit Sharma on 03/02/22.
//

import Foundation

class Webservices {
    
     func getArticles(url: URL, completion: @escaping ([Article]) ->()) {
        URLSession.shared.dataTask(with: url) {
            data, response, error in
            guard let data = data else {return}
            print("error : \(String(describing: error))")

           let articleList = try? JSONDecoder().decode(ArticleList.self, from: data)

            if let articleList = articleList, articleList.articles.count > 0 {
                print(articleList.articles)
                completion(articleList.articles)
            }
        }.resume()
    }
}
