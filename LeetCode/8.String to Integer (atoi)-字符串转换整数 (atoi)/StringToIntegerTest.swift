//
//  StringToIntegerTest.swift
//  LeetCode
//
//  Created by Mac on 2020/9/28.
//

import Foundation

class StringToIntegerTest: TestProtocol {
    
    var intput = ""
    var check = 0
    
    func testData() {
        intput = "42"
        check = 42
    }
    
    func testTargetCode() -> Any {
        return StringToInteger.myAtoi(intput)
    }
    
    func checkResult(result: Any) -> Bool {
        if let resultValue = result as? Int {
            return resultValue == check
        }
        return false
    }
    
}
