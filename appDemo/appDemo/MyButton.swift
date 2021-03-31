//
//  MyButton.swift
//  appDemo
//
//  Created by StephenFang on 2021/3/17.
//

import Foundation
import UIKit
import SnapKit

//MARK: -MyButton Class
class MyButton: UIView{
    
    // MARK: - Subviews
    let button = UIButton()
    var title: String?
    var isClickable: Bool?
    
    //MARK: - Init button
    @objc init(buttonTitle: String, inHome: Bool) {
        super.init(frame: CGRect.zero)
        title = buttonTitle
        isClickable = false
        
        button.layer.cornerRadius = 12
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = UIFont(name: "SFProText-Medium", size: CGFloat(16))
        
        if (inHome == true) {
            isClickable = true
            if (title == "Sign Up") {
                button.backgroundColor = MyColor().light
            } else if (title == "Log In") {
                button.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
            }
        } else {
            button.backgroundColor = MyColor().buttongray
        }
                 
        self.addSubview(button)
        
        button.snp.makeConstraints{ (make) in
            make.left.right.equalToSuperview().offset(0)
            make.height.equalTo(44)
            make.top.equalToSuperview().offset(0)
        }
        
        self.button.addTarget(self, action: #selector(clickAction), for: .touchUpInside)
    }
    
    //MARK: - State
    func clickState(_ isReady: Bool) {
        isClickable = isReady
        if (isClickable == true) {
            button.backgroundColor = MyColor().light
        } else {
            button.backgroundColor = MyColor().buttongray
        }
    }
    
    //MARK: - UIButton Event
    @objc func clickAction() {
        guard (isClickable == true) else { return }
    }
    
    //MARK: - LifeCycle
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
    }
    
}

