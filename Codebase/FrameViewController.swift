//
//  FrameViewController.swift
//  NetworkBasic
//
//  Created by 조규연 on 6/4/24.
//

import UIKit

//Frame Based Layout -> Auto Layout(AutoResizing) -> Adaptive Layout
class FrameViewController: UIViewController {
    
    //1. 뷰 객체 프로퍼티 선언 (클래스 인스턴스)
    let emailTextField = UITextField()
    let signButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        //2. 루트 뷰에 추가
        view.addSubviews([emailTextField, signButton])
        //3. 객체의 크기와 위치 설정
        emailTextField.frame = CGRect(x: 100, y: 100, width: 300, height: 50)
        let width = UIScreen.main.bounds.width
        signButton.frame = CGRect(x: 50, y: 300, width: width - 100, height: 50)
        
        emailTextField.backgroundColor = .orange
        signButton.backgroundColor = .green

        
    }
    

}
