//
//  Helper.swift
//  MAPD124-TodoList
//
//  Created by Wenzhong Zheng
//  SID: 300909195
//  Copyright © 2017 Wenzhong. All rights reserved.
//


import UIKit

// MARK: value formatting struct with self explained function name
struct Helper {
    let formatter = DateFormatter()
    
    static let getInstance = Helper()
    
    func formatFromDBValueToDate(string:String) -> String{
        
        formatter.dateFormat = "EEE, MMM d, yyyy hh:mm a"
        let date = Date(timeIntervalSince1970: Double(string)!)
        let finalDateValue = formatter.string(from: date)
        
        return finalDateValue
    }
    
    func formatFromDate(date:Date) -> String {
        formatter.dateFormat = "EEE, MMM d, yyyy hh:mm a"
        let finalDateValue = formatter.string(from: date)
        return finalDateValue
    }
    
}
