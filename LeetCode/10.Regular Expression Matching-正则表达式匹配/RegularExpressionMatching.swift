//
//  RegularExpressionMatching.swift
//  LeetCode
//
//  Created by Mac on 2020/9/30.
//

import Foundation

class RegularExpressionMatching {
    
    
    static func isMatch(_ s: String, _ p: String) -> Bool {
        
        if p.isEmpty {
            return s.isEmpty
        }
            
        let signIndex = p.index(p.startIndex, offsetBy: 1)
            
        let firstCharacterMatch = s.first == p.first || p.first == "."
            
        if p.count >= 2 && p[signIndex] == "*" {
            return isMatch(s, String(p[p.index(p.startIndex, offsetBy: 2)..<p.endIndex])) || (firstCharacterMatch && !s.isEmpty && isMatch(String(s[s.index(s.startIndex, offsetBy: 1)..<s.endIndex]), p))
        } else {
            return !s.isEmpty && (firstCharacterMatch && isMatch(String(s[s.index(s.startIndex, offsetBy: 1)..<s.endIndex]), String(p[p.index(p.startIndex, offsetBy: 1)..<p.endIndex])))
        }
    }
    
    
    static func isMatch2(_ s: String, _ p: String) -> Bool {
        
        let s_chars = Array(s)
        let p_chars = Array(p)
        let s_chars_length = s_chars.count
        let p_chars_length = p_chars.count
        var matchTable = Array(repeating: Array(repeating: false, count: p_chars_length + 1), count: s_chars_length + 1)
        matchTable[0][0] = true
        for i in 0..<s_chars_length + 1 {
            for j in 1..<p_chars_length + 1 {
                print("开始处理 \(i) - \(j)")
                if p_chars[j-1] == "*" {
                    matchTable[i][j] = matchTable[i][j-2]
                    if matches(s_chars: s_chars, p_chars: p_chars, i: i, j: j-1) {
                        matchTable[i][j] = matchTable[i][j] || matchTable[i-1][j]
                    }
                } else {
                    if matches(s_chars: s_chars, p_chars: p_chars, i: i, j: j) {
                        matchTable[i][j] = matchTable[i-1][j-1]
                    }
                }
            }
        }
        return matchTable[s_chars_length][p_chars_length]
    }
    
    static func matches(s_chars: [String.Element], p_chars: [String.Element], i: Int, j: Int) -> Bool {
        if i == 0 { return false }
        if p_chars[j-1] == "." {
            return true
        }
        return s_chars[i-1] == p_chars[j-1]
    }

}
