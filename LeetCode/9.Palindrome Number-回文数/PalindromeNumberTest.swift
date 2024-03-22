//
//  PalindromeNumberTest.swift
//  LeetCode
//
//  Created by Mac on 2020/9/29.
//

import Foundation

class PalindromeNumberTest:TestProtocol {
    
    var input:Int = 0
    var check:Bool = false
    
    func testData() {
        input = 10
        check = false
    }
    
    func testTargetCode() -> Any {
        return PalindromeNumber.isPalindrome(input)
    }
    
    func checkResult(result: Any) -> Bool {
        
        if let resultValue = result as? Bool {
            return resultValue == check
        }
        return false
    }
    
    
}
