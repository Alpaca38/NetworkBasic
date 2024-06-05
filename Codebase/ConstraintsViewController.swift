//
//  ConstraintsViewController.swift
//  NetworkBasic
//
//  Created by 조규연 on 6/4/24.
//

import UIKit
/*
 Autoresizing
 NSLayoutConstratins
 NSLayoutAnchor
 */

/*
 Adaptive Layout
 - Size Class (regular, compact)
 = Trait Collection
 - Universal
 */

class ConstraintsViewController: UIViewController {
    
    let emailTextField = UITextField()
    let signButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        view.addSubviews([emailTextField, signButton])
        
        emailTextField.backgroundColor = .orange
        signButton.backgroundColor = .red
        
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        signButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: emailTextField, attribute: .top, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .top, multiplier: 1, constant: 20),
            NSLayoutConstraint(item: emailTextField, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 20),
            NSLayoutConstraint(item: emailTextField, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: -20),
            NSLayoutConstraint(item: emailTextField, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 50),
            
            signButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signButton.widthAnchor.constraint(equalToConstant: 300),
            signButton.heightAnchor.constraint(equalToConstant: 50),
            signButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])

        
    }
    
    

}
