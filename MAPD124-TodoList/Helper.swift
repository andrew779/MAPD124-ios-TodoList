//
//  Helper.swift
//  MAPD124-TodoList
//
//  Created by Wenzhong Zheng on 2017-02-20.
//  Copyright © 2017 Wenzhong. All rights reserved.
//

import UIKit

struct Helper {
    
    static let getInstance = Helper()
    
    func formatFromDBValueToDate(string:String) -> String{
        let formatter = DateFormatter()
        formatter.dateFormat = "EEE, MMM d, yyyy hh:mm a"
        let date = Date(timeIntervalSince1970: Double(string)!)
        let finalDateValue = formatter.string(from: date)
        
        return finalDateValue
    }
    
}
