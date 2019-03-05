//
//  ViewController.swift
//  AutolayoutHeightTableView
//
//  Created by AamirR on 3/5/19.
//  Copyright © 2019 AamirR. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var tableView: CustomTableView!
    private let cellIdentifier = "Cell"
    
    var dataSource: [Int] = [1, 2, 3] {
        didSet {
            self.tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.dataSource = self
        self.tableView.maximumTableViewHeight = UIScreen.main.bounds.height / 2.0
    }

    @IBAction func addCell(_ sender: Any) {
        let count = self.dataSource.count + 1
        self.dataSource.append(count)
        
        let scrollToIndexPath = IndexPath(row: count - 1, section: 0)
        DispatchQueue.main.async {
            self.tableView.scrollToRow(at: scrollToIndexPath, at: .bottom, animated: false)
        }
    }
    
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell! = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: cellIdentifier)
        }
        
        cell.textLabel?.text = "Value: " + String(dataSource[indexPath.row])
        return cell
    }
    
}
