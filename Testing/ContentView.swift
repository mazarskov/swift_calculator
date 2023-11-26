//
//  ContentView.swift
//  Testing
//
//  Created by Maksim Azarskov on 02.11.2023.
//

import SwiftUI

public class Calculator {
    var buffer: String = "0"
    var buffer_sum: Float64 = 0
    var previous_action: String = "+"
    var first_step_done: Bool = false
    
    //function that is responsible for displaying the number on
    //calculator screen
    func calcBuffer(_ n: Float64) -> String{
        var cleanNum: String = ""
        if (buffer == "0") {
            buffer = String(n)
            for letter in buffer {
                if letter == "." {
                    break
                }
                buffer = String(letter)
            }
            print(buffer)
        } else {
            for letter in String(n) {
                if letter == "." {
                    break
                }
                cleanNum = String(letter)
            }
            let number = buffer + cleanNum
            buffer = number
            print(buffer)
        }
        let calcText: String = buffer
        return calcText
    }
    
    func addition() {
        buffer_sum += Float64(buffer) ?? 0 //default value in case fail
        buffer = "0"
        previous_action = "+"
        first_step_done = true
    }
    func subtraction() {
        if (previous_action == "+") {
            buffer_sum += Float64(buffer) ?? 0
        } else if (previous_action == "-") {
            buffer_sum -= Float64(buffer) ?? 0
        }
        buffer = "0"
        previous_action = "-"
        first_step_done = true
    }
    func multiply() {
        if (buffer == "0") {
            buffer = "1"
        }
        if (first_step_done == false) {
            buffer_sum = (Float64(buffer) ?? 0) * (buffer_sum + 1)
            
        } else {
            buffer_sum = (Float64(buffer) ?? 0) * buffer_sum
        }
        buffer = "0"
        previous_action = "*"
        first_step_done = true
        
    }
    func divide() {
        if (buffer == "0") {
            buffer = "1"
        }
        if (first_step_done == false) {
            buffer_sum = (Float64(buffer) ?? 0) / (1 + buffer_sum)
            buffer = "0"
            previous_action = "/"
            first_step_done = true
        } else {
            buffer_sum = buffer_sum / (Float64(buffer) ?? 0)
            buffer = "0"
            previous_action = "/"
        }
    }
    func equal() -> Float64 {
        if (previous_action == "+") {
            buffer_sum += Float64(buffer) ?? 0
        } else if (previous_action == "-") {
            buffer_sum -= Float64(buffer) ?? 0
        } else if (previous_action == "*") {
            buffer_sum = buffer_sum * (Float64(buffer) ?? 0)
        } else if (previous_action == "/") {
            if (buffer == "0") {
                print("Cant devide by zero!")
            }
            buffer_sum /= (Float64(buffer) ?? 0)
        }
        if buffer_sum == 0 && buffer == "0" {
            first_step_done = false
        }
        
        buffer = "0"
        first_step_done = true
        previous_action = "+"
        print("Buffer:")
        print(buffer)
        print("Buffer_sum:")
        print(buffer_sum)
        return buffer_sum
    }
    func clear_all() {
        buffer_sum = 0
        buffer = "0"
        previous_action = "+"
        first_step_done = false
    }
    /*
    func switcher() -> String {
        if (Float64(buffer) ?? 0) == 0 {
            buffer = "-"
            return buffer
        } else {
            buffer = String((Float64(buffer) ?? 0) - ((Float64(buffer) ?? 0) * 2));
            return buffer
        }
        
        
    }
    */
    func switcher() -> String {
        if (first_step_done == false) {
            if ((Float64(buffer) ?? 0) < 0) {
                /*
                let resultString = String(buffer.dropFirst())
                print("no! i work")
                return resultString
                 */
                buffer = String(buffer.dropFirst())
                return buffer
            } else if ((Float64(buffer) ?? 0) >  0){
                /*
                let resultString = "-" + buffer
                print("I work!")
                print(buffer)
                return resultString
                 */
                buffer = "-" + buffer
                print("I work!")
                print(buffer)
                return buffer
            } else {
                return buffer
            }
        } else {
            buffer_sum = (Float64(buffer_sum) - (Float64(buffer_sum) * 2));
            return String(buffer_sum)
        }
    }
    
    func makePercent() -> String {
        let percent = (Float64(buffer) ?? 0) / 100
        buffer = String(percent)
        return buffer
    }
}
struct ContentView: View {
    @State private var answerText: String = "Answer goes here"
    let calc = Calculator()
    var body: some View {
        
        
        VStack(spacing: 10.0){
            Spacer()
            Text(answerText).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).padding()
            Spacer()
            HStack {
                Spacer()
                Button {
                    answerText = calc.makePercent()
                } label: {
                    Image(systemName: "percent").foregroundColor(Color.gray).font(.system(size: CGFloat(75)))
                }
                Spacer()
                Button {
                    answerText = calc.switcher()
                    
                } label: {
                    Image(systemName: "plus.forwardslash.minus").foregroundColor(Color.gray).font(.system(size: CGFloat(75)))
                        
                }
                Spacer()
                Button {
                    calc.clear_all()
                    answerText = String(0)
                } label: {
                    Image(systemName: "c.circle.fill").foregroundColor(Color.gray).font(.system(size: CGFloat(75)))
                }
                Spacer()
                Button {
                    calc.divide()
                } label: {
                    Image(systemName: "divide.circle.fill").foregroundColor(Color.orange).font(.system(size: CGFloat(75)))
                }
                Spacer()
            }
            HStack {
                Spacer()
                Button {
                    let displayText = calc.calcBuffer(1)
                    answerText = displayText
                } label: {
                    Image(systemName: "1.circle.fill").font(.system(size: CGFloat(75)))
                }
                Spacer()
                Button {
                    let displayText = calc.calcBuffer(2)
                    answerText = displayText
                } label: {
                    Image(systemName: "2.circle.fill").font(.system(size: CGFloat(75)))
                }
                Spacer()
                Button {
                    let displayText = calc.calcBuffer(3)
                    answerText = displayText
                } label: {
                    Image(systemName: "3.circle.fill").font(.system(size: CGFloat(75)))
                }
                Spacer()
                Button {
                    calc.multiply()
                } label: {
                    Image(systemName: "multiply.circle.fill").foregroundColor(Color.orange).font(.system(size: CGFloat(75)))
                }
                Spacer()

            }
            HStack {
                Spacer()
                Button {
                    let displayText = calc.calcBuffer(4)
                    answerText = displayText
                } label: {
                    Image(systemName: "4.circle.fill").font(.system(size: CGFloat(75)))
                }
                Spacer()
                Button {
                    let displayText = calc.calcBuffer(5)
                    answerText = displayText
                } label: {
                    Image(systemName: "5.circle.fill").font(.system(size: CGFloat(75)))
                }
                Spacer()
                Button {
                    let displayText = calc.calcBuffer(6)
                    answerText = displayText
                } label: {
                    Image(systemName: "6.circle.fill").font(.system(size: CGFloat(75)))
                }
                Spacer()
                Button {
                    calc.subtraction()
                } label: {
                    Image(systemName: "minus.circle.fill").foregroundColor(Color.orange).font(.system(size: CGFloat(75)))
                }
                Spacer()

            }
            HStack {
                Spacer()
                Button {
                    let displayText = calc.calcBuffer(7)
                    answerText = displayText
                } label: {
                    Image(systemName: "7.circle.fill").font(.system(size: CGFloat(75)))
                }
                Spacer()
                Button {
                    let displayText = calc.calcBuffer(8)
                    answerText = displayText
                } label: {
                    Image(systemName: "8.circle.fill").font(.system(size: CGFloat(75)))
                }
                Spacer()
                Button {
                    let displayText = calc.calcBuffer(9)
                    answerText = displayText
                } label: {
                    Image(systemName: "9.circle.fill").font(.system(size: CGFloat(75)))
                }
                Spacer()
                Button {
                    calc.addition()
                } label: {
                    Image(systemName: "plus.circle.fill").foregroundColor(Color.orange).font(.system(size: CGFloat(75)))
                }
                Spacer()

            }
            HStack {
                Spacer()
                Button {
                    let displayText = calc.calcBuffer(0)
                    answerText = displayText
                } label: {
                    Image(systemName: "0.circle.fill").font(.system(size: CGFloat(75)))
                }
                Spacer()
                Button {
                    print("Monkey")
                } label: {
                    Image(systemName: "xmark").font(.system(size: CGFloat(75)))
                }
                Spacer()
                Button {
                   print("Monkey")
                } label: {
                    Image(systemName: "xmark").font(.system(size: CGFloat(75)))
                }
                Spacer()
                Button {
                    answerText = ""
                    let displayText = calc.equal()
                    if let intValue = Int(exactly: displayText) {
                        answerText = String(Int(displayText))
                    } else {
                        answerText = String(displayText)
                    }
                    
                } label: {
                    Image(systemName: "equal.circle.fill").foregroundColor(Color.orange).font(.system(size: CGFloat(75)))
                }
                Spacer()

            }
        }
    }
}


#Preview {
    ContentView()
}


