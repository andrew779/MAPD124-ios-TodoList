//
//  CustomAlertViewController.swift
//  MAPD124-TodoList
//
//  Created by Wenzhong Zheng
//  SID: 300909195
//  Copyright © 2017 Wenzhong. All rights reserved.
//


import UIKit

class CustomAlertViewController: UIAlertController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    func myOKAlert(title:String, message:String) {
        self.title = title
        self.message = message
        let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
        self.addAction(ok)
    }

}
