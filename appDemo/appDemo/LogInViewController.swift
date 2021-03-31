//
//  LoginViewController.swift
//  appDemo
//
//  Created by StephenFang on 2021/3/17.
//

import Foundation
import UIKit
import SnapKit

class LogInViewController: UIViewController, UITextFieldDelegate, UIGestureRecognizerDelegate{

    //MARK: - Subviews
    let usernameTextField = MyTextField(tfTitle: "Email", ispassword: false)
    let passwordTextField = MyTextField(tfTitle: "Password", ispassword: true)
    let logInButton = MyButton(buttonTitle: "Log In", inHome: false)
    
    //MARK: - Draw
    func drawPage() {
        let page = UIButton()
        let logInLabel = UILabel()
        
        page.frame = self.view.bounds
        page.backgroundColor = UIColor.white
        logInLabel.text = "Log In"
        logInLabel.font = UIFont(name: "SFProDisplay-Bold", size: 28)
        
        self.view.addSubview(page)
        self.view.addSubview(logInLabel)
        
        page.snp.makeConstraints{ (make) in
            make.left.right.equalToSuperview()
            make.top.bottom.equalToSuperview()
        }
        logInLabel.snp.makeConstraints{ (make) in
            make.left.equalToSuperview().offset(28)
            make.width.equalTo(319)
            make.height.equalTo(33.5)
            make.top.equalTo(topLayoutGuide.snp.bottom).offset(20)
        }
        
        page.addTarget(self, action: #selector(backgroundAction), for: .touchUpInside)
    }
    
    //MARK: - UITextField
    func userName() {
        self.view.addSubview(usernameTextField)
        usernameTextField.snp.makeConstraints{ (make) in
            make.left.right.equalToSuperview()
            make.height.equalTo(60)
            make.top.equalTo(topLayoutGuide.snp.bottom).offset(77.5)
        }
        
        usernameTextField.textField.addTarget(self, action: #selector(textFiledEditingChanged(_:)), for: .editingChanged)
    }
    
    func passWord() {
        self.view.addSubview(passwordTextField)
        passwordTextField.snp.makeConstraints{ (make) in
            make.left.right.equalToSuperview()
            make.height.equalTo(60)
            make.top.equalTo(topLayoutGuide.snp.bottom).offset(149.5)
        }
        
        passwordTextField.textField.addTarget(self, action: #selector(textFiledEditingChanged(_:)), for: .editingChanged)
    }

    //MARK: - UIButton
    func logIn() {
        self.view.addSubview(logInButton)
        
        logInButton.snp.makeConstraints{ (make) in
            make.left.equalToSuperview().offset(28)
            make.right.equalToSuperview().offset(-28)
            make.height.equalTo(44)
            make.top.equalTo(topLayoutGuide.snp.bottom).offset(266.5)
        }
        
        logInButton.button.addTarget(self, action: #selector(logInButtonAction), for: .touchUpInside)
    }
    
    func forgetPassword() {
        let forgetPasswordButton = UIButton()
        forgetPasswordButton.setTitle("Forget password?", for: .normal)
        forgetPasswordButton.backgroundColor = UIColor.clear
        forgetPasswordButton.setTitleColor(MyColor().light, for: .normal)
        forgetPasswordButton.titleLabel?.adjustsFontSizeToFitWidth = true
        
        self.view.addSubview(forgetPasswordButton)
        forgetPasswordButton.snp.makeConstraints{ (make) in
            make.width.equalTo(121)
            make.height.equalTo(17)
            make.right.equalToSuperview().offset(-28)
            make.top.equalTo(topLayoutGuide.snp.bottom).offset(221.5)
        }
        
        forgetPasswordButton.addTarget(self, action: #selector(forgetPasswordAction), for: .touchUpInside)
    }
    
    //MARK: - NAvigationBar
    func navBar() {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.barStyle = .default
        navigationController?.interactivePopGestureRecognizer?.delegate = self
        navigationController?.interactivePopGestureRecognizer?.isEnabled = true
        
        let signUpButton = UIButton(frame:CGRect(x:294.5, y:32.5, width:60.5, height:19))
        let signUpBarButton = UIBarButtonItem(customView: signUpButton)
        let returnButton = UIButton(frame:CGRect(x:20-10, y:32-10, width:20+20, height:20+20))
        let returnBarButton = UIBarButtonItem(customView: returnButton)
        
        signUpButton.setTitle("Sign Up", for: .normal)
        signUpButton.backgroundColor = UIColor.clear
        signUpButton.setTitleColor(MyColor().light, for: .normal)
        returnButton.setImage(UIImage(named: "iconReturnBlack.png"), for: .normal)
        returnButton.contentMode = .center

        self.navigationItem.rightBarButtonItems = [signUpBarButton]
        self.navigationItem.leftBarButtonItems = [returnBarButton]
        
        signUpButton.addTarget(self, action: #selector(signUpButtonAction), for: .touchUpInside)
        returnButton.addTarget(self, action: #selector(returnAction), for: .touchUpInside)
    }

    //MARK: - UIButton Events
    @objc func backgroundAction() {
        self.view.endEditing(true)
    }
    
    @objc func logInButtonAction() {
        if (usernameTextField.check() && passwordTextField.check()) {
            print("[Login]")
            return
        }
        print("Please check your username and password!")
    }

    @objc func signUpButtonAction() {
        print("[Sign Up]")
        let signUpVC = SignUpViewController();
        self.navigationController?.pushViewController(signUpVC,animated: true);
    }
        
    @objc func forgetPasswordAction() {
        print("[Forget Password]")
        let fgtPswVC = ForgetPasswordViewController();
        self.navigationController?.pushViewController(fgtPswVC,animated: true);
    }
    
    @objc func returnAction() {
        self.navigationController?.popViewController(animated: true)
    }
    
    //MARK: - Delegate Event
    @objc func textFiledEditingChanged(_ textField: UITextField) {
        guard (self.usernameTextField.check() == true) else {
            logInButton.clickState(false)
            return
        }
        guard (self.passwordTextField.check() == true) else {
            logInButton.clickState(false)
            return
        }
        logInButton.clickState(true)
        return
    }
        
    //MARK: - LifeStyle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.barStyle = .default
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navBar()
        drawPage()
        userName()
        passWord()
        forgetPassword()
        logIn()
    }
}
