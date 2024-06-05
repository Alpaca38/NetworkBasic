//
//  ViewController.swift
//  NetworkBasic
//
//  Created by 조규연 on 6/3/24.
//

import UIKit

struct User {
    let name: String
    let age: Int = .random(in: 1...100)
    let bgColor: UIColor = UIColor.random()
    
    var userAge: String {
        return "\(age)세"
    }
    
}

class ViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    let list: [User] = [
        User(name: "뽀로로"),
        User(name: "무지"),
        User(name: "크롱"),
        User(name: "둘리"),
        User(name: "라이언")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        configureBarButtonItem()
    }
    
    func configureBarButtonItem() {
        let item = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(plusButtonTapped))
        navigationItem.rightBarButtonItem = item
        
        let item2 = UIBarButtonItem(image: UIImage(systemName: "star"), style: .plain, target: self, action: #selector(starButtonTapped))
        navigationItem.leftBarButtonItem = item2
    }
    
    @objc func starButtonTapped() {
        let vc = LottoViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func plusButtonTapped() {
        let vc = storyboard?.instantiateViewController(withIdentifier: AddEditViewController.identifier) as! AddEditViewController
        vc.type = .add
        let navi = UINavigationController(rootViewController: vc)
        present(navi, animated: true)
    }
    
    //self: 클래스의 인스턴스
    //delegate, dataSource 프로퍼티는 프로토콜인데..
    //타입으로서의 프로토콜(Protocol as Type)
    func configureTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        let nib = UINib(nibName: BasicTableViewCell.identifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: BasicTableViewCell.identifier)
        tableView.rowHeight = 80
        tableView.separatorColor = .red
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BasicTableViewCell.identifier, for: indexPath) as! BasicTableViewCell
        let data = list[indexPath.row]
        cell.configure(data: data)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let vc = storyboard?.instantiateViewController(identifier: UserViewController.identifier) as! UserViewController
//        let data = list[indexPath.row]
//        vc.data = data
//        present(vc, animated: true)
        let vc = storyboard?.instantiateViewController(withIdentifier: AddEditViewController.identifier) as! AddEditViewController
        vc.type = .edit
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
