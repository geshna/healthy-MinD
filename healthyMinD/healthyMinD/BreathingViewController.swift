//
//  BreathingViewController.swift
//  healthyMinD
//
//  Created by Jenny H on 12/5/20.
//

import UIKit

class BreathingViewController: UIViewController {
    
    @IBOutlet weak var img: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        fadeInOutA()
        self.img.alpha = 0
    }
    
    //applies gradient background /*
   /* func setGradientBackground() {
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
    } */
    
    func fadeInOutA(){
        UIView.animate(withDuration: 4.0,
                       animations: {
                        self.img.alpha = 1.0
        }, completion: {
            (completed : Bool)-> Void in
            
            UIView.animate(withDuration: 4.0, delay:
                1.0, options:
                UIView.AnimationOptions.curveLinear,
                animations:{
                self.img.alpha = 0
            }, completion: { (completed : Bool) ->
                Void in
                
                self.fadeInOutA()
                
            })
        })
    }

}
