//
//  ZigZagConversion.swift
//  LeetCode
//
//  Created by Mac on 2020/9/27.
//

import Foundation

class ZigZagConversion {
    
    static func convert(_ s: String, _ numRows: Int) -> String {
        
        if s.count <= 2 || numRows == 1 {
            return s
        }
        
        let compent = 2 * numRows - 2
        var tab = Array(repeating: "", count: numRows)
        for (index, char) in s.enumerated() {
            
            let mod = index % compent
            if mod < numRows {
                tab[mod].append("\(char)")
            } else {
                let tempindex = 2 * numRows - 2 - mod
                tab[tempindex].append("\(char)")
            }
        }
        return tab.joined()
    }
    
    static func convert2(_ s: String, _ numRows: Int) -> String {
        
        if s.count <= 2 || numRows == 1 {
            return s
        }
        
        let compent = 2 * numRows - 2
        var result = ""
        for index1 in 0..<compent {
            
            for index2 in numRows...0 {
                
                
            }
        }
        
        return ""
    }
}
