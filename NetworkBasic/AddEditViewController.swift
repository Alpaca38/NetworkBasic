//
//  EditViewController.swift
//  NetworkBasic
//
//  Created by 조규연 on 6/3/24.
//

import UIKit
// 휴먼에러 방지, 컴파일 단계에서 오류처리 가능
// 멤버와 값의 분리: rawValue
enum ViewType: String {
    case add = "추가하기"
    case edit = "편집하기"
    
    var placeholder: String {
        switch self {
        case .add:
            return "등록할 이름을 입력해주세요"
        case .edit:
            return "수정할 이름을 입력해주세요"
        }
    }
}

class AddEditViewController: UIViewController {
    
    @IBOutlet var textField: UITextField!
    
    var type: ViewType = .add

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = type.rawValue
        textField.placeholder = type.placeholder
        
        configureBarButtonItem()
    }
    
    func configureBarButtonItem() {
        let item = UIBarButtonItem(title: "저장", style: .plain, target: self, action: #selector(saveButtonTapped))
        navigationItem.rightBarButtonItem = item
    }
    
    @objc func saveButtonTapped() {
//        if titleValue == "추가하기" {
//            dismiss(animated: true)
//        } else {
//            navigationController?.popViewController(animated: true)
//        }
        switch type {
        case .add:
            dismiss(animated: true)
        case .edit:
            navigationController?.popViewController(animated: true)
        }
    }
    


}
