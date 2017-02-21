//
//  CheckBox.swift
//  MAPD124-TodoList
//
//  Created by Wenzhong Zheng
//  SID: 300909195
//  Copyright © 2017 Wenzhong. All rights reserved.
//


import UIKit

// MARK: since iOS doesn't have checkBox so I made my own custom checkbox
class CheckBox: UIButton {

    let checkedImage = #imageLiteral(resourceName: "Checked-white")
    let uncheckedImage = #imageLiteral(resourceName: "Unchecked-white")
    
    var isChecked:Bool = false {
        didSet {
            if self.isChecked {
                self.setImage(checkedImage, for: .normal)
            } else {
                self.setImage(uncheckedImage, for: .normal)
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
