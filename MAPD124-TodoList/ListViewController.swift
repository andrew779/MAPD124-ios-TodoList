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

    let ref = FIRDatabase.database().reference().child("User")
    
    var items = [Item]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Inbox"
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(handleLogout))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "new_list_icon"), style: .plain, target: self, action: #selector(handleAddNewItem))
        
        tableView.register(ListCell.self, forCellReuseIdentifier: cellId)
        
        observeItems()
        
    }

    func observeItems() {
        
        itemAdded()
        itemRemoved()
    }
    
    func itemAdded(){
        ref.observe(.childAdded, with: { (snapshot) in
            
            if let dictionary = snapshot.value as? [String:AnyObject] {
                let item = Item()
                item.id = snapshot.key
                item.setValuesForKeys(dictionary)
                
                self.items.append(item)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
            
        }, withCancel: nil)
    }
    
    func itemRemoved(){
       ref.observe(.childRemoved, with: { (snapshot) in
        let key = snapshot.key
        for (index, value) in self.items.enumerated(){
            if value.id == key {
                self.items.remove(at: index)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
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
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! ListCell
        
        cell.textLabel?.text = items[indexPath.row].title
        
        if let dateText = items[indexPath.row].dueDate {
            let date = Helper.getInstance.formatFromDBValueToDate(string: dateText)
            cell.detailTextLabel?.text = date
        }

        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            if let id = items[indexPath.row].id {
                ref.child(id).removeValue()
            }
            items.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
    
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let newItemController = NewItemViewController()
        newItemController.item = items[indexPath.row]
        navigationController?.pushViewController(newItemController, animated: true)
        
    }
    
}










