//
//  TableViewController.swift
//  ParseXMLPractice
//
//  Created by sungnni on 2018. 9. 4..
//  Copyright © 2018년 sungeun. All rights reserved.
//

import UIKit

class ParsingTableViewController: UITableViewController {

    private var rssItems: [RSSItem]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.estimatedRowHeight = 155.0
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    private func fetchData() {
        let feedParser: FeedParser = FeedParser()
        feedParser.parserFeed(url: "https://developer.apple.com/news/rss/news.rss") {
         (rssItems) in
            self.rssItems = rssItems
            
            // UI!!! - MainQueue
            OperationQueue.main.addOperation {
                self.tableView.reloadSections(IndexSet(integer: 0), with: .left)
            }
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let rssItems = rssItems else { return 0 }
        return rssItems.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! Cell
        if let item = rssItems?[indexPath.item] {
            cell.item = item
        }
        return cell
    }

}

class Cell: UITableViewCell {
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var pubDate: UILabel!
    
    var item: RSSItem! {
        didSet {
            title.text = item.title
            descriptionLabel.text = item.description
            pubDate.text = item.pubDate
        }
    }
}
