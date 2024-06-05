//
//  SnapViewController.swift
//  NetworkBasic
//
//  Created by 조규연 on 6/4/24.
//

import UIKit
import SnapKit
/*
 1. 필요성
 2. HTTP vs Socket
 3. HTTP: 클라이언트가 항상 먼저 요청을하고, 서버가 응답(xml/json)한다.
 4. get, post, delete, put
 4. 인증키
 */

class SnapViewController: UIViewController {
    
    let photoImageView = UIImageView()
    
    let titleTextField = {
        let textField = UITextField()
        textField.backgroundColor = .red
        textField.placeholder = "제목을 입력해주세요"
        textField.textAlignment = .center
        textField.borderStyle = .none
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 1
        return textField
    }()
    
    let dateTextField = UITextField()
    let contentTextView = UITextView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        configureHierarchy()
        configureLayout()
    }
    
    func configureUI() {
        view.backgroundColor = .systemBackground
        photoImageView.backgroundColor = .orange
        dateTextField.backgroundColor = .magenta
        contentTextView.backgroundColor = .systemIndigo
    }
    
    func configureHierarchy() {
        view.addSubviews([photoImageView, titleTextField, dateTextField, contentTextView])
    }
    
    func configureLayout() {
        photoImageView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(300)
        }
        
        titleTextField.snp.makeConstraints {
            $0.top.equalTo(photoImageView.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
        
        dateTextField.snp.makeConstraints {
            $0.top.equalTo(titleTextField.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
        
        contentTextView.snp.makeConstraints {
            $0.top.equalTo(dateTextField.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }

}
