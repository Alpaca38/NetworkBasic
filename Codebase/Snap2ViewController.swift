//
//  Snap2ViewController.swift
//  NetworkBasic
//
//  Created by 조규연 on 6/4/24.
//

import UIKit
import SnapKit

class Snap2ViewController: UIViewController {
    
    let redView = UIView()
    let blueView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureHierarchy()
        configureLayout()
    }
    
    func configureUI() {
        view.backgroundColor = .systemBackground
        redView.backgroundColor = .red
        blueView.backgroundColor = .blue
    }
    
    func configureHierarchy() {
        view.addSubview(redView)
        redView.addSubview(blueView)
    }
    
    func configureLayout() {
        redView.snp.makeConstraints {
            $0.top.leading.equalTo(view.safeAreaLayoutGuide)
            $0.size.equalTo(300)
        }
        
        blueView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(20)
        }
    }
    

}
