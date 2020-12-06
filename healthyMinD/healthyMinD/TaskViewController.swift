//
//  TaskViewController.swift
//  healthyMinD
//
//  Created by Grace Gao on 12/5/20.
//

import UIKit

class TaskViewController: UIViewController {
    @IBOutlet var label: UILabel!
    @IBOutlet var datePicker: UIDatePicker!
    
    var task: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

     
        ///DELETE BUTTON
        label.text = task
       // navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Delete", style: .done, target: self, action: #selector(deleteTask))

        
    }
    
    
     //applies gradient background
     func setGradientBackground() {
         let colorTop =  UIColor(red: 169.0/255.0, green: 242.0/255.0, blue: 219.0/255.0, alpha: 1.0).cgColor
         let colorBottom = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0).cgColor
                     
         let gradientLayer = CAGradientLayer()
         gradientLayer.colors = [colorTop, colorBottom]
         gradientLayer.locations = [0.0, 1.0]
         gradientLayer.frame = self.view.bounds
                 
         self.view.layer.insertSublayer(gradientLayer, at:0)
     }
     override func viewWillAppear(_ animated: Bool) {
         setGradientBackground()
         super.viewWillAppear(animated)
     }
     
    
  /*  //DELETE FUNCTION ThAT DOESN"T WORK LOL
    @objc func deleteTask(){
     //   let newCount = count - 1
     //   UserDefaults().setValue(newCount, forKey: "count")
      //  UserDefaults().setValue(nil, forKey: "task_\(currentPosition)")
    } */


}


