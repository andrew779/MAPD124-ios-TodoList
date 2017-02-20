//
//  Item.swift
//  MAPD124-TodoList
//
//  Created by Wenzhong Zheng on 2017-02-19.
//  Copyright © 2017 Wenzhong. All rights reserved.
//

import Foundation


class Item: NSObject {
    var id: String?
    var title: String?
    var detail: String?
    var dueDate: String?
    var remindDate: String?
    var complete: Bool = false
    
    override init() {
        super.init()
    }
    
    
    init(title:String,detail:String, dueDate: String, remindDate: String) {
        super.init()
        self.title = title
        self.detail = detail
        self.dueDate = dueDate
        self.remindDate = remindDate
    }
    
    func getDicValues() -> Dictionary<String, AnyObject> {
        
        let dictionary:[String:AnyObject] = ["title":self.title as AnyObject, "detail":self.detail as AnyObject, "dueDate":self.dueDate as AnyObject,"remindDate":self.remindDate as AnyObject, "complete":self.complete as AnyObject]
        
        return dictionary
        
    }
    
}
