//
//  FirstViewController.swift
//  healthyMinD
//
//  Created by Sanjeev Aggarwal on 12/5/20.
//

import UIKit
import SwiftUI

class FirstViewController: UIViewController {
    
    @IBOutlet var label: UILabel! //for dateFormatters -- day
    @IBOutlet var label2: UILabel! //actual date
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        /// FORMATTING DATE LABEL
        let date = Date()
        let formatter = DateFormatter()
        formatter.timeZone = .current
        formatter.locale = .current
        
        formatter.dateFormat = "EEEE"
        
        label.text = formatter.string(from: date)
        
        formatter.dateFormat = "MMM d, yyyy"
        label2.text = formatter.string(from: date)
        ///********
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
    
   
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    

}






