//
//  RegularExpressionMatchingTest.swift
//  LeetCode
//
//  Created by Mac on 2020/9/30.
//

import Foundation

class RegularExpressionMatchingTest: TestProtocol {
    
    var s = ""
    var p = ""
    var check:Bool = false
    
    func testData() {
        
        
        s = "aaaa"
        p = "a.*a.*c*b*a"
        check = true
    }
    
    func testTargetCode() -> Any {
        return RegularExpressionMatching.isMatch(s, p)
    }
    
    func checkResult(result: Any) -> Bool {
        
        if let resultValue = result as? Bool {
            return resultValue == check
        }
        return false
    }
    
    
}
