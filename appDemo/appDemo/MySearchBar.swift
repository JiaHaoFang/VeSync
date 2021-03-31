//
//  MySearchBar.swift
//  appDemo
//
//  Created by StephenFang on 2021/3/30.
//

import Foundation
import UIKit
import SnapKit

//MARK: - My SearchBar
class MySearchBar: UIView, UITextFieldDelegate {
    
    //MARK: - Subviews
    let grayBackground = UIView()
    let textField = UITextField()
    let cancelButton = UIButton()
    let iconSearchGray = UIImageView()
    
    //MARK: - Configure
    var rightConstraint: Constraint?
    var isSelected: Bool? {
        didSet { setPosition() }
    }
    
    //MARK: - Data
    var searchResult:[String] = []
    
    //MARK: - Init
    @objc init() {
        super.init(frame: CGRect.zero)
        
        isSelected = false

        grayBackground.backgroundColor = MyColor().searchgray
        grayBackground.layer.cornerRadius = 12
        grayBackground.layer.masksToBounds = true
        
        iconSearchGray.image = UIImage(named: "iconSearchGray")
        
        textField.placeholder = "Search"
        textField.tintColor = MyColor().light
        textField.borderStyle = UITextField.BorderStyle.none
        textField.textAlignment = NSTextAlignment.left
        textField.clearButtonMode = .whileEditing
        textField.keyboardType = UIKeyboardType.default
        textField.font = UIFont(name: "SFProText-Regular", size: 14)
        
        cancelButton.setTitle("Cancel", for: .normal)
        cancelButton.titleLabel?.font = UIFont(name: "SFProText-Regular", size: 14)
        cancelButton.backgroundColor = UIColor.clear
        cancelButton.setTitleColor(.black, for: .normal)
        
        self.addSubview(cancelButton)
        self.addSubview(grayBackground)
        self.grayBackground.addSubview(iconSearchGray)
        self.grayBackground.addSubview(textField)
        
        setPosition()
        
        cancelButton.snp.makeConstraints{ (make) in
            make.top.equalToSuperview().offset(8)
            make.height.equalTo(20)
            make.width.equalTo(45.5)
            make.right.equalToSuperview().offset(-20)
        }
        
        grayBackground.snp.makeConstraints{ (make) in
            make.height.equalTo(36)
            make.top.equalToSuperview()
            make.left.equalToSuperview().offset(20)
            rightConstraint = make.right.equalToSuperview().offset(-20).constraint
        }

        iconSearchGray.snp.makeConstraints{ (make) in
            make.top.equalToSuperview().offset(10)
            make.left.equalToSuperview().offset(12)
        }

        textField.snp.makeConstraints{ (make) in
            make.height.equalTo(20)
            make.top.equalToSuperview().offset(8)
            make.left.equalToSuperview().offset(36)
            make.right.equalToSuperview().offset(-10)
        }
                    
        textField.delegate = self
        textField.addTarget(self, action: #selector(textFiledEditingChanged(_:)), for: .editingChanged)
        cancelButton.addTarget(self, action: #selector(clickAction), for: .touchUpInside)
    }
    
    //MARK: - Logic
    func setPosition() {
        if (isSelected == false) {
            self.rightConstraint?.update(offset: -20)
        } else {
            rightConstraint?.update(offset: -77.5)
        }
    }
    
    func search() {
        searchResult.removeAll()
        for key in MyCountryData().keys {
            for value in MyCountryData().countryData[key]! {
                if (value.contains(textField.text!)) {
                    searchResult.append(value)
                }
            }
        }
    }
    
    func isActive() -> Bool{
        return isSelected ?? false
    }
    
    //MARK: - TF Delegate
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        isSelected = true
        return true
    }
    
    @objc func textFiledEditingChanged(_ textField: UITextField) {
        self.textField.text = textField.text
        search()
    }
        
    //MARK: - Button Event
    @objc func clickAction() {
        isSelected = false
        self.textField.text = nil
        searchResult.removeAll()
        self.textField.resignFirstResponder()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
