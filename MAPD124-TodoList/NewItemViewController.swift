//
//  NewItemViewController.swift
//  MAPD124-TodoList
//
//  Created by Wenzhong Zheng on 2017-02-19.
//  Copyright © 2017 Wenzhong. All rights reserved.
//

import UIKit

class NewItemViewController: UIViewController {

    let newItemForm:NewItemForm = {
        let v = NewItemForm()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: nil)
        navigationController?.navigationBar.isTranslucent = false
        setupNewItemForm()
        
    }
    
    func setupNewItemForm(){
        view.addSubview(newItemForm)
        
        newItemForm.topAnchor.constraint(equalTo: view.topAnchor, constant: 8).isActive = true
        newItemForm.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        newItemForm.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        newItemForm.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
    }
    
}
