//
//   LongestNoRepeatSubstring .swift
//  LeetCode
//
//  Created by Mac on 2020/9/24.
//

import Foundation

class LongestNoRepeatSubstring  {
    
    static func lengthOfLongestSubstring(_ s: String) -> Int {
        
        let count = s.count
        if count <= 1 { return count }
        
        let unicodeScalars = s.unicodeScalars.map { Int($0.value) }
        var indexs = Array(repeating: -1, count: 128)
        var maxLength = 0
        var repeatIndex:Int = -1
        
        for index in 0..<unicodeScalars.count {
        
            let unicode = unicodeScalars[index]
            repeatIndex = max(repeatIndex, indexs[unicode])
            indexs[unicode] = index
            maxLength = max(maxLength, index - repeatIndex)
        }
        return maxLength
    }
}
