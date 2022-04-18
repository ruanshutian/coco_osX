//
//  main.swift
//  ch1
//
//  Created by Aron Ruan on 2022/4/18.
//

import Foundation

print("Hello, World!")

//用 let 来声明常量，用 var 来声明变量。
let maximumNumberOfLoginAttempts = 10
var currentLoginAttempt = 0

var x=0.0,y=0.0,z=0.0
print(x,y,z)

var welcomeMessage:String
welcomeMessage = "Hello"
print(welcomeMessage)

var red,green,blue:Double


//
let pi=3.14159
let 你好="你好世界"
let 🐶🐮 = "dogcow"

print(pi)
print(你好)
print("🐶🐮 = ",🐶🐮)

//用 let 来声明常量，用 var 来声明变量。

var friendltWelcome = "Hello"
friendltWelcome = "Bonjour"

let languangeName = "Swift"
//languangeName = "SwiftAndC++"//常量的值一旦被确定就不能更改

//print(_:separator:terminator:)将常量或变量名放入圆括号中，并在开括号前使用反斜杠将其转义
print("The current value of friendlyWelcome is \(friendltWelcome)")

let minValue = UInt8.min
let maxValue = UInt8.max

print(minValue,maxValue)
print(UInt16.min,UInt16.max)

//类型安全和类型推断
let decimalInteger = 17
let binaryInteger = 0b10001
let octalInteger = 0o21
let hexaldeciamlInteger = 0x11

print(decimalInteger,binaryInteger,octalInteger,hexaldeciamlInteger)
//整数和浮点数都可以添加额外的零并且包含下划线，并不会影响字面量：
let oneMillion = 1_000_000.000_000_1
print(oneMillion)

//如果数字超出了常量或者变量可存储的范围，编译的时候会报错
//let cannotBeNegative:UInt8=-1
//let tooNig:Int8 = Int8.max + 1

let three = 3
let pointOneFourOneFive = 0.14159
let pi2 = Double(three) + pointOneFourOneFive
print(pi2)

//类型别名
typealias AndioSample = UInt16

var minAmplitudeDound = AndioSample.min
print(minAmplitudeDound)

let orangesAreOrange = true
let turnipsAreDelicious = false

let http404Error = (404, "Not Found")
// http404Error 的类型是 (Int, String)，值是 (404, "Not Found")
let (statusCode, statusMessage) = http404Error
print("The status code is \(statusCode)")
// 输出“The status code is 404”
print("The status message is \(statusMessage)")
// 输出“The status message is Not Found”
let (justTheStatusCode, _) = http404Error
print("The status code is \(justTheStatusCode)")
// 输出“The status code is 404”
print("The status code is \(http404Error.0)")
// 输出“The status code is 404”
print("The status message is \(http404Error.1)")
// 输出“The status message is Not Found”

let http200Status = (statusCode: 200, description: "OK")
print("The status code is \(http200Status.statusCode)")
// 输出“The status code is 200”
print("The status message is \(http200Status.description)")
// 输出“The status message is OK”

