import Foundation

struct Calc {
    
    var value: String?
    var display: String
    var array: [String]?
    
    //gets current display value
    mutating func getDisplay() -> String {
        //if value is empty, display is "0"
        if value == nil {
            display = "0"
        }
            //otherwise, display = value
        else {
            display = value!
        }
        //remove extraneous decimals
        var checked = false
        while checked == false && display.count > 2 {
            if display.last == "0" || display.last == "." {
                display.remove(at: display.lastIndex(of: display.last!)!)
                display.remove(at: display.lastIndex(of: display.last!)!)
            }
            else {
                checked = true
            }
        }
        //return display value
        value = display
        return display
    }
    
    //check if last value was error
    mutating func checkError() {
        if self.display == "Error" {
            //if error, reinitialize calc
            self = Calc(display: "0")
        }
    }
    
    //store current display value in array
    mutating func storeDisplay(display: String){
        //if array is empty, array contains only display value
        if array == nil {
            array = [display]
        }
            //otherwise, append diplay to array
        else {
            array!.append(display)
        }
        //reset value
        self.value = nil
    }
    
    //computations
    mutating func compute(array: [String]){
        //create array with inputs
        var arr = array
        //if array only has one value, display = that value
        if arr.count ==  1 {
            display =  arr[0]
        }
            //otherwise:
        else {
            var complete = false
            var i = 0
            //loop until array has fewer than 3 values
            while arr.count >= 2 {
                //iterate through array and search for * and /
                while complete == false {
                    //when * is found
                    if arr[i] == "*" {
                        //set arr[i] to equal float values of arr[i-1] * arr[i+1], then convert back to string
                        arr[i] = String(Float(arr[i-1])! * Float(arr[i+1])!)
                        
                        //remove surrounding values
                        arr.remove(at: i+1)
                        arr.remove(at: i-1)
                        
                        //reset i to zero
                        i = 0
                    }
                        //when / is found:
                    else if arr[i] == "/" {
                        //if dividing by zero:
                        if Float(arr[i+1]) == 0 {
                            //value = error
                            self.value = "Error"
                            //refresh display
                            self.display = self.getDisplay()
                            //empty array
                            arr.removeAll()
                            //clear value
                            self.value = nil
                            return
                        }
                            //otherwise:
                        else {
                            //arr[i] equals float values of [i-1] / [i+1] converted back to string
                            arr[i] = String(Float(arr[i-1])! / Float(arr[i+1])!)
                            
                            //remove surrounding values
                            arr.remove(at: i+1)
                            arr.remove(at: i-1)
                            
                            //reset i to zero
                            i = 0
                        }
                    }
                    //if * or / is not found, add 1 to i
                    i += 1
                    //if i >= number of values in array, break loop
                    if i >= arr.count {
                        complete = true
                        
                    }
                }
                
                //reset complete and i
                complete = false
                i = 0
                
                //iterate through and search for + and -
                while complete == false {
                    //when + is found:
                    if arr[i] == "+" {
                        //arr[i] equals float values of arr[i-1] + arr[i+1] converted back to String
                        arr[i] = String(Float(arr[i-1])! + Float(arr[i+1])!)
                        
                        //remove surrounding values
                        arr.remove(at: i+1)
                        arr.remove(at: i-1)
                        
                        //reset i to zero
                        i = 0
                    }
                        //when - is found:
                    else if arr[i] == "-" {
                        //arr[i] equals float values of arr[i-1] - arr[i+1] converted back to String
                        arr[i] = String(Float(arr[i-1])! - Float(arr[i+1])!)
                        
                        //remove surrounding values
                        arr.remove(at: i+1)
                        arr.remove(at: i-1)
                        
                        //reset i to zero
                        i = 0
                    }
                    //if i is neither + nor -, add 1 to i
                    i += 1
                    //if i >= number of values in array, break loop
                    if i >= arr.count {
                        complete = true
                    }
                    
                }
            }
        }
        //set value equal to final computational value
        self.value = arr[0]
        //refresh display
        self.display =  self.getDisplay()
        
        //clear value and array
        self.array = nil
        self.value = nil
    }
    
    //converts to percentage
    mutating func percent() {
        //divides by 100 to convert from percent to decimal
        self.value = String(Float(self.display)! / 100)
    }
    
    //switches to negative value
    mutating func neg() {
        //is display is not empty
        if Float(self.display) != nil {
            //value = display * -1
            self.value = String(Float(self.display)! * -1)
        }
    }
    
    
}
