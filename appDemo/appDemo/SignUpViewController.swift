//
//  MyTableViewController.swift
//  appDemo
//
//  Created by StephenFang on 2021/3/18.
//

import Foundation
import UIKit

class SignUpViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIGestureRecognizerDelegate, UITextFieldDelegate {
   
    //MARK: -Subview
    var tableView = UITableView(frame: CGRect.zero, style: .plain)
    let searchBar = MySearchBar()
        
    //MARK: - Navigation Bar
    func navBar() {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.barStyle = .default
        navigationController?.interactivePopGestureRecognizer?.delegate = self
        navigationController?.interactivePopGestureRecognizer?.isEnabled = true
        
        let returnButton = UIButton(frame:CGRect(x:20-10, y:32-10, width:20+20, height:20+20))
        let returnBarButton = UIBarButtonItem(customView: returnButton)
        let titleLabel = UILabel(frame: CGRect.zero)
        
        returnButton.setImage(UIImage(named: "iconReturnBlack.png"), for: .normal)
        returnButton.contentMode = .center
        titleLabel.text = "Country and region"
        titleLabel.font = UIFont(name: "SFProText-Medium", size: 18)
      
        self.navigationItem.titleView = titleLabel
        self.navigationItem.leftBarButtonItems = [returnBarButton]
        
        returnButton.addTarget(self, action: #selector(returnAction), for: .touchUpInside)
    }

    //MARK: - Init
    func drawPage() {
        let page = UIView(frame: CGRect.zero)
        
        page.frame = self.view.bounds
        page.backgroundColor = .white
        tableView.backgroundColor = .white
        tableView.sectionIndexColor = UIColor(red: 187/255, green: 187/255, blue: 187/255, alpha: 1)
        UITableView.appearance().separatorStyle = .none

        view.addSubview(page)
        view.addSubview(tableView)
        view.addSubview(searchBar)
        
        searchBar.snp.makeConstraints { (make) in
            make.top.equalTo(topLayoutGuide.snp.bottom).offset(12)
            make.left.right.equalToSuperview()
            make.height.equalTo(36)
        }
        
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(topLayoutGuide.snp.bottom).offset(60)
            make.left.right.equalToSuperview()
            make.bottom.equalTo(bottomLayoutGuide.snp.top).offset(15)
        }
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.reloadData()
        
        searchBar.textField.delegate = self.searchBar
        searchBar.textField.addTarget(self, action: #selector(textFieldShouldBeginEditing(_:)), for: .editingDidBegin)
        searchBar.textField.addTarget(self, action: #selector(textFieldDidEndEditing(_:)), for: .editingDidEnd)
        searchBar.textField.addTarget(self, action: #selector(textFiledEditingChanged(_:)), for: .editingChanged)
    }
    
    //MARK:- UIButton Event
    @objc func returnAction() {
        self.navigationController?.popViewController(animated: true)
    }
    
    //MARK: - TF Delegate
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        self.tableView.reloadData()
        return true
    }
    
    @objc func textFiledEditingChanged(_ textField: UITextField) {
        self.tableView.reloadData()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.tableView.reloadData()
    }

    //MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellid = "CellID"
        var cell: MyTableViewCell? = tableView.dequeueReusableCell(withIdentifier: cellid) as? MyTableViewCell
        if (cell == nil) {
            cell = MyTableViewCell(style: .subtitle, reuseIdentifier: cellid)
        }
        
        if searchBar.isActive() {
            if indexPath.row < searchBar.searchResult.count {
                cell?.cellLabel.text = searchBar.searchResult[indexPath.row]
            }
        } else {
            cell?.cellLabel.text = MyCountryData().countryData[MyCountryData().keys[indexPath.section]]?[indexPath.row]
        }
        return cell!
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchBar.isActive() { return searchBar.searchResult.count }
        return MyCountryData().countryData[MyCountryData().keys[section]]!.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if searchBar.isActive() { return 1 }
        return MyCountryData().keys.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if searchBar.isActive() { return nil }
        return MyCountryData().keys[section]
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        if searchBar.isActive() { return [] }
        return MyCountryData().keys
    }
    
    //MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
           return 48
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if searchBar.isActive() {
            print("Country: " + searchBar.searchResult[indexPath.row])
        } else {
            print("Country: " + MyCountryData().countryData[MyCountryData().keys[indexPath.section]]![indexPath.row])
        }
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
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
}
