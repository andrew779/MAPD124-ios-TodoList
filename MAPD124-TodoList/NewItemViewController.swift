//
//  NewItemViewController.swift
//  MAPD124-TodoList
//
//  Created by Wenzhong Zheng on 2017-02-19.
//  Copyright © 2017 Wenzhong. All rights reserved.
//

import UIKit
import Firebase

class NewItemViewController: UIViewController {
    let ref = FIRDatabase.database().reference().child("User")

    var item:Item? {
        didSet {
            loadItemInfo()
        }
    }
    
    let newItemForm:NewItemForm = {
        let v = NewItemForm()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    private func loadItemInfo(){
        newItemForm.titleTextField.text = item?.title
        newItemForm.detailTextView.text = item?.detail
        if let dueDate = item?.dueDate {
            newItemForm.dueDateLabel.text = Helper.getInstance.formatFromDBValueToDate(string: dueDate)
        }
        if let remindDate = item?.remindDate, !remindDate.isEmpty {
            newItemForm.remindMeLabel.text = Helper.getInstance.formatFromDBValueToDate(string: remindDate)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "Detail"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(handleSaveBarButtonTouched))
        navigationController?.navigationBar.isTranslucent = false
        setupNewItemForm()
        
    }
    
    func handleSaveBarButtonTouched(){
        guard let dictionary = getFormValueIntoDictionary() else {return}
        if item != nil{
            item?.title = dictionary["title"]
            item?.detail = dictionary["detail"]
            item?.dueDate = dictionary["dueDate"]
            item?.remindDate = dictionary["remindDate"]
        } else {
            item = Item(dic: dictionary)
        }
        updateFirbase(item: item!)
    }
    
    func getFormValueIntoDictionary() -> Dictionary<String,String>?{
        var dictionary = [String:String]()
        if let title = newItemForm.titleTextField.text, let dueDateText = newItemForm.dueDateLabel.text {
            if title.isEmpty {
                callAlert(title: "Invalid input", message: "Title can't be empty")
            }
            let detail = newItemForm.detailTextView.text ?? "Add Notes"
            let dueDate = convertStringToDateValue(string: dueDateText)
            var remindDate = ""
            if let remindDateText = newItemForm.remindMeLabel.text {
                remindDate = convertStringToDateValue(string: remindDateText)
            }
            
            dictionary = ["title":title,"detail":detail,"dueDate":dueDate,"remindDate":remindDate]
            return dictionary
            
        } else {
            callAlert(title: "Invalid input", message: "Due date can't be empty")
        }
        return nil
    }
    
    func updateFirbase(item:Item){
        var itemRef: FIRDatabaseReference?
        print(item.id!)
        if let id = item.id {
            itemRef = ref.child(id)
        } else {
            itemRef = ref.childByAutoId()
        }
        let values = item.getDicValues()
        itemRef?.updateChildValues(values, withCompletionBlock: { (error, ref) in
            //uncomment this will pop a alert whenever successfully update a new item
//            self.callAlert(title: "Updated", message: "Successfully updated")
           _ = self.navigationController?.popToRootViewController(animated: true)
            
        })
    }
    
    
    func convertStringToDateValue(string:String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormatter.myFormatStyle()
        let date = dateFormatter.date(from: string)
        let number = "\(date!.timeIntervalSince1970)"
        
        return number
    }
    
    func callAlert(title:String,message:String){
        let alert = CustomAlertViewController()
        alert.myOKAlert(title: title, message: message)
        present(alert, animated: true, completion: nil)
    }
    
    func setupNewItemForm(){
        view.addSubview(newItemForm)
        //x,y,w,h
        newItemForm.topAnchor.constraint(equalTo: view.topAnchor, constant: 8).isActive = true
        newItemForm.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        newItemForm.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        newItemForm.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
    }
    
    
    
}
