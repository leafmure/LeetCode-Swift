//
//  ZigZagConversionTest.swift
//  LeetCode
//
//  Created by Mac on 2020/9/27.
//

import Foundation

class ZigZagConversionTest: TestProtocol {
    
    var input = ""
    var rows = 0
    var check = ""
    
    func testData() {
        input = "LEETCODEISHIRING"
        rows = 3
        check = "LCIRETOESIIGEDHN"
    }
    
    func testTargetCode() -> Any {
        return ZigZagConversion.convert(input, rows)
    }
    
    func checkResult(result: Any) -> Bool {
        if let resultValue = result as? String {
            return resultValue == check
        }
        return false
    }
    
    
}
