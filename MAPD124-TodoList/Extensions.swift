//
//  Extensions.swift
//  MAPD124-TodoList
//
//  Created by Wenzhong Zheng
//  SID: 300909195
//  Copyright © 2017 Wenzhong. All rights reserved.
//


import UIKit

//planing to make custom delete icon button for tableview, however, doesn't work currently
class MyTableViewRowAction: UITableViewRowAction {
    var image: UIImage?
    func _setButton(button:UIButton) {
        if let image = image, let titleLabel = button.titleLabel {
            let labelString = NSString(string: titleLabel.text!)
            let titleSize = labelString.size(attributes: [NSFontAttributeName: titleLabel.font])
            
            button.tintColor = UIColor.white
            button.setImage(image.withRenderingMode(.alwaysTemplate), for: .normal)
            button.imageEdgeInsets.right = -titleSize.width
        }
    }
}

extension DateFormatter {
    func myFormatStyle() -> String {
        return "EEE, MMM d, yyyy hh:mm a"
    }
}
