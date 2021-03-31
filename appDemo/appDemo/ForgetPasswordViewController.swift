//
//  ForgetPasswordViewController.swift
//  appDemo
//
//  Created by StephenFang on 2021/3/17.
//

import UIKit
import SnapKit

class ForgetPasswordViewController: UIViewController, UITextFieldDelegate, UIGestureRecognizerDelegate {
    
    //MARK: - SubViews
    let usernameTextField = MyTextField(tfTitle: "Email", ispassword: false)
    let submitButton = MyButton(buttonTitle: "Submit", inHome: false)
    
    //MARK: - Draw
    func drawPage() {
        let page = UIButton()
        let forgetLabel = UILabel()
        let forgetInfoLabel = UILabel()
        
        page.frame = self.view.bounds
        page.backgroundColor = UIColor.white
        forgetLabel.text = "Forgot your password?"
        forgetLabel.font = UIFont(name: "SFProDisplay-Bold", size: 28)
        forgetLabel.textColor = UIColor.init(red: 51/255, green: 51/255, blue: 51/255, alpha: 1)
        forgetInfoLabel.text = "Enter your email and we'll help you out."
        forgetInfoLabel.font = UIFont(name: "SFProText-Regular", size: 15)
        forgetInfoLabel.textColor = UIColor.init(red: 102/255, green: 102/255, blue: 102/255, alpha: 1)
        
        self.view.addSubview(page)
        self.view.addSubview(forgetLabel)
        self.view.addSubview(forgetInfoLabel)
        
        page.snp.makeConstraints{ (make) in
            make.left.right.equalToSuperview()
            make.top.bottom.equalToSuperview()
        }
        forgetLabel.snp.makeConstraints{ (make) in
            make.width.equalTo(319)
            make.height.equalTo(33.5)
            make.left.equalToSuperview().offset(28)
            make.top.equalTo(topLayoutGuide.snp.bottom).offset(20)
        }
        forgetInfoLabel.snp.makeConstraints{ (make) in
            make.width.equalTo(319)
            make.height.equalTo(18)
            make.left.equalToSuperview().offset(28)
            make.top.equalTo(topLayoutGuide.snp.bottom).offset(61.5)
        }
        
        page.addTarget(self, action: #selector(backgroundAction), for: .touchUpInside)
    }
    
    //MARK: - UITextField
    func userName() {
        self.view.addSubview(usernameTextField)
        usernameTextField.snp.makeConstraints{ (make) in
            make.left.right.equalToSuperview()
            make.height.equalTo(60)
            make.top.equalTo(topLayoutGuide.snp.bottom).offset(103.5)
        }
        
        usernameTextField.textField.addTarget(self, action: #selector(textFiledEditingChanged(_:)), for: .editingChanged)
    }
    
    //MARK: - UIButton
    func submit() {
        self.view.addSubview(submitButton)
        self.submitButton.snp.makeConstraints{ (make) in
            make.left.equalToSuperview().offset(28)
            make.right.equalToSuperview().offset(-28)
            make.height.equalTo(44)
            make.top.equalTo(topLayoutGuide.snp.bottom).offset(191.5)
        }
        
        submitButton.button.addTarget(self, action: #selector(submitButtonAction), for: .touchUpInside)
    }
    
    //MARK: - NavigationBar
    func navBar() {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.barStyle = .default
        navigationController?.interactivePopGestureRecognizer?.delegate = self
        navigationController?.interactivePopGestureRecognizer?.isEnabled = true
        
        let returnButton = UIButton(frame:CGRect(x:20-10, y:32-10, width:20+20, height:20+20))
        let returnBarButton = UIBarButtonItem(customView: returnButton)
        
        returnButton.setImage(UIImage(named: "iconReturnBlack.png"), for: .normal)
        returnButton.contentMode = .center
      
        self.navigationItem.leftBarButtonItems = [returnBarButton]
        
        returnButton.addTarget(self, action: #selector(returnAction), for: .touchUpInside)
    }
    
    //MARK: - UIButton Event
    @objc func backgroundAction() {
        self.view.endEditing(true)
    }
    
    @objc func returnAction() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func submitButtonAction() {
        guard (usernameTextField.textField.text?.isEmpty == false) else {
            print("Please enter your email address ...")
            return
        }
        guard (usernameTextField.check() == true) else {
            print("Please check your username and password!")
            return
        }
        print("[Submit]")
    }
    
    //MARK: - Delegate Event
    @objc func textFiledEditingChanged(_ textField: UITextField) {
        if (self.usernameTextField.check() == true) {
            submitButton.clickState(true)
        } else {
            submitButton.clickState(false)
        }
        return
    }
    
    //MARK: - LifeStyle
    override func viewDidLoad() {
        super.viewDidLoad()
        navBar()
        drawPage()
        userName()
        submit()
    }
}
