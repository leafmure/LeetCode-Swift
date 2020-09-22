//
//  TwoSumTest.swift
//  LeetCode
//
//  Created by Mac on 2020/9/22.
//

import Foundation

class TwoSumTest:TestProtocol {
    
    let numbers = [2, 11, 7, 13]
    let target = 9
    let checkList = [0,2]
    
    func testTargetCode() -> Any {
        return TwoSum.twoSum2(numbers, target)
    }
    
    func checkResult(result: Any) -> Bool {
        
        if let targetList = result as? [Int] {
            if targetList == checkList {
                return true
            }
        }
        return false
    }
}
