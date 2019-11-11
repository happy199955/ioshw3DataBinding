//
//  ContentView.swift
//  ioshw3DataBinding
//
//  Created by User02 on 2019/11/11.
//  Copyright © 2019 User02. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var images = ["台北", "基隆", "桃園", "新竹","苗栗","台中","南投","彰化","雲林","嘉義","台南","高雄","屏東","台東","花蓮","宜蘭","澎湖","金門","馬祖"]
    var names = ["台北", "基隆", "桃園", "新竹","宜蘭","苗栗","台中","南投","彰化","雲林","嘉義","台南","高雄","屏東","台東","花蓮","澎湖","金門","馬祖"]
       
    @State private var selectedIndex = 0

    @State private var isSun = true
    
    @State private var playDay = Date()
        
    @State private var hour: CGFloat = 5
        
    @State private var name = ""
        
    @State private var showAlert = false
        
    var body: some View {
        NavigationView {

            VStack {
                
                HStack{
                    Text("你叫什麼名字？")
                    TextField("ex.小明", text: $name, onEditingChanged: { (editing) in
                         print("onEditingChanged", editing) })
                    {
                        print(self.name)
                     }
                     .textFieldStyle(RoundedBorderTextFieldStyle())
                     .padding()
                     .frame(width: 250, height: 50)
                }
                
                
                DatePicker("要出發的日子", selection: $playDay, displayedComponents: .date)
                
                
                HStack{
                    if isSun {
                        Image(systemName: "sun.max.fill")
                            .resizable()
                            .frame(width: 20, height: 20)
                    } else {
                        Image(systemName: "cloud.rain.fill")
                            .resizable()
                            .frame(width: 20, height: 20)
                    }
                    Toggle("天氣", isOn: $isSun)
                }.frame(width: 300, height: 50)
                
                
                HStack{
                    Text("想坐")
                    Text("\(Int(hour))")
                    Text("小時的車")
                    Slider(value: $hour, in: 0...10, step: 1, minimumValueLabel: Text("0"), maximumValueLabel: Text("10")){
                        Text("")
                    }.accentColor(.orange)
                        .frame(width: 200, height: 50)
                }
                
                
                Picker(selection: $selectedIndex, label: Text("地點偏向")) {
                    ForEach(0..<images.count) { (index) in
                        HStack {
                            Text(self.names[index])
                                .foregroundColor(.white)
                        }
                    }
                }
                .background(Color.yellow)
                .frame(width: 400, height: 50)
                .clipped()
              
                
                Image(self.images[self.selectedIndex])
                    .renderingMode(.original)
                    
                
                Button(action: { self.showAlert = true }) {
                        Text("這樣合適嗎？")
                    }.alert(isPresented: $showAlert) { () -> Alert in
                    var comment:String
                
                    if isSun == true && selectedIndex == 0 {
                        if hour <= 2{
                            comment = "很適合喔！出發！"
                        } else {
                            comment = "台北不用坐那麼久啦！"
                        }
                    } else if isSun == true && selectedIndex == 1  {
                        
                        if hour >= 3 && hour <= 5 {
                            comment = "還算可以考慮唷～想走嗎？"
                        } else {
                            comment = "交通時間應該是３～５小時喔！"
                        }
                    } else if isSun == true && selectedIndex == 2 {
                                 
                        if hour >= 5 && hour <= 7 {
                            comment = "還算可以考慮唷～想走嗎？"
                        } else {
                            comment = "交通時間應該是5～7小時喔！"
                        }
                                                             
                    } else if isSun == true && selectedIndex == 3 {
                             
                        if hour >= 5 && hour <= 7 {
                            comment = "還算可以考慮唷～想走嗎？"
                        } else {
                            comment = "交通時間應該是5～7小時喔！"
                        }
                        
                    } else if isSun == true && selectedIndex == 4 {
                        
                        if hour >= 3 && hour <= 5 {
                            comment = "還算可以考慮唷～想走嗎？"
                        } else {
                            comment = "交通時間應該是３～５小時喔！"
                        }
                                                    
                    } else if isSun == true && selectedIndex >= 5 && selectedIndex <= 18 {
                    
                        if hour <= 6 {
                            comment = "還算可以考慮唷～想走嗎？"
                        } else {
                            comment = "交通時間要更久餒！"
                        }
                                                
                    } else if isSun == false {
                        
                        comment = "下雨誒～宅起來！"
                        
                    } else {
                                    
                        comment = "我們還是宅在家好了？"
                        
                    }
                    return Alert(title: Text("親愛的\(name)"), message: Text(comment))
                    }
            }
            .navigationBarTitle("基隆出發走台灣")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

