//
//  LottoViewController.swift
//  NetworkBasic
//
//  Created by 조규연 on 6/4/24.
//

import UIKit
import Alamofire
import SnapKit
/*
 할일 1. response를 어떻게 화면에 띄우지?
 String => Struct (Decoding) => View
 할일 2. 코드 실행 순서 이해하기 -> 네트워크 응답을 받는데 시간이 걸린다. UX(Skeleton View)
 */

struct Lotto: Codable {
    let drwNoDate: String
    let drwNo: Int
    let drwtNo1: Int
    let drwtNo2: Int
    let drwtNo3: Int
    let drwtNo4: Int
    let drwtNo5: Int
    let drwtNo6: Int
    let bnusNo: Int
    
    var dateString: String {
        return "\(drwNoDate) 추첨"
    }
    
    var drwNoString: String {
        return "\(drwNo)회"
    }
}


class LottoViewController: UIViewController {
    
    let textField = UITextField()
    let pickerView = UIPickerView()
    lazy var pickerList = (1...getLatestDrwNo()).map { String($0) }
    let announceLabel = UILabel()
    let dateLabel = UILabel()
    let separatorView = UIView()
    let drwNoLabel = UILabel()
    let resultLabel = UILabel()
    lazy var resultStackView = {
        let view = UIStackView(arrangedSubviews: [self.drwNoLabel, self.resultLabel])
        view.axis = .horizontal
        view.distribution = .equalSpacing
        view.alignment = .fill
        
        self.view.addSubview(view)
        
        return view
    }()
    let drwtNo1Label = UILabel()
    let drwtNo2Label = UILabel()
    let drwtNo3Label = UILabel()
    let drwtNo4Label = UILabel()
    let drwtNo5Label = UILabel()
    let drwtNo6Label = UILabel()
    let plusLabel = UILabel()
    let bonusLabel = UILabel()
    let bonusExplainLabel = UILabel()
    lazy var drwtStackView = {
        let view = UIStackView(arrangedSubviews: [drwtNo1Label, drwtNo2Label, drwtNo3Label, drwtNo4Label, drwtNo5Label, drwtNo6Label, plusLabel, bonusLabel])
        view.axis = .horizontal
        view.distribution = .equalSpacing
        view.alignment = .fill
        
        self.view.addSubview(view)
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        configureUI()
        configureHierachy()
        configureLayout()
        
        callRequest(drwNo: getLatestDrwNo())
    }
    
    func callRequest(drwNo: Int) {
        let url = "https://www.dhlottery.co.kr/common.do?method=getLottoNumber&drwNo=\(drwNo)"
        AF.request(url).responseDecodable(of: Lotto.self) { response in
            switch response.result {
            case .success(let value):
                self.dateLabel.text = value.dateString
                self.drwNoLabel.text = value.drwNoString
                self.drwtNo1Label.text = String(value.drwtNo1)
                self.drwtNo2Label.text = String(value.drwtNo2)
                self.drwtNo3Label.text = String(value.drwtNo3)
                self.drwtNo4Label.text = String(value.drwtNo4)
                self.drwtNo5Label.text = String(value.drwtNo5)
                self.drwtNo6Label.text = String(value.drwtNo6)
                self.bonusLabel.text = String(value.bnusNo)
            case .failure(let error):
                print(error)
                self.textField.text = "에러가 발생했습니다."
            }
        }
    }
    
    func getLatestDrwNo() -> Int {
        let now = Date()
        let calendar = Calendar.current
        var components = DateComponents(year: 2002, month: 12, day: 7)
        let firstDay = calendar.date(from: components)
        
        components = calendar.dateComponents([.day], from: firstDay!, to: now)
        
        let result = Int(components.day!) / 7 + 1
        return result
    }

    func configureHierachy() {
        view.addSubviews([announceLabel, dateLabel, textField, separatorView, bonusExplainLabel])
    }
    
    func configureLayout() {
        
        textField.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
        
        announceLabel.snp.makeConstraints {
            $0.top.equalTo(textField.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(16)
        }
        
        dateLabel.snp.makeConstraints {
            $0.bottom.equalTo(announceLabel)
            $0.trailing.equalToSuperview().offset(-16)
        }
        
        separatorView.snp.makeConstraints {
            $0.top.equalTo(announceLabel.snp.bottom).offset(16)
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.height.equalTo(1)
        }
        
        resultStackView.snp.makeConstraints {
            $0.top.equalTo(separatorView.snp.bottom).offset(30)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(160)
        }
        
        drwtStackView.snp.makeConstraints {
            $0.top.equalTo(resultStackView.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview().inset(20)
        }

        drwtNo1Label.snp.makeConstraints {
            $0.size.equalTo(40)
        }
        
        drwtNo2Label.snp.makeConstraints {
            $0.size.equalTo(40)
        }
        
        drwtNo3Label.snp.makeConstraints {
            $0.size.equalTo(40)
        }
        
        drwtNo4Label.snp.makeConstraints {
            $0.size.equalTo(40)
        }
        
        drwtNo5Label.snp.makeConstraints {
            $0.size.equalTo(40)
        }
        
        drwtNo6Label.snp.makeConstraints {
            $0.size.equalTo(40)
        }
        
        plusLabel.snp.makeConstraints {
            $0.size.equalTo(40)
        }
        
        bonusLabel.snp.makeConstraints {
            $0.size.equalTo(40)
        }
        
        bonusExplainLabel.snp.makeConstraints {
            $0.centerX.equalTo(bonusLabel)
            $0.top.equalTo(drwtStackView.snp.bottom).offset(4)
        }
    }
    
    func configureUI() {
        announceLabel.text = "당첨번호 안내"
        
        dateLabel.textColor = .lightGray
        dateLabel.font = .systemFont(ofSize: 14)
        
        separatorView.backgroundColor = .lightGray
        
        drwNoLabel.font = .boldSystemFont(ofSize: 24)
        drwNoLabel.textColor = .orange
        
        resultLabel.text = "당첨결과"
        resultLabel.font = .boldSystemFont(ofSize: 24)
        
        drwtNo1Label.setLottoNumLabel(backgroundColor: .systemYellow)
        drwtNo2Label.setLottoNumLabel(backgroundColor: .systemCyan)
        drwtNo3Label.setLottoNumLabel(backgroundColor: .systemCyan)
        drwtNo4Label.setLottoNumLabel(backgroundColor: .systemPink)
        drwtNo5Label.setLottoNumLabel(backgroundColor: .systemPink)
        drwtNo6Label.setLottoNumLabel(backgroundColor: .systemGray2)
        
        plusLabel.setLottoNumLabel(backgroundColor: .clear)
        plusLabel.text = "+"
        plusLabel.textColor = .black
        plusLabel.font = .boldSystemFont(ofSize: 17)
        
        bonusLabel.setLottoNumLabel(backgroundColor: .systemGray2)
        
        bonusExplainLabel.text = "보너스"
        bonusExplainLabel.textColor = .gray
        bonusExplainLabel.font = .systemFont(ofSize: 12)
        
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.textAlignment = .center
        textField.clipsToBounds = true
        textField.layer.cornerRadius = 5
        textField.delegate = self
        textField.inputView = pickerView
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()

        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonTapped))
        doneButton.tintColor = .black
        toolbar.setItems([doneButton], animated: true)

        textField.inputAccessoryView = toolbar
        
        pickerView.delegate = self
        pickerView.dataSource = self
        
    }
    
    @objc func doneButtonTapped() {
        view.endEditing(true)
    }
    
    func showAlert(title: String) {
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        let ok = UIAlertAction(title: "확인", style: .default)
        alert.addAction(ok)
        present(alert, animated: true)
    }
}

extension LottoViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        callRequest(drwNo: Int(textField.text!)!)
    }
}

extension LottoViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerList.reversed()[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        textField.text = pickerList.reversed()[row]
    }
    
}
