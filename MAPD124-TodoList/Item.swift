//
//  Item.swift
//  MAPD124-TodoList
//
//  Created by Wenzhong Zheng
//  SID: 300909195
//  Copyright © 2017 Wenzhong. All rights reserved.
//


import Foundation
import FirebaseDatabase

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
    
    init(snapshot: FIRDataSnapshot){
        id = snapshot.key
        let snapshotValue = snapshot.value as! [String: AnyObject]
        title = snapshotValue["title"] as? String
        detail = snapshotValue["detail"] as? String
        dueDate = snapshotValue["dueDate"] as? String
        remindDate = snapshotValue["remindDate"] as? String
        complete = snapshotValue["complete"] as! Bool
    }
    
    init(dic: Dictionary<String, String> ){
        title = dic["title"]
        detail = dic["detail"]
        dueDate = dic["dueDate"]
        remindDate = dic["remindDate"]
    }
    
    func getDicValues() -> Dictionary<String, AnyObject> {
        
        let dictionary:[String:AnyObject] = ["title":self.title as AnyObject, "detail":self.detail as AnyObject, "dueDate":self.dueDate as AnyObject,"remindDate":self.remindDate as AnyObject, "complete":self.complete as AnyObject]
        
        return dictionary
        
    }
    
}
