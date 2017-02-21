//
//  DatePickerContainer.swift
//  MAPD124-TodoList
//
//  Created by Wenzhong Zheng on 2017-02-19.
//  Copyright © 2017 Wenzhong. All rights reserved.
//

import UIKit

class DatePickerContainer: UIView {

    let datePicker: UIDatePicker = {
        let dp = UIDatePicker()
        dp.timeZone = NSTimeZone.local
        dp.backgroundColor = .white
        dp.translatesAutoresizingMaskIntoConstraints = false
        return dp
    }()
    
    let doneButton: UIButton = {
        let doneButton = UIButton(type: .system)
        doneButton.translatesAutoresizingMaskIntoConstraints = false
        doneButton.setTitle("Done", for: .normal)
        return doneButton
    }()
    
    let cancelButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Cancel", for: .normal)
        return button
    }()
    
    let doneButtonContainer:UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 0.6)
        
        return v
    }()
    

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(datePicker)
        self.addSubview(doneButtonContainer)
        
        doneButtonContainer.addSubview(doneButton)
        doneButtonContainer.addSubview(cancelButton)
        //x,y,w,h
        doneButton.topAnchor.constraint(equalTo: doneButtonContainer.topAnchor).isActive = true
        doneButton.rightAnchor.constraint(equalTo: doneButtonContainer.rightAnchor).isActive = true
        doneButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
        doneButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        //x,y,w,h
        cancelButton.topAnchor.constraint(equalTo: doneButtonContainer.topAnchor).isActive = true
        cancelButton.leftAnchor.constraint(equalTo: doneButtonContainer.leftAnchor).isActive = true
        cancelButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
        cancelButton.heightAnchor.constraint(equalToConstant: 30).isActive = true

        //x,y,w,h
        doneButtonContainer.topAnchor.constraint(equalTo: topAnchor).isActive = true
        doneButtonContainer.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        doneButtonContainer.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        doneButtonContainer.heightAnchor.constraint(equalToConstant: 30).isActive = true
  
        //x,y,w,h
        datePicker.topAnchor.constraint(equalTo: doneButtonContainer.bottomAnchor, constant: 12).isActive = true
        datePicker.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        datePicker.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        datePicker.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true

        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
