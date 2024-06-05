//
//  Extension+UILabel.swift
//  NetworkBasic
//
//  Created by 조규연 on 6/5/24.
//

import UIKit

extension UILabel {
    func setLottoNumLabel(backgroundColor: UIColor) {
        textColor = .white
        textAlignment = .center
        self.backgroundColor = backgroundColor
        clipsToBounds = true
        layer.cornerRadius = 20
    }
}
