//
//  ReusableProtocol.swift
//  NetworkBasic
//
//  Created by 조규연 on 6/3/24.
//

import UIKit

protocol ReusableProtocol: AnyObject {
    static var identifier: String { get }
}

extension UIViewController: ReusableProtocol {
    static var identifier: String {
        return String(describing: self)
    }
}

extension UITableViewCell: ReusableProtocol {
    static var identifier: String {
        return String(describing: self)
    }
}
