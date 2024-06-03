//
//  ViewController.swift
//  NetworkBasic
//
//  Created by 조규연 on 6/3/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }
    
    func configureTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        let nib = UINib(nibName: BasicTableViewCell.identifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: BasicTableViewCell.identifier)
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BasicTableViewCell.identifier, for: indexPath) as! BasicTableViewCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        <#code#>
    }
}
