//
//  TaskViewController.swift
//  healthyMinD
//
<<<<<<< HEAD
//  Created by Mounika Adepu on 12/6/20.
=======
//  Created by Grace Gao on 12/5/20.
>>>>>>> new_temp
//

import UIKit

class TaskViewController: UIViewController {
    @IBOutlet var label: UILabel!
<<<<<<< HEAD
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var textView: UITextView!
    
    
=======
>>>>>>> new_temp
    
    var task: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
<<<<<<< HEAD
        textField.delegate = self
     
        ///DELETE BUTTON
        //label.text = task
       /* navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Delete", style: .done, target: self, action: #selector(deleteTask))*/
=======

     
        ///DELETE BUTTON
        label.text = task
       // navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Delete", style: .done, target: self, action: #selector(deleteTask))
>>>>>>> new_temp

        
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
<<<<<<< HEAD
    
    @IBAction func addNotesTapped(_ sender: Any){
        textView.text = "Notes: \(textField.text!)"
    }
    

    

}

extension TaskViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

=======
     
    
    //DELETE FUNCTION ThAT DOESN"T WORK LOL
    @objc func deleteTask(){
     //   let newCount = count - 1
     //   UserDefaults().setValue(newCount, forKey: "count")
      //  UserDefaults().setValue(nil, forKey: "task_\(currentPosition)")
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
>>>>>>> new_temp
