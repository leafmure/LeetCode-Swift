//
//  ReverseInteger.swift
//  LeetCode
//
//  Created by Mac on 2020/9/28.
//

import Foundation

class ReverseInteger {
    
    static func reverse(_ x: Int) -> Int {
        
        var check = x
        var reverInt:Int = 0
        while check != 0 {
            let single:Int = check % 10
            reverInt = reverInt * 10 + single
            check = check / 10
        }
        
        if reverInt > Int32.max || reverInt < Int32.min {
            return 0
        }
        return reverInt
    }
    
    static func reverse2(_ x: Int) -> Int {
        
        let intString:String = "\(abs(x))"
        var array = Array(intString)
        let length:Int = array.count
        var low:Int = (length + 1) / 2 - 1;
        var high:Int = (length + 2) / 2 - 1;
        
        while low >= 0 && high < length {
            
            let t = array[low]
            array[low] = array[high]
            array[high] = t
            low -= 1
            high += 1
        }
        
        let reversedIntString:String = (x < 0) ? "-\(String(array))" : String(array)
        let reversedInt:Int = Int(Int32(reversedIntString) ?? 0)
        return reversedInt
    }
    
    static func reverse3(_ x: Int) -> Int {
        
        let intString:String = "\(abs(x))"
        let reversedIntString:String = (x < 0) ? "-\(String(intString.reversed()))" : String(intString.reversed())
        let reversedInt:Int = Int(Int32(reversedIntString) ?? 0)
        return reversedInt
    }
}
