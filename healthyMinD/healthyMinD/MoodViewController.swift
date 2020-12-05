//
//  MoodViewController.swift
//  healthyMinD
//
//  Created by Sanjeev Aggarwal on 12/5/20.
//

import UIKit
import SwiftUI

class MoodViewController: UIViewController {
    
    //how to connect this to the image we want? (fade in and out video)
    @IBOutlet weak var lbl: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        fadeInOutA()
        self.lbl.alpha = 0
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
    
    func fadeInOutA(){
        UIView.animate(withDuration: 1.0,
                       animations: {
                        self.lbl.alpha = 1.0
        }, completion: {
            (completed : Bool)-> Void in
            
            UIView.animate(withDuration: 1.0, delay:
                1.0, options:
                UIView.AnimationOptions.curveLinear,
                animations:{
                self.lbl.alpha = 0
            }, completion: { (completed : Bool) ->
                Void in
                
                self.fadeInOutA()
                
            })
        })
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
