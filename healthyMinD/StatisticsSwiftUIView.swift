//
//  StatisticsSwiftUIView.swift
//  healthyMinD
//
//  Created by Jenny H on 12/5/20.
//

import SwiftUI

struct StatisticsSwiftUIView: View {
    
    @State var pickerSelectedItem = 0
        
    @State var dataPoints: [[CGFloat]] = [
            [30,60,30,40,100,110,120],
            [50,100,150,140,160,180,100],
            [50,60,70,90,160,170,180]
            
        ]
        
    var body:some View{
            ZStack{
                Color(#colorLiteral(red: 0.5937837362, green: 1, blue: 0.7992791533, alpha: 1)).edgesIgnoringSafeArea(.all)
                VStack {
                    Text("Mood Log")
                        .font(.system(size: 34))
                        .fontWeight(.heavy)
                        .foregroundColor(.black)
                    
                    Picker(selection: $pickerSelectedItem, label: Text("")){
                        Text("Week 1").tag(0)
                        Text("Week 2").tag(1)
                        Text("Week 3").tag(2)
                    }.pickerStyle(SegmentedPickerStyle())
                        .padding(.horizontal,24)
                    
                    HStack (spacing: 16) {
                        VStack{
                            BarView(value: dataPoints[pickerSelectedItem][0])
                            Text("m").foregroundColor(.black).padding(.top,8)
                        }
                        VStack{
                            BarView(value: dataPoints[pickerSelectedItem][1])
                            Text("tu").foregroundColor(.black).padding(.top,8)
                        }
                        VStack{
                            BarView(value: dataPoints[pickerSelectedItem][2])
                            Text("w").foregroundColor(.black).padding(.top,8)
                        }
                        VStack{
                            BarView(value: dataPoints[pickerSelectedItem][3])
                            Text("th").foregroundColor(.black).padding(.top,8)
                        }
                        VStack{
                            BarView(value: dataPoints[pickerSelectedItem][4])
                            Text("f").foregroundColor(.black).padding(.top,8)
                        }
                        VStack{
                            BarView(value: dataPoints[pickerSelectedItem][5])
                            Text("s").foregroundColor(.black).padding(.top,8)
                        }
                        VStack{
                            BarView(value: dataPoints[pickerSelectedItem][6])
                            Text("su").foregroundColor(.black).padding(.top,8)
                        }
            
                        //BarView(value: dataPoints[pickerSelectedItem][0])
                        //Text("m").foregroundColor(.black).padding(.top,8)
                        //BarView(value: dataPoints[pickerSelectedItem][1])
                        //Text("t").foregroundColor(.black).padding(.top,8)
                        //BarView(value: dataPoints[pickerSelectedItem][2])
                        //BarView(value: dataPoints[pickerSelectedItem][3])
                        //BarView(value: dataPoints[pickerSelectedItem][4])
                        //BarView(value: dataPoints[pickerSelectedItem][5])
                        //BarView(value: dataPoints[pickerSelectedItem][6])
                    }.padding(.top,24)
                }
            }
        }
        
}

struct BarView: View {
    var value: CGFloat
    var body: some View{
        //VStack{
            ZStack (alignment: .bottom){
                Capsule().frame(width: 30, height: 200)
                    .foregroundColor(Color(#colorLiteral(red: 0.5937837362, green: 1, blue: 0.7992791533, alpha: 1))) //color literal
                Capsule().frame(width: 30, height: value)
                    .foregroundColor(.white)
            }
            //Text("d").padding(.top,8)
        //}
    }
}


struct StatisticsSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        StatisticsSwiftUIView()
    }
}



