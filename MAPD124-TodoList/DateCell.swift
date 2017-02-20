//
//  DateCell.swift
//  MAPD124-TodoList
//
//  Created by Wenzhong Zheng on 2017-02-18.
//  Copyright © 2017 Wenzhong. All rights reserved.
//

import UIKit

class DateCell: UICollectionViewCell {
    
    let dueDateIconView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.image = #imageLiteral(resourceName: "calendar")
        
        return iv
    }()
    
    let dueDateLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Tue, February 11, 2020"
        lbl.isUserInteractionEnabled = true
        return lbl
    }()
    
    let remindMeIconView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.image = #imageLiteral(resourceName: "alert")
        
        return iv
    }()

    let remindMeLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Wed, February 12, 2020"
        lbl.isUserInteractionEnabled = true
        return lbl
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(dueDateIconView)
        addSubview(dueDateLabel)
        addSubview(remindMeIconView)
        addSubview(remindMeLabel)
        
        
        
        //x,y,w,h
        dueDateIconView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16).isActive = true
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
        
        
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}















