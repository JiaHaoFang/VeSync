//
//  MyTableViewCell.swift
//  appDemo
//
//  Created by StephenFang on 2021/3/18.
//

import Foundation
import UIKit
import SnapKit

class MyTableViewCell: UITableViewCell {
    let cellLabel = UILabel(frame: CGRect.zero)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        cellLabel.backgroundColor = .clear
        cellLabel.font = UIFont(name: "SFProText-Regular", size: 16)
        cellLabel.textAlignment = .left
        self.selectedBackgroundView = UIView(frame: cellLabel.frame);
        self.selectedBackgroundView?.backgroundColor = UIColor(red: 241/255, green: 241/255, blue: 241/255, alpha: 1)
        
        contentView.addSubview(cellLabel)
        
        cellLabel.snp.makeConstraints{ (make) in
            make.left.equalToSuperview().offset(20)
            make.height.equalTo(19)
            make.top.equalToSuperview().offset(14.5)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
