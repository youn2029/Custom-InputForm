//
//  ReadViewController.swift
//  Custom-InputForm
//
//  Created by 윤성호 on 08/04/2019.
//  Copyright © 2019 윤성호. All rights reserved.
//

import UIKit

class ReadViewController: UIViewController {
    
    // 전달받을 값
    var pEmail: String?
    var pUpdate: Bool?
    var pInterval: Double?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 루트 뷰 배경색 설정
        self.view.backgroundColor = .white
        
        //////////////////////////////////////////////////////
        
        // 라이브러리 초기화
        let lblEmail = UILabel()
        let lblUpdate = UILabel()
        let lblInterval = UILabel()
        
        // 위치 & 크기 설정
        lblEmail.frame = CGRect(x: 50, y: 100, width: 300, height: 30)
        lblUpdate.frame = CGRect(x: 50, y: 150, width: 300, height: 30)
        lblInterval.frame = CGRect(x: 50, y: 200, width: 300, height: 30)
        
        // 텍스트 설정
        lblEmail.text = self.pEmail == "" ? "이메일이 없습니다." : "이메일 : \(self.pEmail!)"
        lblUpdate.text = self.pUpdate == true ? "갱신함" : "갱신 안함"
        lblInterval.text = "\(Int(self.pInterval!))초 마다 갱신"
        
        // 루트 뷰에 추가
        self.view.addSubview(lblEmail)
        self.view.addSubview(lblUpdate)
        self.view.addSubview(lblInterval)
        
        
    }
}
