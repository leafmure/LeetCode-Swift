//
//  TwoSum.swift
//  LeetCode
//
//  Created by Mac on 2020/9/22.
//

import Foundation

class TwoSum {
    
    static func twoSum2(_ nums: [Int], _ target: Int) -> [Int] {
        
        var table:[Int:Int] = [:]
        for (index, value) in nums.enumerated() {
            if let firstIndex = table[value] {
                return [firstIndex, index]
            }
            table[(target-value)] = index
        }
        return []
    }
}
