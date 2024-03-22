//
//  MedianTwoSortedArrayTest.swift
//  LeetCode
//
//  Created by Mac on 2020/9/25.
//

import Foundation

class MedianTwoSortedArrayTest:TestProtocol {
    
    var nums1:[Int] = []
    var nums2:[Int] = []
    var check:Double = 0
    
    func testData() {
        nums1 = [1,3]
        nums2 = [2]
        check = 3.5
    }
    
    func testTargetCode() -> Any {
        return MedianTwoSortedArray.findMedianSortedArrays2(nums1, nums2)
    }
    
    func checkResult(result: Any) -> Bool {
        if let resultValue = result as? Double {
            return resultValue == check
        }
        return false
    }
    
}
