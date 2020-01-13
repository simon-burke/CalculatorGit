//
//  ContentView.swift
//  Calculator
//
//  Created by Simon Burke on 11/18/19.
//  Copyright © 2019 Simon Burke. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var calc = Calc(display: "0")
    
    var body: some View {
        
        //Build VStack of Hstacks
        VStack {
            
            //Screen display
            Text(calc.display)
                .font(.system(size: 50))
                .foregroundColor(.white)
                .multilineTextAlignment(.trailing)
                .background(Color.black)
                .padding(.trailing)
                .frame( maxWidth: .infinity, maxHeight: .infinity, alignment: .trailing)
            
            //HStack contains each button
            HStack (spacing: 0.0) {
                Button(action: {
                    //reset calc
                    self.calc = Calc(display: "0")
                }) {
                    Text("AC")
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .border(Color.black, width: 3.0)
                }
                Button(action: {
                    //check error
                    self.calc.checkError()
                    
                    //convert to negative value
                    self.calc.neg()
                    //refresh display
                    self.calc.display = self.calc.getDisplay()
                }) {
                    Text("+/-")
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .border(Color.black, width: 3.0)
                }
                Button(action: {
                    //check error
                    self.calc.checkError()
                    //if error, reset calc
                    
                    //take percent of display
                    self.calc.percent()
                    
                    //refresh display
                    self.calc.display = self.calc.getDisplay()
                }) {
                    Text("%")
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .border(Color.black, width: 3.0)
                }
                Button(action: {
                    //Checks for error
                    self.calc.checkError()
                    //if error, reset calc
                    
                    //store display value in array
                    self.calc.storeDisplay(display: self.calc.display)
                    //append / to array
                    self.calc.array!.append("/")
                    
                }) {
                    Text("÷")
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color.orange)
                        .border(Color.black, width: 3.0)
                }
            }
            .border(Color.black, width: 3.0)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .foregroundColor(.white)
            .background(Color.gray)
            
            
            //Stack contains buttons 7-9 and x
            HStack (spacing: 0.0) {
                Button(action: {
                    //Each number checks if last value was an error
                    self.calc.checkError()
                    //if so, restarts calc
                    
                    //if calc value is empty, calc value = 7
                    if self.calc.value == nil{
                        self.calc.value = "7"
                    }
                        
                        //otherwise, add a 7 to the end of the string
                    else {
                        self.calc.value! += "7"
                    }
                    
                    //refresh display
                    self.calc.display = self.calc.getDisplay()
                }) {
                    Text("7")
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .border(Color.black, width: 3.0)
                }
                Button(action: {
                    //Each number checks if last value was an error
                    self.calc.checkError()
                    //if so, restarts calc
                    
                    //if calc value is empty, calc value = number
                    if self.calc.value == nil{
                        self.calc.value = "8"
                    }
                        
                        //otherwise, add number to the end of the string
                    else {
                        self.calc.value! += "8"
                    }
                    
                    //refresh display
                    self.calc.display = self.calc.getDisplay()
                }) {
                    Text("8")
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .border(Color.black, width: 3.0)
                }
                Button(action: {
                    //Each number checks if last value was an error
                    self.calc.checkError()
                    //if so, restarts calc
                    
                    //if calc value is empty, calc value = number
                    if self.calc.value == nil{
                        self.calc.value = "9"
                    }
                        
                        //otherwise, add number to the end of the string
                    else {
                        self.calc.value! += "9"
                    }
                    
                    //refresh display
                    self.calc.display = self.calc.getDisplay()
                }) {
                    Text("9")
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .border(Color.black, width: 3.0)
                }
                Button(action: {
                    //Checks for error
                    self.calc.checkError()
                    //if error, reset calc
                    
                    //store display value in array
                    self.calc.storeDisplay(display: self.calc.display)
                    //append * to array
                    self.calc.array!.append("*")
                    
                }) {
                    Text("x")
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color.orange)
                        .border(Color.black, width: 3.0)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .foregroundColor(.white)
            .background(Color.blue)
            .border(Color.black, width: 3.0)
            
            HStack (spacing: 0.0) {
                Button(action: {
                    //Each number checks if last value was an error
                    self.calc.checkError()
                    //if so, restarts calc
                    
                    //if calc value is empty, calc value = number
                    if self.calc.value == nil{
                        self.calc.value = "4"
                    }
                        
                        //otherwise, add number to the end of the string
                    else {
                        self.calc.value! += "4"
                    }
                    
                    //refresh display
                    self.calc.display = self.calc.getDisplay()
                }) {
                    Text("4")
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .border(Color.black, width: 3.0)
                }
                Button(action: {
                    //Each number checks if last value was an error
                    self.calc.checkError()
                    //if so, restarts calc
                    
                    //if calc value is empty, calc value = number
                    if self.calc.value == nil{
                        self.calc.value = "5"
                    }
                        
                        //otherwise, add number to the end of the string
                    else {
                        self.calc.value! += "5"
                    }
                    
                    //refresh display
                    self.calc.display = self.calc.getDisplay()
                }) {
                    Text("5")
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .border(Color.black, width: 3.0)
                }
                Button(action: {
                    //Each number checks if last value was an error
                    self.calc.checkError()
                    //if so, restarts calc
                    
                    //if calc value is empty, calc value = number
                    if self.calc.value == nil{
                        self.calc.value = "6"
                    }
                        
                        //otherwise, add number to the end of the string
                    else {
                        self.calc.value! += "6"
                    }
                    
                    //refresh display
                    self.calc.display = self.calc.getDisplay()
                }) {
                    Text("6")
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .border(Color.black, width: 3.0)
                }
                Button(action: {
                    //Checks for error
                    self.calc.checkError()
                    //if error, reset calc
                    
                    //store display value in array
                    self.calc.storeDisplay(display: self.calc.display)
                    //append + to array
                    self.calc.array!.append("-")
                }) {
                    Text("-")
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color.orange)
                        .border(Color.black, width: 3.0)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .foregroundColor(.white)
            .background(Color.blue)
            .border(Color.black, width: 3.0)
            
            HStack (spacing: 0.0) {
                Button(action: {
                    //Each number checks if last value was an error
                    self.calc.checkError()
                    //if so, restarts calc
                    
                    //if calc value is empty, calc value = number
                    if self.calc.value == nil{
                        self.calc.value = "1"
                    }
                        
                        //otherwise, add number to the end of the string
                    else {
                        self.calc.value! += "1"
                    }
                    
                    //refresh display
                    self.calc.display = self.calc.getDisplay()
                }) {
                    Text("1")
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .border(Color.black, width: 3.0)
                }
                Button(action: {
                    //Each number checks if last value was an error
                    self.calc.checkError()
                    //if so, restarts calc
                    
                    //if calc value is empty, calc value = number
                    if self.calc.value == nil{
                        self.calc.value = "2"
                    }
                        
                        //otherwise, add number to the end of the string
                    else {
                        self.calc.value! += "2"
                    }
                    
                    //refresh display
                    self.calc.display = self.calc.getDisplay()
                }) {
                    Text("2")
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .border(Color.black, width: 3.0)
                }
                Button(action: {
                    //Each number checks if last value was an error
                    self.calc.checkError()
                    //if so, restarts calc
                    
                    //if calc value is empty, calc value = number
                    if self.calc.value == nil{
                        self.calc.value = "3"
                    }
                        
                        //otherwise, add number to the end of the string
                    else {
                        self.calc.value! += "3"
                    }
                    
                    //refresh display
                    self.calc.display = self.calc.getDisplay()
                }) {
                    Text("3")
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .border(Color.black, width: 3.0)
                }
                Button(action: {
                    //Checks for error
                    self.calc.checkError()
                    //if error, reset calc
                    
                    //store display value in array
                    self.calc.storeDisplay(display: self.calc.display)
                    //append + to array
                    self.calc.array!.append("+")
                }) {
                    Text("+")
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color.orange)
                        .border(Color.black, width: 3.0)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .foregroundColor(.white)
            .background(Color.blue)
            .border(Color.black, width: 3.0)
            
            HStack (spacing: 0.0) {
                Button(action: {
                    //Each number checks if last value was an error
                    self.calc.checkError()
                    //if so, restarts calc
                    
                    //if calc value is empty, calc value = number
                    if self.calc.value == nil{
                        self.calc.value = "0"
                    }
                        
                        //otherwise, add number to the end of the string
                    else {
                        self.calc.value! += "0"
                    }
                    
                    //refresh display
                    self.calc.display = self.calc.getDisplay()
                }) {
                    Text("0")
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .border(Color.black, width: 3.0)
                }
                HStack (spacing: 0.0){
                    Button(action: {
                        //Check error
                        self.calc.checkError()
                        //if error, reset calc
                        
                        //if calc value is empty, value = "0."
                        if self.calc.value == nil{
                            self.calc.value = "0."
                        }
                            //otherwise, add "." to end of string
                        else {
                            self.calc.value! += "."
                        }
                        
                        //refresh display
                        self.calc.display = self.calc.getDisplay()
                    }) {
                        Text(".")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .border(Color.black, width: 3.0)
                    }
                    Button(action: {
                        //Check for error
                        self.calc.checkError()
                        
                        //store last display value in array
                        self.calc.storeDisplay(display: self.calc.display)
                        //compute
                        self.calc.compute(array: self.calc.array!)
                    }) {
                        Text("=")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(Color.orange)
                            .border(Color.black, width: 3.0)
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .foregroundColor(.white)
            .background(Color.blue)
            .border(Color.black, width: 3.0)
            
        }
        .font(.system(size:50))
        .background(Color.black)
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
