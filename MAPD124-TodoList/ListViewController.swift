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
        itemChanged()
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
    
    func itemChanged(){
        ref.observe(.childChanged, with: { (snapshot) in
            if let dictionary = snapshot.value as? [String:AnyObject] {
                let id = snapshot.key
                for value in self.items{
                    if value.id == id {
                        value.setValuesForKeys(dictionary)
                    }
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
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
    
    func toggleCell(_ cell: ListCell, isCompleted: Bool) {
        cell.checkBox.isChecked = isCompleted
        if isCompleted {
            cell.textLabel?.font = UIFont.italicSystemFont(ofSize: (cell.textLabel?.font.pointSize)!)
            cell.textLabel?.textColor = UIColor.gray
            cell.detailTextLabel?.textColor = UIColor.gray
        } else {
            cell.textLabel?.font = UIFont.boldSystemFont(ofSize: (cell.textLabel?.font.pointSize)!)
            cell.textLabel?.textColor = UIColor.black
            cell.detailTextLabel?.textColor = UIColor.black
        }

    }
    func checkBoxTaped(_ cell:ListCell){
        guard let indexPath = tableView.indexPath(for: cell) else{return}
        cell.checkBox.isChecked = !cell.checkBox.isChecked
        let isComplete = cell.checkBox.isChecked
        items[indexPath.row].complete = isComplete   //update local items value
        toggleCell(cell, isCompleted: isComplete)
        
        //update Firebase
        if let id = items[indexPath.row].id {
             ref.child(id).updateChildValues(["complete":isComplete])
        }
       
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! ListCell
        
        toggleCell(cell, isCompleted: items[indexPath.row].complete)
        
        cell.tapAction = { (cell) in
            self.checkBoxTaped(cell)
        }
        
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










