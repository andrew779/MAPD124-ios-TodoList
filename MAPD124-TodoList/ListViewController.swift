//
//  ListViewController.swift
//  MAPD124-TodoList
//
//  Created by Wenzhong Zheng on 2017-02-01.
//  SID:300909195
//  Copyright © 2017 Wenzhong. All rights reserved.
//

import UIKit
import FirebaseDatabase


private let cellId = "cellId"
class ListViewController: UITableViewController {

    let datas = ["one","two","three"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Inbox"
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(handleLogout))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "new_list_icon"), style: .plain, target: self, action: #selector(handleAddNewItem))
        
        tableView.register(ListCell.self, forCellReuseIdentifier: cellId)
        
//        observeItems()
        
    }

    func observeItems() {
        let ref = FIRDatabase.database().reference().child("User")
        
        ref.observeSingleEvent(of: .value, with: { (snapshot) in
            
            
            
            
        }, withCancel: nil)
        
        
        
    }
    
    func handleLogout() {
        
        dismiss(animated: true, completion: nil)
    
    }
    
    func handleAddNewItem() {

        let newItemViewController = NewItemViewController()
        
        navigationController?.pushViewController(newItemViewController, animated: true)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! ListCell
        
        cell.textLabel?.text = datas[indexPath.row]
        cell.detailTextLabel?.text = datas[indexPath.row]

        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            print("delete clicked")
        }
    }
    
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }


   //for customize row buttons
//    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]?{
////        let done = UITableViewRowAction(style: .destructive, title: "Done") { (action, index) in
////            print("done button clicked")
////        }
////        done.backgroundColor = .green
////        
////        let edit = UITableViewRowAction(style: .default, title: "Edit") { (action, index) in
////            print("edit button clicked")
////        }
////        edit.backgroundColor = .orange
//        
////        let deleteButton = MyTableViewRowAction(style: .default, title: "      ") { (action, index) in
////            
////            
////        }
////        deleteButton.image = #imageLiteral(resourceName: "delete")
////        deleteButton.backgroundColor = UIColor(red: 252/255, green: 65/255, blue: 75/255, alpha: 1)
////        
////        deleteButton.imageView?.contentMode = .scaleAspectFit
////        return [deleteButton]
//        
//    }
    
    
}










