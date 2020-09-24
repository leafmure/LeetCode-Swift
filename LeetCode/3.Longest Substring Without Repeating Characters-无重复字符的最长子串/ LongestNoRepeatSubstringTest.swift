//
//   LongestNoRepeatSubstringTest.swift
//  LeetCode
//
//  Created by Mac on 2020/9/24.
//

import Foundation

class LongestNoRepeatSubstringTest:TestProtocol {
    
    var input:String = ""
    var check:Int = 0
    
    func testData() {

        input = "tmmzuxt"
        check = 5
    }
    
    func testTargetCode() -> Any {
        return LongestNoRepeatSubstring.lengthOfLongestSubstring(input)
    }
    
    func checkResult(result: Any) -> Bool {
        
        if let resultValue = result as? Int {
            return resultValue == check
        }
        return false
    }
    
    
    
}
