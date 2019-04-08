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
        lblUpdate.frame = CGRect(x: 30, y: 150, width: 100, height: 30)
        lblUpdate.text = "자동 갱신"
        lblUpdate.font = UIFont.systemFont(ofSize: 14)
        
        self.view.addSubview(lblUpdate)
        
        //////////////////////////////////////////////////////
        
        // 갱신주기 Label
        let lblInterval = UILabel()
        lblInterval.frame = CGRect(x: 30, y: 200, width: 100, height: 30)
        lblInterval.text = "갱신주기"
        lblInterval.font = UIFont.systemFont(ofSize: 14)
        
        self.view.addSubview(lblInterval)
        
        //////////////////////////////////////////////////////
        
        // 이메일 텍스트 필드
        self.paramEmail = UITextField()
        self.paramEmail.frame = CGRect(x: 120, y: 100, width: 220, height: 30)
        self.paramEmail.borderStyle = UITextField.BorderStyle.roundedRect
        self.paramEmail.font = UIFont.systemFont(ofSize: 13)
        self.paramEmail.placeholder = "이메일을 입력해주세요"
//        self.paramEmail.adjustsFontSizeToFitWidth = true        // 입력된 문자열의 폰트 사이즈를 텡스트 필드의 너비에 맞게 자동 조절 (fontsize가 설정되지 않았을 때)
        
        self.view.addSubview(self.paramEmail)
        
        //////////////////////////////////////////////////////
        
        // 자동갱신 스위치
        self.paramUpdate = UISwitch()
        self.paramUpdate.frame = CGRect(x: 120, y: 150, width: 50, height: 30)
        self.paramUpdate.setOn(true, animated: true)        // 기본값 설정
        
        self.view.addSubview(self.paramUpdate)
        
        //////////////////////////////////////////////////////
        
        // 갱신주기 스테퍼
        self.paramInterval = UIStepper()
        self.paramInterval.frame = CGRect(x: 120, y: 200, width: 50, height: 30)
        self.paramInterval.minimumValue = 0         // 최소값 설정
        self.paramInterval.maximumValue = 100       // 최대값 설정
        self.paramInterval.stepValue = 1            // 스테퍼의 값 변경 단위
        self.paramInterval.value = 0                // 기본값 설정
        
        self.view.addSubview(self.paramInterval)
        
        
    }
    


}

