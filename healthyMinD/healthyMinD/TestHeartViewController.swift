//
//  TestHeartViewController.swift
//  healthyMinD
//
//  Created by Jenny H on 12/6/20.
//

import UIKit

class TestHeartViewController: UIViewController {
    
    @IBOutlet weak var EmptyOutlet: UIButton!
    @IBOutlet weak var FillOutlet: UIButton!
    var imageInt = 0
    @IBOutlet weak var Progress: UILabel!
    
    @IBOutlet weak var HeartImg: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imageInt = 0
        Progress.text = String("\(imageInt)%")
        Progress.textColor = UIColor.black
        
        EmptyOutlet.isEnabled = false
        
    }
    
    @IBAction func Empty(_ sender: Any) {
        imageInt -= 20
        Progress.text = String("\(imageInt)%")
        
        self.imageGallery()

    }
    
    @IBAction func Fill(_ sender: Any) {
        imageInt += 20
        Progress.text = String("\(imageInt)% Keep going. You are not alone.")
        
        self.imageGallery()

    }
    
    func imageGallery(){
        if imageInt == 0{
            EmptyOutlet.isEnabled = false
            FillOutlet.isEnabled = true
            HeartImg.image = UIImage(named: "zero.png")
        }
        if imageInt == 20{
            EmptyOutlet.isEnabled = true
            FillOutlet.isEnabled = true
            HeartImg.image = UIImage(named: "twenty.png")
        }
        if imageInt == 40{
            EmptyOutlet.isEnabled = true
            FillOutlet.isEnabled = true
            HeartImg.image = UIImage(named: "fourty.png")
        }
        if imageInt == 60{
            EmptyOutlet.isEnabled = true
            FillOutlet.isEnabled = true
            HeartImg.image = UIImage(named: "sixty.png")
        }
        if imageInt == 80{
            EmptyOutlet.isEnabled = true
            FillOutlet.isEnabled = true
            HeartImg.image = UIImage(named: "eighty.png")
        }

        if imageInt == 100{
            EmptyOutlet.isEnabled = true
            FillOutlet.isEnabled = false
            HeartImg.image = UIImage(named: "onehundred.png")
        }
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
