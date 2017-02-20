//
//  ListCell.swift
//  MAPD124-TodoList
//
//  Created by Wenzhong Zheng on 2017-02-10.
//  Copyright © 2017 Wenzhong. All rights reserved.
//

import UIKit

class ListCell: UITableViewCell {
    
    let mSwitch: UISwitch = {
        let sw = UISwitch()
        sw.translatesAutoresizingMaskIntoConstraints = false
        return sw
    }()
    
    lazy var checkBox:CheckBox = {
        let cb = CheckBox()
        cb.isChecked = false
        
        cb.addTarget(self, action: #selector(self.handleCheckBoxClicked(_:)), for: .touchUpInside)
        cb.translatesAutoresizingMaskIntoConstraints = false
        return cb
    }()
    
    func handleCheckBoxClicked (_ sender:UIButton){
        let cb = sender as! CheckBox
        if cb.isChecked {
            cb.isChecked = false
        } else {
            cb.isChecked = true
        }
        
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        textLabel?.frame = CGRect(x: 74, y: textLabel!.frame.origin.y - 2, width: textLabel!.frame.width, height: textLabel!.frame.height)
        detailTextLabel?.frame = CGRect(x: 74, y: detailTextLabel!.frame.origin.y + 2, width: detailTextLabel!.frame.width, height: detailTextLabel!.frame.height)
        
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        
        //        addSubview(mSwitch)
        addSubview(checkBox)
        
        //need x,y,w,h anchors
        checkBox.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16).isActive = true
        checkBox.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        checkBox.widthAnchor.constraint(equalToConstant: 24).isActive = true
        checkBox.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
