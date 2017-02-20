////
////  CollectionViewController.swift
////  MAPD124-TodoList
////
////  Created by Wenzhong Zheng on 2017-02-11.
////  Copyright © 2017 Wenzhong. All rights reserved.
////
//
//import UIKit
//import FirebaseDatabase
//
//
//private let titleDetailIdentifier = "titleDetailCell"
//private let dateIdentifier = "dateCell"
//
//class NewItemVC: UICollectionViewController,UICollectionViewDelegateFlowLayout,UIGestureRecognizerDelegate {
//    
//    var tapedGesture:UITapGestureRecognizer?
//    var datePickerContainnerConstrain:NSLayoutConstraint?
//    var condition = true
//    var lastTouchedLabel:UILabel!
//  
//    let datePicker: UIDatePicker = {
//        let dp = UIDatePicker()
//        dp.timeZone = NSTimeZone.local
//        dp.backgroundColor = .white
//        dp.translatesAutoresizingMaskIntoConstraints = false
//        return dp
//    }()
//    
//    let doneButtonContainer:UIView = {
//        let v = UIView()
//        v.translatesAutoresizingMaskIntoConstraints = false
//        //        let shadowPath = UIBezierPath(rect: v.bounds)
//        //        v.layer.shadowColor = UIColor.black.cgColor
//        //        v.clipsToBounds = true
//        //        v.layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
//        //        v.layer.shadowOpacity = 0.5
//        //        v.layer.shadowPath = shadowPath.cgPath
//        v.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 0.6)
//        
//        return v
//    }()
//    
//    let datePickerContainer: UIView = {
//        let v = UIView()
//        v.translatesAutoresizingMaskIntoConstraints = false
//        v.backgroundColor = .white
//        
//        return v
//    }()
//    
//    lazy var doneButtonInDatePicker: UIButton = {
//        let button = UIButton(type: .system)
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.setTitle("Done", for: .normal)
//        
//        button.addTarget(self, action: #selector(printSomething), for: .touchUpInside)
//        return button
//    }()
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
////        gesture?.delegate = self
//        
//        // Register cell classes
////        self.collectionView?.register(TitleDetailCell.self, forCellWithReuseIdentifier: titleDetailIdentifier)
//        self.collectionView?.register(DateCell.self, forCellWithReuseIdentifier: dateIdentifier)
//        
//        
//        collectionView?.backgroundColor = .white
//        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(handleAddBarItemClicked))
//        
//        setupDatePicker()
//       
//    }
//
//    func handleAddBarItemClicked(){
//        
//        
//        
//        
//
//        
//        
//    }
//    
//    func printSomething(){
//        let formatter = DateFormatter()
//        formatter.dateFormat = "EEE, MMM d, yyyy hh:mm a"
////        formatter.dateStyle =
////        formatter.timeStyle = .short
//        let finalDateValue = formatter.string(from: datePicker.date)
//        
//        if let label = tapedGesture?.view as? UILabel{
//            label.text = finalDateValue
//        }
//        
//        toggleDatePickerContainer(tapedGesture!)
//        
//    }
//    
//    
////    let toolBar = UIToolbar()
////    
////    func setupToolBarItem(){
////        
////        toolBar.barStyle = UIBarStyle.default
////        toolBar.isTranslucent = true
////        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
////        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(datePickerDoneClicked(_:)))
////        
////        toolBar.setItems([space,doneButton], animated: false)
////        toolBar.isUserInteractionEnabled = true
////        toolBar.sizeToFit()
////        
////    }
//    
//
//    // MARK: UICollectionViewDataSource
//
//    override func numberOfSections(in collectionView: UICollectionView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 2
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: view.frame.width, height: 80)
//    }
//
//    
//    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of items
//        return 1
//    }
//
//    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        
//        if indexPath.section == 1 {
////            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: titleDetailIdentifier, for: indexPath) as! TitleDetailCell
////            cell.backgroundColor = .clear
////            return cell
//        } else {
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: dateIdentifier, for: indexPath) as! DateCell
//            cell.backgroundColor = .clear
//            
//            
//            let dueDateLabelGesture = UITapGestureRecognizer(target: self, action: #selector(toggleDatePickerContainer(_:)))
//            
//            let remindMeLabelGesture = UITapGestureRecognizer(target: self, action: #selector(toggleDatePickerContainer(_:)))
//            
//            cell.dueDateLabel.addGestureRecognizer(dueDateLabelGesture)
//            cell.remindMeLabel.addGestureRecognizer(remindMeLabelGesture)
//            
//            cell.dueDateLabel.tag = 1
//            cell.remindMeLabel.tag = 2
//            
//            return cell
//        }
//
//    return UICollectionViewCell()
//
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 0
//    }
//    
//    func datePickerDoneClicked(_ sender: AnyObject) {
//        
//    }
//    
//    
//
//
//    
//}
//
//extension NewItemVC {
//    
//    func setupDatePicker() {
//        
//        datePickerContainnerConstrain?.constant = -20
//        
//        doneButtonContainer.addSubview(doneButtonInDatePicker)
//        
//        datePickerContainer.addSubview(datePicker)
//        datePickerContainer.addSubview(doneButtonContainer)
//        view.addSubview(datePickerContainer)
//        
//        
//        datePickerContainer.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
//        datePickerContainer.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
//        
//        datePickerContainnerConstrain = datePickerContainer.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 250)
//        datePickerContainnerConstrain?.isActive = true
//        
//        datePickerContainer.heightAnchor.constraint(equalToConstant: 200).isActive = true
//        
//        //x,y,w,h
//        doneButtonContainer.topAnchor.constraint(equalTo: datePickerContainer.topAnchor).isActive = true
//        doneButtonContainer.leftAnchor.constraint(equalTo: datePickerContainer.leftAnchor).isActive = true
//        doneButtonContainer.rightAnchor.constraint(equalTo: datePickerContainer.rightAnchor).isActive = true
//        doneButtonContainer.heightAnchor.constraint(equalToConstant: 30).isActive = true
//        
//        
//        //x,y,w,h
//        doneButtonInDatePicker.topAnchor.constraint(equalTo: doneButtonContainer.topAnchor).isActive = true
//        //        doneButtonInDatePicker.leftAnchor.constraint(equalTo: datePickerContainer.leftAnchor).isActive = true
//        doneButtonInDatePicker.rightAnchor.constraint(equalTo: doneButtonContainer.rightAnchor).isActive = true
//        doneButtonInDatePicker.widthAnchor.constraint(equalToConstant: 80).isActive = true
//        doneButtonInDatePicker.heightAnchor.constraint(equalToConstant: 30).isActive = true
//        
//        
//        //x,y,w,h
//        datePicker.topAnchor.constraint(equalTo: doneButtonContainer.bottomAnchor, constant: 12).isActive = true
//        datePicker.leftAnchor.constraint(equalTo: datePickerContainer.leftAnchor).isActive = true
//        datePicker.rightAnchor.constraint(equalTo: datePickerContainer.rightAnchor).isActive = true
//        datePicker.bottomAnchor.constraint(equalTo: datePickerContainer.bottomAnchor).isActive = true
//        
//        
//        
//    }
//
//    func toggleDatePickerContainer(_ sender: AnyObject) {
//        
//        tapedGesture = sender as? UITapGestureRecognizer
//        
//        
//        
//        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: {
//            
//            self.datePickerContainnerConstrain?.constant = self.condition ? -10 : 250
//            self.view.layoutIfNeeded()
//            
//        }) { (ok) in
//            self.condition = !self.condition
//        }
//    }
//    
//    
//}
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
