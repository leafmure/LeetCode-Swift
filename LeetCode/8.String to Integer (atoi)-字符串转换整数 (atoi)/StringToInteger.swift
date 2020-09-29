//
//  StringToInteger.swift
//  LeetCode
//
//  Created by Mac on 2020/9/28.
//

import Foundation

class StringToInteger {
    
    // space: 32; -: 45; + : 43; 0-9: 48-57
    static func myAtoi(_ str: String) -> Int {
        
        let unicodeScalars = str.unicodeScalars.map { $0.value }
        let length = unicodeScalars.count
        
        var index = 0
        while index < length && unicodeScalars[index] == 32 {
            index += 1
        }
        
        if index == length {
            return 0
        }
        
        var negativeNumebr:Int = 1
        let firstUnicode = unicodeScalars[index]
        if firstUnicode == 45 {
            negativeNumebr = -1
            index += 1
        } else if firstUnicode == 43 {
            index += 1
        } else if firstUnicode < 48 || firstUnicode > 57 {
            return 0
        }
        
        var result:Int = 0
        while index < unicodeScalars.count {
            
            let unicode = unicodeScalars[index]
            if unicode < 48 || unicode > 57 {
                break
            }
            
            let temp = result * 10 + Int(unicode - 48)
            if temp > Int32.max {
                return Int(negativeNumebr > 0 ? Int32.max : Int32.min)
            }
            result = temp
            index += 1
        }
        return result * negativeNumebr
    }
    
}
