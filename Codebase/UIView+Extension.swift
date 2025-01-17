//
//  UIView+Extension.swift
//  NetworkBasic
//
//  Created by 조규연 on 6/4/24.
//

import UIKit

extension UIView {
    func addSubviews(_ views: [UIView]) {
        views.forEach {
            self.addSubview($0)
        }
    }
}
