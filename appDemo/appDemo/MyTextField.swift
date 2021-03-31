//
//  MyTextField.swift
//  appDemo
//
//  Created by StephenFang on 2021/3/17.
//

import Foundation
import UIKit
import SnapKit

//MARK: - MyTextField Class
class MyTextField: UIView, UITextFieldDelegate{
    
    //MARK: - Subviews
    let textField = UITextField()
    let icon = UIImageView()
    let line = UIView()
    let eyeButton = UIButton()
    
    //MARK: - Configure
    var name: String?
    var isPassword: Bool?
    var editState: Bool?
        
    //MARK: - Init TextField
    @objc init(tfTitle: String, ispassword: Bool) {
        super.init(frame: CGRect.zero)
        name = tfTitle
        isPassword = ispassword
        editState = false
        
        textField.placeholder = name
        textField.tintColor = MyColor().light
        textField.borderStyle = UITextField.BorderStyle.none
        textField.textAlignment = NSTextAlignment.left
        textField.clearButtonMode = .whileEditing
        textField.keyboardType = UIKeyboardType.default
        textField.isSecureTextEntry = isPassword ?? false
        if (isPassword == false) { textField.becomeFirstResponder() }
        icon.image = UIImage(named: "icon" + (name ?? " ") + ".png")
        line.backgroundColor = MyColor().linegray
    
        self.addSubview(textField)
        self.addSubview(icon)
        self.addSubview(line)
        
        textField.snp.makeConstraints{ (make) in
            make.height.equalTo(60)
            make.left.equalToSuperview().offset(56)
            make.right.equalToSuperview().offset(-28 + (isPassword! ? -40 : 0))
            make.top.equalToSuperview().offset(0)
        }
        icon.snp.makeConstraints{ (make) in
            make.left.equalToSuperview().offset(28)
            make.top.equalToSuperview().offset(22)
        }
        line.snp.makeConstraints{ (make) in
            make.height.equalTo(2)
            make.left.equalToSuperview().offset(28)
            make.right.equalToSuperview().offset(-28)
            make.top.equalToSuperview().offset(60 - 2)
        }
        textField.delegate = self
        textField.addTarget(self, action: #selector(textFiledEditingChanged(_:)), for: .editingChanged)
        
        if (isPassword == true) { addEyeButton() }
    }
    
    //MARK: - EyeButton
    func addEyeButton() {
        eyeButton.setImage(UIImage(named: "iconInvisible.png"), for: .normal)
        
        self.addSubview(eyeButton)
        
        eyeButton.snp.makeConstraints{ (make) in
            make.right.equalToSuperview().offset(-28)
            make.top.equalToSuperview().offset(20)
        }
        
        eyeButton.addTarget(self, action: #selector(eyesButtonAction), for: .touchUpInside)
    }
    
    //MARK: - UIButton Event
    @objc func eyesButtonAction() {
        self.textField.isSecureTextEntry = !(self.textField.isSecureTextEntry)
        if (self.textField.isSecureTextEntry == true) {
            eyeButton.setImage(UIImage(named: "iconInvisible.png"), for: .normal)
        }
        
        if (self.textField.isSecureTextEntry == false) {
            eyeButton.setImage(UIImage(named: "iconVisible.png"), for: .normal)
        }
    }
    
    //MARK: - Delegate
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        self.line.backgroundColor = MyColor().light
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.line.backgroundColor = MyColor().linegray
        self.textField.resignFirstResponder()
    }
        
    @objc func textFiledEditingChanged(_ textField: UITextField) {
        self.textField.text = textField.text
        print(name! + ": " + (textField.text ?? "No Imput"))
    }
    
    //MARK: - jiekou
    func userInput() -> String? {
        return textField.text
    }
    
    //MARK: - Check Logic
    func check() -> Bool {
        var flag: Bool = false
        if (isPassword! == true) {
            flag = checkPassword()
        } else if (isPassword! == false) {
            flag = checkUsername()
        }
        return flag
    }
    
    func checkUsername() -> Bool {
        guard (textField.text?.isEmpty != true) else { return false }
        
        let mailPattern = "^([a-z0-9A-Z_\\.-]+)@([\\da-z\\.-]+)\\.([a-z\\.]{2,6})$"
        let matcher = MyRegex (mailPattern)
        if (matcher.match(textField.text!))
        { return true }
        else { return false }
    }
    
    func checkPassword() -> Bool {
        guard (textField.text?.isEmpty != true) else { return false }
        
        let psw_count = textField.text?.count ?? 0
        if (psw_count >= 6)
        { return true }
        else { return false }
    }
    
    //MARK: - LifeCycle
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
    }
}

