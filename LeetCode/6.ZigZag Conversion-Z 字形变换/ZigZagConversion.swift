//
//  ZigZagConversion.swift
//  LeetCode
//
//  Created by Mac on 2020/9/27.
//

import Foundation

class ZigZagConversion {
    
    /**
     遍历 numRows，计算出每 row 的字符串位置
     */
    static func convert(_ s: String, _ numRows: Int) -> String {
        
        if numRows == 1 || s.count < 3 {
            return s
        }
        
        let charArray:Array<Character> = Array(s)
        let length:Int = charArray.count
        let component:Int = 2 * numRows - 2
        var result:String = ""
        for row in 0..<numRows {
            
            var n:Int = 0
            while n + row < length {
                result.append(String(charArray[row + n]))
                if row != 0 && row != numRows - 1 && n + component - row < length {
                    result.append(String(charArray[n + component - row]))
                }
                n += component
            }
        }
        return result
    }
    
    /**
     遍历字符串计算字符输出后所在位置
     */
    static func convert2(_ s: String, _ numRows: Int) -> String {
        
        if numRows == 1 || s.count < 3 {
            return s
        }
        
        let component = 2 * numRows - 2
        var array = Array(repeating: "", count: numRows)
        for (index, char) in s.enumerated() {
            
            let mod = index % component
            if mod < numRows {
                array[mod].append(String(char))
            } else {
                array[component - mod].append(String(char))
            }
        }
        return array.joined()
    }
    
}
