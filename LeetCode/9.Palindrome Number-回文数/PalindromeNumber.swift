//
//  PalindromeNumber.swift
//  LeetCode
//
//  Created by Mac on 2020/9/29.
//

import Foundation

class PalindromeNumber {
    
    static func isPalindrome(_ x: Int) -> Bool {
        
        if x < 0 || (x != 0 && x % 10 == 0) { return false }
        
        var check:Int = x
        var reverInt:Int = 0
        while check != 0 {
            let single:Int = check % 10
            reverInt = reverInt * 10 + single
            if reverInt == check {
                return true
            }
            check = check / 10
        }
        return x == reverInt
    }
}
