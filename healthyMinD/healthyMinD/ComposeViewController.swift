//
//  ComposeViewController.swift
//  healthyMinD
//
//  Created by Sanjeev Aggarwal on 12/6/20.
//

import UIKit

class ComposeViewController: UIViewController {

    
    @IBOutlet weak var postBarButtonItem: UIBarButtonItem!
    
    @IBOutlet weak var postTextView: UITextView!
    
    
    @IBAction func postDidTouch(_ sender: UIBarButtonItem) {
        if postTextView.text != "" {
            //create and save a new story
            self.navigationController!.popViewController(animated: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.rightBarButtonItem = postBarButtonItem
        title = "Write a Post..."
        
        postTextView.text = ""
        postTextView.becomeFirstResponder()

        // Do any additional setup after loading the view.
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
