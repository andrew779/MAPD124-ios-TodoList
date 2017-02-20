//
//  Item.swift
//  MAPD124-TodoList
//
//  Created by Wenzhong Zheng on 2017-02-19.
//  Copyright © 2017 Wenzhong. All rights reserved.
//

import Foundation


class Item: NSObject {
    
    var title: String?
    var detail: String?
    var dueDate: NSNumber?
    var remindDate: NSNumber?
    var complete: Bool = false
    
    override init() {
        super.init()
    }
    
    
    init(title:String,detail:String, dueDate: NSNumber, remindDate: NSNumber) {
        super.init()
        self.title = title
        self.detail = detail
        self.dueDate = dueDate
        self.remindDate = remindDate
    }
    
}
