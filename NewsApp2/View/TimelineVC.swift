//
//  ViewController.swift
//  NewsApp2
//
//  Created by Nikita Popov on 21.02.2021.
//

import UIKit

class TimelineVC: UIViewController, UITableViewDelegate, UITableViewDataSource, RequestManagerDelegate {
    
    
    var currentResultsCount = 1
    var totalResults = 1
    
    var requestManager = RequestManager()
    var articlesArray = [News]()
    
    var refreshControl = UIRefreshControl()
    
    @IBOutlet var newsTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        newsTable.register(NewsCell.nib(), forCellReuseIdentifier: NewsCell.identifier)
        newsTable.delegate = self
        newsTable.dataSource = self
        requestManager.delegate = self
        requestManager.fetchData(withURL: requestUrl, pageNumber: pageNumber)
        
        refreshControl.attributedTitle = NSAttributedString(string: "Refreshing...")
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        newsTable.addSubview(refreshControl)
    }
    
    
    
    @objc func refresh(_ sender: AnyObject) {
        pageNumber = 1
        viewDidLoad()
        refreshControl.endRefreshing()
    }
    
    
    // MARK: - RequestManagerDelegate method
    
    func didUpdateData(_ requestManager: RequestManager, newsArray: [News]) {
        self.articlesArray.removeAll()
        DispatchQueue.main.async {
            self.articlesArray = newsArray
            self.newsTable.reloadData()
            self.currentResultsCount += self.articlesArray.count
            print("in articles array now: \(self.articlesArray.count)")
        }
    }
    
    
    // MARK: - TableView methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return articlesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if currentResultsCount < totalResults && indexPath.row == articlesArray.count - 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: "loading")!
            return cell
        }

        let cell = tableView.dequeueReusableCell(withIdentifier: NewsCell.identifier, for: indexPath) as! NewsCell
        cell.titleLabel.text = articlesArray[indexPath.row].title!
        cell.autorLabel.text = articlesArray[indexPath.row].author ?? "Article from editor"
        cell.timeLabel.text = articlesArray[indexPath.row].publishedAt!
        cell.previewImage.load(url: ((articlesArray[indexPath.row].urlToImage) ?? deffiniteImageURL))
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if currentResultsCount < totalResults && indexPath.row == articlesArray.count - 1{
            pageNumber += 1
            requestManager.fetchData(withURL: requestUrl, pageNumber: pageNumber)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        150
    }
    
}

