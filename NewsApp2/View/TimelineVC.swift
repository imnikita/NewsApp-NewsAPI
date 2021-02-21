//
//  ViewController.swift
//  NewsApp2
//
//  Created by Nikita Popov on 21.02.2021.
//

import UIKit

class TimelineVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var newsTable: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newsTable.register(NewsCell.nib(), forCellReuseIdentifier: NewsCell.identifier)
        newsTable.delegate = self
        newsTable.dataSource = self
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NewsCell.identifier, for: indexPath) as! NewsCell
        cell.textLabel?.text = "Title"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }

}

