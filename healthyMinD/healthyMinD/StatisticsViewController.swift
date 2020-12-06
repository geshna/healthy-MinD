//
//  StatisticsViewController.swift
//  healthyMinD
//
//  Created by Jenny H on 12/5/20.
//


import UIKit
import SwiftUI

struct BarView: View {
    var value: CGFloat
    var body: some View{
        VStack{
            ZStack (alignment: .bottom){
                Capsule().frame(width: 30, height: 200)
                    .foregroundColor(Color(#colorLiteral(red: 0.5937837362, green: 1, blue: 0.7992791533, alpha: 1))) //color literal
                Capsule().frame(width: 30, height: value)
                    .foregroundColor(.white)
            }
            Text("D").padding(.top,8)
        }
    }
}

class StatisticsViewController: UIViewController {
    
    
    @State var pickerSelectedItem = 0
    
    @State var dataPoints: [[CGFloat]] = [
        [50,100,150,30,160,170,180],
        [30,60,30,40,100,110,120],
        [50,100,150,30,160,180,100],
        
    ]
    
    var body:some View{
        ZStack{
            VStack {
                Text("Mood Tracker")
                    .font(.system(size: 34))
                    .fontWeight(.heavy)
                
                Picker(selection: $pickerSelectedItem, label: Text("")){
                    Text("Week 1").tag(0)
                    Text("Week 2").tag(1)
                    Text("Week 3").tag(2)
                }.pickerStyle(SegmentedPickerStyle())
                    .padding(.horizontal,24)
                
                HStack (spacing: 16) {
                    BarView(value: dataPoints[pickerSelectedItem][0])
                    BarView(value: dataPoints[pickerSelectedItem][1])
                    BarView(value: dataPoints[pickerSelectedItem][2])
                    BarView(value: dataPoints[pickerSelectedItem][3])
                    BarView(value: dataPoints[pickerSelectedItem][4])
                    BarView(value: dataPoints[pickerSelectedItem][5])
                    BarView(value: dataPoints[pickerSelectedItem][6])
                    BarView(value: dataPoints[pickerSelectedItem][7])
                }.padding(.top,24)
            }
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
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

}
