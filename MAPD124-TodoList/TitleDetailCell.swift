////
////  TitleDetailCell.swift
////  MAPD124-TodoList
////
////  Created by Wenzhong Zheng on 2017-02-12.
////  Copyright © 2017 Wenzhong. All rights reserved.
////
//
//import UIKit
//
//class TitleDetailCell: UICollectionViewCell,UITextViewDelegate {
//    
//    let titleTextField: UITextField = {
//        let tf = UITextField()
//        tf.placeholder = "Add Title"
//        tf.translatesAutoresizingMaskIntoConstraints = false
//        return tf
//    }()
//    
//    let detailTextView: UITextView = {
//        let tv = UITextView()
//        tv.isScrollEnabled = false
//        tv.translatesAutoresizingMaskIntoConstraints = false
//        tv.textContainerInset = UIEdgeInsets(top: 0, left: -4, bottom: 0, right: 0)
//        tv.text = "Add Notes"
//        tv.textColor = .lightGray
//        return tv
//    }()
//    
//    let titleIcon: UIImageView = {
//        let iv = UIImageView()
//        iv.image = #imageLiteral(resourceName: "title")
//        iv.translatesAutoresizingMaskIntoConstraints = false
//        
//        return iv
//    }()
//    
//    let detailIcon: UIImageView = {
//        let iv = UIImageView()
//        iv.image = #imageLiteral(resourceName: "pencil")
//        iv.translatesAutoresizingMaskIntoConstraints = false
//        
//        return iv
//    }()
//    
//    let seperatorLine:UIView = {
//        let v = UIView()
//        v.backgroundColor = UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 1)
//        v.translatesAutoresizingMaskIntoConstraints = false
//        return v
//    }()
//    
//    let seperatorLineForNoteBottom:UIView = {
//        let v = UIView()
//        v.backgroundColor = UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 1)
//        v.translatesAutoresizingMaskIntoConstraints = false
//        return v
//    }()
//    
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        
////        detailTextView.text = "Add Notes"
////        detailTextView.textColor = .lightGray
//        
//        addSubview(titleTextField)
//        addSubview(detailTextView)
//        addSubview(titleIcon)
//        addSubview(detailIcon)
//        addSubview(seperatorLine)
//        addSubview(seperatorLineForNoteBottom)
//        
//        
//        //x,y,w,h
//        titleIcon.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
//        titleIcon.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16).isActive = true
//        titleIcon.widthAnchor.constraint(equalToConstant: 20).isActive = true
//        titleIcon.heightAnchor.constraint(equalToConstant: 20).isActive = true
//        
//        //need x,y,w,h
//        titleTextField.topAnchor.constraint(equalTo: titleIcon.topAnchor).isActive = true
//        titleTextField.leftAnchor.constraint(equalTo: titleIcon.rightAnchor, constant: 16).isActive = true
//        titleTextField.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
//        titleTextField.bottomAnchor.constraint(equalTo: titleIcon.bottomAnchor).isActive = true
//        
//        //x,y,w,h
//        seperatorLine.topAnchor.constraint(equalTo: titleIcon.bottomAnchor, constant: 2).isActive = true
//        seperatorLine.leftAnchor.constraint(equalTo: titleTextField.leftAnchor).isActive = true
//        seperatorLine.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
//        seperatorLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
//        
//        //x,y,w,h
//        detailIcon.topAnchor.constraint(equalTo: titleIcon.bottomAnchor, constant: 12).isActive = true
//        detailIcon.leftAnchor.constraint(equalTo: titleIcon.leftAnchor).isActive = true
//        detailIcon.widthAnchor.constraint(equalToConstant: 20).isActive = true
//        detailIcon.heightAnchor.constraint(equalToConstant: 20).isActive = true
//        
//        //need x,y,w,h
//        detailTextView.topAnchor.constraint(equalTo: detailIcon.topAnchor).isActive = true
//        detailTextView.leftAnchor.constraint(equalTo: detailIcon.rightAnchor, constant: 16).isActive = true
//        detailTextView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
//        detailTextView.heightAnchor.constraint(equalToConstant: 80).isActive = true
//        
//        //x,y,w,h
//        seperatorLineForNoteBottom.topAnchor.constraint(equalTo: detailTextView.bottomAnchor, constant: 2).isActive = true
//        seperatorLineForNoteBottom.leftAnchor.constraint(equalTo: detailTextView.leftAnchor).isActive = true
//        seperatorLineForNoteBottom.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
//        seperatorLineForNoteBottom.heightAnchor.constraint(equalToConstant: 1).isActive = true
//        
//        
//        detailTextView.delegate = self
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    
//    func textViewDidBeginEditing(_ textView: UITextView) {
//        if textView.textColor == .lightGray {
//            textView.text = nil
//            textView.textColor = .black
//        }
//    }
//    
//    func textViewDidEndEditing(_ textView: UITextView) {
//        if textView.text.isEmpty {
//            textView.text = "Add Notes"
//            detailTextView.textColor = .lightGray
//        }
//    }
//    
//}
