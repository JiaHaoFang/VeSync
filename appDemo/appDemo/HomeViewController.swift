//
//  ViewController.swift
//  appDemo
//
//  Created by StephenFang on 2021/3/17.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {
    
    //MARK: - Subviews
    let signUpButton = MyButton(buttonTitle: "Sign Up", inHome: true)
    let logInButton = MyButton(buttonTitle: "Log In", inHome: true)
   
    //MARK: - Draw
    func drawPage() {
        let page = UIView()
        let VeSyncIcon = UIImageView()
        let welcomeLabel = UILabel()
        let welcomeInfoLabel = UILabel()
        
        page.frame = self.view.bounds
        page.backgroundColor = UIColor.init(red: 0, green: 14/255, blue: 30/255, alpha: 1)
        VeSyncIcon.image = UIImage(named: "vesyncLogo01.png")
        welcomeLabel.text = "Welcome to VeSync"
        welcomeLabel.font = UIFont(name: "SFProText-Bold", size: 18)
        welcomeLabel.textColor = .white
        welcomeInfoLabel.text = "Upgrade your home by transforming it into a fully connected smart home with VeSync."
        welcomeInfoLabel.font = UIFont(name: "SFProText-Regular", size: 14)
        welcomeInfoLabel.textColor = .white
        welcomeInfoLabel.textAlignment = .center
        welcomeInfoLabel.numberOfLines = 0
        welcomeInfoLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        
        self.view.addSubview(page)
        self.view.addSubview(VeSyncIcon)
        self.view.addSubview(welcomeLabel)
        self.view.addSubview(welcomeInfoLabel)
        
        page.snp.makeConstraints{ (make) in
            make.left.right.equalToSuperview()
            make.top.bottom.equalToSuperview()
        }
        VeSyncIcon.snp.makeConstraints{ (make) in
            make.centerX.equalTo(view.snp.centerX)
            make.top.equalTo(topLayoutGuide.snp.bottom).offset(46)
        }
        welcomeLabel.snp.makeConstraints{ (make) in
            make.width.equalTo(180)
            make.height.equalTo(21.5)
            make.centerX.equalTo(view.snp.centerX)
            make.top.equalTo(topLayoutGuide.snp.bottom).offset(119)
        }
        welcomeInfoLabel.snp.makeConstraints{ (make) in
            make.centerX.equalTo(view.snp.centerX)
            make.width.equalTo(295)
            make.height.equalTo(42)
            make.top.equalTo(topLayoutGuide.snp.bottom).offset(148.5)
        }
    }
    
    //MARK: - UIButton
    func signUp() {
        signUpButton.button.addTarget(self, action: #selector(signUpAction), for: .touchUpInside)
        self.view.addSubview(signUpButton)
        signUpButton.snp.makeConstraints{ (make) in
            make.left.equalToSuperview().offset(40)
            make.right.equalToSuperview().offset(-40)
            make.height.equalTo(44)
            make.bottom.equalTo(bottomLayoutGuide.snp.top).offset(-92)
        }
    }
    
    func logIn() {
        logInButton.button.addTarget(self, action: #selector(logInAction), for: .touchUpInside)
        self.view.addSubview(logInButton)
        logInButton.snp.makeConstraints{ (make) in
            make.left.equalToSuperview().offset(40)
            make.right.equalToSuperview().offset(-40)
            make.height.equalTo(44)
            make.bottom.equalTo(bottomLayoutGuide.snp.top).offset(-32)
        }
    }
    
    func navBar() {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.barStyle = .black
    }
    
    //MARK: - UIButton Event
    @objc func signUpAction() {
        print("[Sign Up]")
        let signUpVC = SignUpViewController();
        self.navigationController?.pushViewController(signUpVC,animated: true);
    }
    
    @objc func logInAction() {
        print("[Login ing]")
        let loginVC = LogInViewController();
        self.navigationController?.pushViewController(loginVC,animated: true);
    }

    //MARK: - LifeCycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.barStyle = .black
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navBar()
        drawPage()
        signUp()
        logIn()
    }
}
