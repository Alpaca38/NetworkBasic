//
//  UserViewController.swift
//  NetworkBasic
//
//  Created by 조규연 on 6/3/24.
//

import UIKit

class UserViewController: UIViewController {

    @IBOutlet var userLabel: UILabel!
    
    //카카오와 친구들
    
    var data: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        userLabel.text = "\(data!.name), \(data!.userAge)"
        view.backgroundColor = data?.bgColor
    }
    
}
