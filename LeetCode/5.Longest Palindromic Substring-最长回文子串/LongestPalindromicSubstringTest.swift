//
//  LongestPalindromicSubstringTest.swift
//  LeetCode
//
//  Created by Mac on 2020/9/27.
//

import Foundation

class LongestPalindromicSubstringTest:TestProtocol {
    
    var input:String = ""
    var check:String = ""
    
    func testData() {
        input = "ab"
        check = "a"
    }
    
    func testTargetCode() -> Any {
        return LongestPalindromicSubstring.longestPalindrome(input)
    }
    
    func checkResult(result: Any) -> Bool {
        
        if let resultValue = result as? String {
            return check == resultValue
        }
        return false
    }
    
    
}
