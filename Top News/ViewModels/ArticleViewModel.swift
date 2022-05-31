//
//  ArticleViewModels.swift
//  Good News
//
//  Created by Rachit Sharma on 03/02/22.
//

import Foundation

struct ArticleListViewModel {
     let articles : [Article]
}

extension ArticleListViewModel {
    
    var numbeOfSections: Int {
        return 1
    }
    
    func numbeOfRowsInSection(section: Int) -> Int {
        return self.articles.count
    }
    
    func articleAtIndex(_ index: Int) -> ArticleViewModel {
        return ArticleViewModel.init(self.articles[index])
    }
}

struct ArticleViewModel {
    private let article : Article
}

extension ArticleViewModel {
    init(_ article: Article) {
        self.article = article
    }
}

extension ArticleViewModel {
    var title: String {
        return self.article.title ?? ""
    }
    
    var description: String {
        return self.article.description ?? ""
    }
}
