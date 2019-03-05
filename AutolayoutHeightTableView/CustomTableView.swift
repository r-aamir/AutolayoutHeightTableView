//
//  AlertTableViewCell.swift
//
//  Created by Daria.R on 7/09/17.
//  Copyright © 2017 Martoff. All rights reserved.
//

import UIKit

class CustomTableView: UITableView {
    
    var maximumTableViewHeight: CGFloat = UIScreen.main.bounds.size.height
    
    private var heightConstraint: NSLayoutConstraint!
    
    override func reloadData() {
        super.reloadData()
        self.heightConstraint.constant = min(self.contentSize.height, maximumTableViewHeight)
    }

    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        self.addHeightConstraint()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.addHeightConstraint()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.addHeightConstraint()
    }
    
    private func addHeightConstraint() {
        guard self.heightConstraint == nil else { return }
        
        self.heightConstraint = NSLayoutConstraint(item: self, attribute: .height, relatedBy: .equal, toItem: nil,
                                                   attribute: .notAnAttribute, multiplier: 1, constant: 0)
        self.addConstraint(heightConstraint)
    }
}
