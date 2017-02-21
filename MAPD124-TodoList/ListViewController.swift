//
//  ListViewController.swift
//  MAPD124-TodoList
//
//  Created by Wenzhong Zheng
//  SID: 300909195
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
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "About Me", style: .plain, target: self, action: #selector(handleAboutMeTaped))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "new_list_icon"), style: .plain, target: self, action: #selector(handleAddNewItem))
        
        tableView.register(ListCell.self, forCellReuseIdentifier: cellId)
        
        queryItemOrder()
        
    }
    
    // MARK: pop up a alert with about me info
    func handleAboutMeTaped() {
        let alert = UIAlertController(title: "About Me", message: "Student: Wenzhong Zheng\nStudentID: 300909195", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Got It", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }


    // MARK: observe item value changes and update
    func queryItemOrder(){
        ref.queryOrdered(byChild: "complete").observe(.value, with: { (snapshot) in
            var newItems:[Item] = []
            
            for child in snapshot.children {
                let newItem = Item(snapshot: child as! FIRDataSnapshot)
                newItems.append(newItem)
            }
            self.items = newItems
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
        }, withCancel: nil)
    }
    
    func handleAddNewItem() {
        
        let newItemViewController = NewItemViewController()
        
        navigationController?.pushViewController(newItemViewController, animated: true)
    }
    
    // MARK: change cell item style when checkbox value changed
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
            
            let alert = UIAlertController(title: "Delete", message: "Do you really want to delete it ?", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            alert.addAction(UIAlertAction(title: "Pretty sure", style: .destructive, handler: { (action) in
                if let id = self.items[indexPath.row].id {
                    self.ref.child(id).removeValue()
                }
                self.items.remove(at: indexPath.row)
                self.tableView.reloadData()
            }))
            
            self.present(alert, animated: true, completion: nil)
            
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










