//
//  BasicTableViewCell.swift
//  NetworkBasic
//
//  Created by 조규연 on 6/3/24.
//

import UIKit

class BasicTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        textLabel?.font = .boldSystemFont(ofSize: 15)
    }
    
}
