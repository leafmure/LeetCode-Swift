//
//  MedianTwoSortedArray.swift
//  LeetCode
//
//  Created by Mac on 2020/9/25.
//

import Foundation

class MedianTwoSortedArray {
    
    static func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        
        let count1 = nums1.count
        let count2 = nums2.count
        let leftMid = (count1 + count2 + 1) / 2
        let rightMid = (count1 + count2 + 2) / 2
        if leftMid ==  rightMid {
            return Double(findKofSort(nums1, index1: 0, nums2, index2: 0, k: leftMid))
        } else {
            return Double(findKofSort(nums1, index1: 0, nums2, index2: 0, k: leftMid) + findKofSort(nums1, index1: 0, nums2, index2: 0, k: rightMid)) / 2.0
        }
    }
    
    static func findKofSort(_ nums1: [Int], index1: Int, _ nums2: [Int], index2: Int, k: Int) -> Int {
        
        if index1 >= nums1.count {
            return nums2[k + index2 - 1]
        }
        
        if index2 >= nums2.count {
            return nums1[k + index1 - 1]
        }
        
        if k == 1 {
            return min(nums1[index1], nums2[index2])
        }
        
        let midVal1 = (index1 + k / 2 - 1 < nums1.count) ? nums1[index1 + k / 2 - 1] : Int.max
        let midVal2 = (index2 + k / 2 - 1 < nums2.count) ? nums2[index2 + k / 2 - 1] : Int.max
        if midVal1 < midVal2 {
            return findKofSort(nums1, index1: index1 + k / 2, nums2, index2: index2, k: k - k / 2)
        } else {
            return findKofSort(nums1, index1: index1, nums2, index2: index2 + k / 2, k: k - k / 2)
        }
    }
    
    static func findMedianSortedArrays2(_ nums1: [Int], _ nums2: [Int]) -> Double {
        
        let count1 = nums1.count; let count2 = nums2.count
        var index1 = 0;  var index2 = 0;  var index = 0
        let mid:Int = (count1 + count2) / 2
        let odd = (count1 + count2) % 2 != 0
        var midValue:Int?
        
        while index1 < count1 && index2 < count2 {
           
            let num1 = nums1[index1]
            let num2 = nums2[index2]
            var temp = 0
            if num1 <= num2 {
                temp = num1
                index1 = index1 + 1
            } else {
                temp = num2
                index2 = index2 + 1
            }
            
            if odd {
                if index == mid {
                    return Double(temp)
                }
            } else {
                if index == mid || index == mid - 1 {
                    midValue = (midValue ?? 0) + temp
                }
            }
            
            index = index + 1
            if mid == index - 1 {
                break
            }
        }
                
        if index <= mid && index1 < count1 {
            
            let midIndex = mid - index + index1
            if odd == false && midValue == nil {
                midValue = (midValue ?? 0) + nums1[midIndex - 1]
            }
            midValue = (midValue ?? 0) + nums1[midIndex]
        }
        
        if index <= mid && index2 < count2 {
            
            let midIndex = mid - index + index2
            if odd == false && midValue == nil {
                midValue = (midValue ?? 0) + nums2[midIndex - 1]
            }
            midValue = (midValue ?? 0) + nums2[midIndex]
        }
        
        return (odd == false) ? Double(midValue ?? 0) / 2.0 : Double(midValue ?? 0)
    }
    

}
