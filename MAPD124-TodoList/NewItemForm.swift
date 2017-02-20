//
//  NewItemForms.swift
//  MAPD124-TodoList
//
//  Created by Wenzhong Zheng on 2017-02-19.
//  Copyright © 2017 Wenzhong. All rights reserved.
//

import UIKit

class NewItemForm: UIView, UITextViewDelegate, UIGestureRecognizerDelegate {
    
    let titleTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Add Title"
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let detailTextView: UITextView = {
        let tv = UITextView()
        tv.isScrollEnabled = false
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.textContainerInset = UIEdgeInsets(top: 0, left: -4, bottom: 0, right: 0)
        tv.text = "Add Notes"
        tv.textColor = .lightGray
        return tv
    }()
    
    let titleIcon: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "title")
        iv.translatesAutoresizingMaskIntoConstraints = false
        
        return iv
    }()
    
    let detailIcon: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "pencil")
        iv.translatesAutoresizingMaskIntoConstraints = false
        
        return iv
    }()
    
    let seperatorLine:UIView = {
        let v = UIView()
        v.backgroundColor = UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 1)
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    let seperatorLineForNoteBottom:UIView = {
        let v = UIView()
        v.backgroundColor = UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 1)
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    var dueDateLabelGesture:UITapGestureRecognizer?
    var remindMeLabelGesture:UITapGestureRecognizer?
    
    let dueDateIconView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.image = #imageLiteral(resourceName: "calendar")
        
        return iv
    }()
    
    lazy var dueDateLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
//        lbl.text = "Tue, February 11, 2020"
        lbl.addGestureRecognizer(self.dueDateLabelGesture!)
        lbl.isUserInteractionEnabled = true
        return lbl
    }()
    
    let remindMeIconView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.image = #imageLiteral(resourceName: "alert")
        
        return iv
    }()
    
    lazy var remindMeLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.addGestureRecognizer(self.remindMeLabelGesture!)
//        lbl.text = "Wed, February 12, 2020"
        lbl.isUserInteractionEnabled = true
        return lbl
    }()
    
    let datePickerContainer: DatePickerContainer = {
        let v = DatePickerContainer()
        v.translatesAutoresizingMaskIntoConstraints = false
        
        return v
    }()
    
    var datePickerContainerConstrain: NSLayoutConstraint?
    
    var condition:Bool = true
    
    func toggleDatePicker(_ sender: AnyObject){
        
        tapGesture = sender as? UITapGestureRecognizer
        
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseInOut, animations: {
            
            self.datePickerContainerConstrain?.constant = self.condition ? -10 : 250
            self.layoutIfNeeded()
            
        }) { (ok) in
            self.condition = !self.condition
        }

    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        self.translatesAutoresizingMaskIntoConstraints = false
        
        dueDateLabelGesture = UITapGestureRecognizer(target: self, action: #selector(toggleDatePicker(_:)))
        remindMeLabelGesture = UITapGestureRecognizer(target: self, action: #selector(toggleDatePicker(_:)))
        
        addSubview(titleTextField)
        addSubview(detailTextView)
        addSubview(titleIcon)
        addSubview(detailIcon)
        addSubview(seperatorLine)
        addSubview(seperatorLineForNoteBottom)
        
        
        //x,y,w,h
        titleIcon.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
        titleIcon.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16).isActive = true
        titleIcon.widthAnchor.constraint(equalToConstant: 20).isActive = true
        titleIcon.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        //need x,y,w,h
        titleTextField.topAnchor.constraint(equalTo: titleIcon.topAnchor).isActive = true
        titleTextField.leftAnchor.constraint(equalTo: titleIcon.rightAnchor, constant: 16).isActive = true
        titleTextField.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        titleTextField.bottomAnchor.constraint(equalTo: titleIcon.bottomAnchor).isActive = true
        
        //x,y,w,h
        seperatorLine.topAnchor.constraint(equalTo: titleIcon.bottomAnchor, constant: 2).isActive = true
        seperatorLine.leftAnchor.constraint(equalTo: titleTextField.leftAnchor).isActive = true
        seperatorLine.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        seperatorLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        //x,y,w,h
        detailIcon.topAnchor.constraint(equalTo: titleIcon.bottomAnchor, constant: 12).isActive = true
        detailIcon.leftAnchor.constraint(equalTo: titleIcon.leftAnchor).isActive = true
        detailIcon.widthAnchor.constraint(equalToConstant: 20).isActive = true
        detailIcon.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        //need x,y,w,h
        detailTextView.topAnchor.constraint(equalTo: detailIcon.topAnchor).isActive = true
        detailTextView.leftAnchor.constraint(equalTo: detailIcon.rightAnchor, constant: 16).isActive = true
        detailTextView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        detailTextView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        //x,y,w,h
        seperatorLineForNoteBottom.topAnchor.constraint(equalTo: detailTextView.bottomAnchor, constant: 2).isActive = true
        seperatorLineForNoteBottom.leftAnchor.constraint(equalTo: detailTextView.leftAnchor).isActive = true
        seperatorLineForNoteBottom.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        seperatorLineForNoteBottom.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        
        detailTextView.delegate = self
        
        //second section
        addSubview(dueDateIconView)
        addSubview(dueDateLabel)
        addSubview(remindMeIconView)
        addSubview(remindMeLabel)
        
        //x,y,w,h
        dueDateIconView.topAnchor.constraint(equalTo: seperatorLineForNoteBottom.bottomAnchor, constant: 16).isActive = true
        dueDateIconView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16).isActive = true
        dueDateIconView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        dueDateIconView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        //x,y,w,h
        dueDateLabel.topAnchor.constraint(equalTo: dueDateIconView.topAnchor).isActive = true
        dueDateLabel.leftAnchor.constraint(equalTo: dueDateIconView.rightAnchor, constant: 16).isActive = true
        dueDateLabel.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        dueDateLabel.bottomAnchor.constraint(equalTo: dueDateIconView.bottomAnchor).isActive = true
        
        //x,y,w,h
        remindMeIconView.topAnchor.constraint(equalTo: dueDateIconView.bottomAnchor, constant: 12).isActive = true
        remindMeIconView.leftAnchor.constraint(equalTo: dueDateIconView.leftAnchor).isActive = true
        remindMeIconView.widthAnchor.constraint(equalTo: dueDateIconView.widthAnchor).isActive = true
        remindMeIconView.heightAnchor.constraint(equalTo: dueDateIconView.heightAnchor).isActive = true
        
        //x,y,w,h
        remindMeLabel.topAnchor.constraint(equalTo: remindMeIconView.topAnchor).isActive = true
        remindMeLabel.leftAnchor.constraint(equalTo: remindMeIconView.rightAnchor, constant: 16).isActive = true
        remindMeLabel.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        remindMeLabel.bottomAnchor.constraint(equalTo: remindMeIconView.bottomAnchor).isActive = true
        
        //add datePicker container
        addSubview(datePickerContainer)
        
        datePickerContainerConstrain = datePickerContainer.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 250)
        datePickerContainerConstrain?.isActive = true
        datePickerContainer.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        datePickerContainer.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        datePickerContainer.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        datePickerContainer.doneButton.addTarget(self, action: #selector(handleDoneTouched), for: .touchUpInside)
        
    }
    
    var tapGesture:UITapGestureRecognizer?
    
    // MARK: Formatting date on datePicker and put it on the right dateLabel
    func handleDoneTouched(){
        
        let finalDateValue = Helper.getInstance.formatFromDate(date: datePickerContainer.datePicker.date)
        
        if let label = tapGesture?.view as? UILabel{
            label.text = finalDateValue
            toggleDatePicker(tapGesture!)
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == .lightGray {
            textView.text = nil
            textView.textColor = .black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Add Notes"
            detailTextView.textColor = .lightGray
        }
    }

    
    

}
