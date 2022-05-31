//
//  NewsListViewController.swift
//  Good News
//
//  Created by Rachit Sharma on 03/02/22.
//

import UIKit

class NewsListViewController: UITableViewController {

    private var articleListVM : ArticleListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpInitialization()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.articleListVM == nil ? 0 : self.articleListVM.numbeOfSections
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articleListVM == nil ? 0 : self.articleListVM.numbeOfRowsInSection(section: section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let articleCell = tableView.dequeueReusableCell(withIdentifier: "arcticleTableViewCellID", for: indexPath) as? ArticleViewCell else { return UITableViewCell.init()}
        let articleVM = self.articleListVM.articleAtIndex(indexPath.row)
        articleCell.lblTitle.text = articleVM.title
        articleCell.lblDescription.text = articleVM.description
        return articleCell
    }
}

extension NewsListViewController {
    
    private func setUpInitialization() {
    self.getArticles()
    }
    
    private func getArticles() {
        let mainUrl = URL.init(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=0dec6a707176402f964941d293e80b4f")!
        Webservices().getArticles(url: mainUrl) { articles in
            self.articleListVM = ArticleListViewModel(articles: articles)
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

}
