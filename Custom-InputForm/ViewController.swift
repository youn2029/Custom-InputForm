//
//  ViewController.swift
//  Custom-InputForm
//
//  Created by 윤성호 on 08/04/2019.
//  Copyright © 2019 윤성호. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var paramEmail: UITextField!    // 이메일 입력 필드
    var paramUpdate: UISwitch!      // 자동갱신 스위치
    var paramInterval: UIStepper!   // 갱신주기 스테퍼
    
    var txtUpdate: UILabel!         // 자동갱신 텍스트
    var txtInterval: UILabel!       // 갱신주기 텍스트

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 네비게이션 바 타이틀
        self.navigationItem.title = "설정"
        
        //////////////////////////////////////////////////////
        
        // 이메일 레이블을 생성하고 영역과 기본 문구를 설정
        let lblEmail = UILabel()
        lblEmail.frame = CGRect(x: 30, y: 100, width: 100, height: 30)
        lblEmail.text = "이메일"
        lblEmail.font = UIFont.systemFont(ofSize: 14)    // 레이블 폰트를 설정
        
        self.view.addSubview(lblEmail)  // 레이블을 루트 뷰에 추가
        
        //////////////////////////////////////////////////////
        
        // 자동갱신 Label
        let lblUpdate = UILabel()
        lblUpdate.frame = CGRect(x: lblEmail.frame.origin.x, y: 150, width: 100, height: 30)
        lblUpdate.text = "자동 갱신"
        lblUpdate.font = UIFont.systemFont(ofSize: 14)
        
        self.view.addSubview(lblUpdate)
        
        //////////////////////////////////////////////////////
        
        // 갱신주기 Label
        let lblInterval = UILabel()
        lblInterval.frame = CGRect(x: lblEmail.frame.origin.x, y: 200, width: 100, height: 30)
        lblInterval.text = "갱신주기"
        lblInterval.font = UIFont.systemFont(ofSize: 14)
        
        self.view.addSubview(lblInterval)
        
        //////////////////////////////////////////////////////
        
        // 이메일 텍스트 필드
        self.paramEmail = UITextField()
        self.paramEmail.frame = CGRect(x: 120, y: lblEmail.frame.origin.y, width: 220, height: 30)
        self.paramEmail.borderStyle = UITextField.BorderStyle.roundedRect
        self.paramEmail.font = UIFont.systemFont(ofSize: 13)
        self.paramEmail.placeholder = "이메일을 입력해주세요"
        self.paramEmail.autocapitalizationType = .none
//        self.paramEmail.adjustsFontSizeToFitWidth = true        // 입력된 문자열의 폰트 사이즈를 텡스트 필드의 너비에 맞게 자동 조절 (fontsize가 설정되지 않았을 때)
        
        self.view.addSubview(self.paramEmail)
        
        //////////////////////////////////////////////////////
        
        // 자동갱신 스위치
        self.paramUpdate = UISwitch()
        self.paramUpdate.frame = CGRect(x: self.paramEmail.frame.origin.x, y: lblUpdate.frame.origin.y, width: 50, height: 30)
        self.paramUpdate.setOn(true, animated: true)        // 기본값 설정
        
        self.view.addSubview(self.paramUpdate)
        
        // 스위치 이벤트 연결
        self.paramUpdate.addTarget(self, action: #selector(swichOnClick(_:)), for: .valueChanged)
        
        //////////////////////////////////////////////////////
        
        // 갱신주기 스테퍼
        self.paramInterval = UIStepper()
        self.paramInterval.frame = CGRect(x: self.paramEmail.frame.origin.x, y: lblInterval.frame.origin.y, width: 50, height: 30)
        self.paramInterval.minimumValue = 0         // 최소값 설정
        self.paramInterval.maximumValue = 100       // 최대값 설정
        self.paramInterval.stepValue = 1            // 스테퍼의 값 변경 단위
        self.paramInterval.value = 0                // 기본값 설정
        
        self.view.addSubview(self.paramInterval)
        
        // 스테퍼 이벤트 연결
        self.paramInterval.addTarget(self, action: #selector(stepperOnClick(_:)), for: .valueChanged)
        
        //////////////////////////////////////////////////////
        
        // 자동갱신 텍스트
        self.txtUpdate = UILabel()
        self.txtUpdate.frame = CGRect(x: 250, y: self.paramUpdate.frame.origin.y, width: 100, height: 30)
        self.txtUpdate.font = UIFont.systemFont(ofSize: 12)
        self.txtUpdate.textColor = UIColor.red
        self.txtUpdate.text = "갱신함"
        
        self.view.addSubview(self.txtUpdate)
        
        //////////////////////////////////////////////////////
        
        // 갱신주기 텍스트
        
        self.txtInterval = UILabel()
        self.txtInterval.frame = CGRect(x: self.txtUpdate.frame.origin.x, y: self.paramInterval.frame.origin.y, width: 50, height: 30)
        self.txtInterval.font = UIFont.systemFont(ofSize: 12)
        self.txtInterval.textColor = .red
        self.txtInterval.text = "0초 마다"
        
        self.view.addSubview(self.txtInterval)
        
        //////////////////////////////////////////////////////
        
        // 전송 버튼 : 네비게이션 아이템에 추가, submit 메소드에 연결
        let submitBtn = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(submit(_:)))
        self.navigationItem.rightBarButtonItem = submitBtn
        
    }
    
    // 스위치와 상호반응할 액션 메소드
    @objc func swichOnClick(_ sender: UISwitch){
        self.txtUpdate.text = sender.isOn ? "갱신함" : "갱신 안함"
    }
    
    // 스테퍼와 상호반응할 액션 메소드
    @objc func stepperOnClick(_ sender: UIStepper){
        self.txtInterval.text = "\(Int(sender.value))초 마다"
    }
    
    // 전송 버튼과 상호반응할 액션 메소드
    @objc func submit(_ sender: Any){
        
        let rvc = ReadViewController()
        rvc.pEmail = self.paramEmail.text
        rvc.pUpdate = self.paramUpdate.isOn
        rvc.pInterval = self.paramInterval.value
        
        self.navigationController?.pushViewController(rvc, animated: true)
        
    }
    


}

