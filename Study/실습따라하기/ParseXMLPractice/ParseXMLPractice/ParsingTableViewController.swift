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
    private var cellStates: [CellState]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.estimatedRowHeight = 155.0
        tableView.rowHeight = UITableViewAutomaticDimension
        
        fetchData()
    }
    
    private func fetchData() {
        let feedParser = FeedParserWithSWXMHash()
        feedParser.parserFeed(url: "https://developer.apple.com/news/rss/news.rss") {
         (rssItems) in
            print("\n---------- [ parserFeed - fetchData ] -----------\n")
            self.rssItems = rssItems
            self.cellStates = Array(repeating: .collapsed, count: rssItems.count)
            
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
            cell.selectionStyle = .none
            
            if let cellStates = cellStates {
                cell.descriptionLabel.numberOfLines = (cellStates[indexPath.row] == .expanded) ? 0 : 3
            }
        }
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let cell = tableView.cellForRow(at: indexPath) as! Cell
        
        tableView.beginUpdates()
        cell.descriptionLabel.numberOfLines = (cell.descriptionLabel.numberOfLines == 0 ? 3 : 0)
        cellStates?[indexPath.row] = (cell.descriptionLabel.numberOfLines == 0 ? .expanded : .collapsed)
        tableView.endUpdates()
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

enum CellState {
    case expanded
    case collapsed
}
