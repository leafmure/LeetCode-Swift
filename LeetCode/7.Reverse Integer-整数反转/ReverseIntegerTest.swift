//
//  ReverseIntegerTest.swift
//  LeetCode
//
//  Created by Mac on 2020/9/28.
//

import Foundation

class ReverseIntegerTest: TestProtocol {
    
    var input:Int = 0
    var check:Int = 0
    
    func testData() {
        input = 10
        check = 1
    }
    
    func testTargetCode() -> Any {
        return ReverseInteger.reverse(input)
    }
    
    func checkResult(result: Any) -> Bool {
        
        if let resultValue = result as? Int {
            return resultValue == check
        }
        return false
    }
    
    
}
