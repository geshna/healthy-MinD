//
//  FirstViewController.swift
//  healthyMinD
//
//  Created by Sanjeev Aggarwal on 12/5/20.
//

import UIKit
import SwiftUI
import FirebaseAuth
import FirebaseDatabase
//import FirebaseDatabase

class FirstViewController: UIViewController {
    
    @IBOutlet weak var welcome_label: UILabel!
    @IBOutlet var label: UILabel! //for dateFormatters -- day
    @IBOutlet var label2: UILabel! //actual date
    @IBOutlet weak var label_email: UILabel!
    
    
    //progressBar
    let shapeLayer = CAShapeLayer()
    let percentageLabel:UILabel = {
        let label = UILabel()
        label.text = "0%"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 32)
        return label
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Progress Bar
        view.addSubview(percentageLabel)
                percentageLabel.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
                percentageLabel.center = view.center
                
                //drawing a circle
                
                let center = view.center
                
                //create track
                let trackLayer = CAShapeLayer()
                let circularPath = UIBezierPath(arcCenter: center, radius: 100, startAngle: -CGFloat.pi / 2, endAngle: 2*CGFloat.pi, clockwise: true)
                
                trackLayer.path = circularPath.cgPath
                
                trackLayer.strokeColor = UIColor.lightGray.cgColor
                trackLayer.lineWidth = 10
                
                trackLayer.fillColor = UIColor.clear.cgColor
                
                trackLayer.lineCap = CAShapeLayerLineCap.round
                
                view.layer.addSublayer(trackLayer)
                
                
                
        //        let circularPath = UIBezierPath(arcCenter: center, radius: 100, startAngle: -CGFloat.pi / 2, endAngle: 2*CGFloat.pi, clockwise: true)
                
                shapeLayer.path = circularPath.cgPath
                
                shapeLayer.strokeColor = UIColor.cyan.cgColor
                shapeLayer.lineWidth = 10
                
                shapeLayer.fillColor = UIColor.clear.cgColor
                
                shapeLayer.lineCap = CAShapeLayerLineCap.round
                
                
                shapeLayer.strokeEnd = 0
                
                view.layer.addSublayer(shapeLayer)
                
                view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
                

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
        
        /*
        let user_email = UserDefaults.standard.string(forKey: "keyEmail")
        label_email.text = user_email
        */
        
        let checkFname = UserDefaults.standard.bool(forKey: "check_name")
        let checkFname2 = UserDefaults.standard.bool(forKey: "check_name_2")
        var fname: String?
        var labelwelcome: String?
        
        
        if checkFname || checkFname {
            fname = UserDefaults.standard.string(forKey: "first_name")
            labelwelcome = "Welcome"
        }
        else{
            labelwelcome = "Welcome Back!"
            /*
            let ref = Database.database().reference(withPath: "user")
            ref.observeSingleEvent(of: .value, with: { snapshot in

                if !snapshot.exists() { return }

               // print(snapshot) // Its print all values including Snap (User)

               // print(snapshot.value!)

                fname = snapshot.childSnapshot(forPath: "firstname").value as? String
                //print(username!)

            }) */
        }
        
        welcome_label.text = labelwelcome
        label_email.text = fname
        labelwelcome = "Welcome Back!"
        fname = ""
               
                
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
    
    @objc private func handleTap(){
           print("Attempting to animate stroke")
           
           let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
           
           basicAnimation.toValue = 1
           
           basicAnimation.duration = 2
           
           basicAnimation.fillMode = CAMediaTimingFillMode.forwards
           
           basicAnimation.isRemovedOnCompletion = false
           
           shapeLayer.add(basicAnimation, forKey: "basic")
           
           
       }
    

}






