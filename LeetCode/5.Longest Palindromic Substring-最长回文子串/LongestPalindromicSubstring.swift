//
//  LongestPalindromicSubstring.swift
//  LeetCode
//
//  Created by Mac on 2020/9/27.
//

import Foundation

class LongestPalindromicSubstring {
    
    /**
     先找出回文的中间部分位置，然后从该位置两边扩散比对
     */
    static func longestPalindrome(_ s: String) -> String {
        
        if s.count <= 1 { return s }
        let unicodeScalars = s.unicodeScalars.map { $0.value }
        var maxLocation = 0
        var maxLength = 0
        var index = 0
        while index < unicodeScalars.count {
            
            var low = index; var high = index;
            while high < unicodeScalars.count - 1 && unicodeScalars[high + 1] == unicodeScalars[low] {
                high = high + 1
            }
            
            index = high
            while low > 0 && high < unicodeScalars.count - 1 && unicodeScalars[low - 1] == unicodeScalars[high + 1] {
                low = low - 1
                high = high + 1
            }
            
            let tempLength = high - low + 1
            if tempLength > maxLength {
                maxLocation = low
                maxLength = tempLength
            }
            index = index + 1
        }
        
        let startIndex = s.index(s.startIndex, offsetBy: maxLocation)
        let endIndex = s.index(startIndex, offsetBy: maxLength)
        return String(s[startIndex..<endIndex])
    }
    
//    static func longestPalindrome2(_ s: String) -> String {
//        
//        let content = "#\(s.unicodeScalars.map { String($0.value) }.joined(separator: "#"))#"
//        
//        
//        for index in s.count - 1...0 {
//            
//            let arm = (index - 1) / 2
//            
//        }
//        return ""
//    }
    
    /**
     遍历字符，从低位和高位开始比对。此算法有太多不必要的循环比如：abcddc, a和b的循环都是冗余的
     */
    static func findPalindromic(_ unicodeScalars: [Int], index: Int) -> NSRange {
        
        var low = index
        var high = unicodeScalars.count - 1
        let lowIndex = index
        var highIndex = unicodeScalars.count - 1
        while low < high {
            
            if unicodeScalars[low] == unicodeScalars[high] {
                low = low + 1
                high = high - 1
            } else if low > index {
                high = highIndex - 1
                highIndex = highIndex - 1
                low = index
            } else {
                high = highIndex - 1
                highIndex = highIndex - 1
            }
        }
        return NSRange(location: lowIndex, length: highIndex - lowIndex + 1)
    }
    
}
