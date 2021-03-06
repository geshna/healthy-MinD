//
//  StatisticsViewController.swift
//  healthyMinD
//
//  Created by Jenny H on 12/5/20.
//


import UIKit

import SwiftUI

class StatisticsViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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
    
    @IBSegueAction func connectSwiftUI(_ coder: NSCoder) -> UIViewController? {
        return UIHostingController(coder: coder, rootView: StatisticsSwiftUIView())
    }
    

}

