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
    
    func configure(data: User) {
        textLabel?.text = data.name
        detailTextLabel?.text = data.userAge
        backgroundColor = data.bgColor
        selectionStyle = .none
    }
    
}
