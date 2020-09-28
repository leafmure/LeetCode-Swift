//
//  StringToInteger.swift
//  LeetCode
//
//  Created by Mac on 2020/9/28.
//

import Foundation

class StringToInteger {
    
    static func myAtoi(_ str: String) -> Int {
        // space 32
        let unicodeScalars = str.unicodeScalars.map { $0.value }
        var resultString = ""
        let checkTable:[UInt32:Bool] = [48:true, 49:true, 50:true, 51:true, 52:true, 53:true, 54:true, 55:true, 56:true, 57:true]
        let checkTable2:[UInt32:Bool] = [43:true, 45:true]
        var firstUnicode:UInt32?
        for unicode in unicodeScalars {
            
            if unicode == 32 {
                continue
            }
            
            if checkTable[unicode] ?? false || (checkTable2[unicode] ?? false && resultString.count == 0) {
                break
            }
            
            if checkTable[unicode] ?? false {
                resultString.append(String(UnicodeScalar(unicode)!))
            } else if resultString.count == 0 && (checkTable2[unicode] ?? false) {
                firstUnicode = unicode
                resultString.append(String(UnicodeScalar(unicode)!))
            }
        }
        
        guard let result = Int(resultString) else {
            
            if resultString.count > 11 {
                
                if firstUnicode == 45 {
                    return Int(Int32.min)
                } else {
                    return Int(Int32.max)
                }
            } else {
                return 0
            }
        }
        
        
        if result > Int32.max {
            return Int(Int32.max)
        }
        
        if result < Int32.min {
            return Int(Int32.min)
        }
        
        return result
    }
    
    static func myAtoi2(_ str: String) -> Int {
     
        // - 45 + 43  1-9 48-57
        let temp = str.trimmingCharacters(in: CharacterSet.whitespaces)
        if temp.count < 2 {
            return Int(temp) ?? 0
        }
        
        let unicodeScalars = temp.unicodeScalars.map { $0.value }
        let first = unicodeScalars.first ?? 0
        if !(first == 45 || first == 43 || (first >= 48 && first <= 57)) {
            return 0
        }
        
        var endIndex = 1
        while endIndex < unicodeScalars.count  {
            let unicode = unicodeScalars[endIndex]
            if !(unicode >= 48 && unicode <= 57) {
                break
            }
            endIndex += 1
        }
       
        guard let result = Int(temp.prefix(endIndex)) else {
            
            if endIndex > 11 {
                
                if first == 45 {
                    return Int(Int32.min)
                } else {
                    return Int(Int32.max)
                }
            } else {
                return 0
            }
        }
        
        if result > Int32.max {
            return Int(Int32.max)
        }
        
        if result < Int32.min {
            return Int(Int32.min)
        }
        
        return result
    }
}
