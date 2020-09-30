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
    
    
    
    
    
    
    
    func isMatch2(_ s: String, _ p: String) -> Bool {
            
        if p.isEmpty {
            return s.isEmpty
        }
            
            let s_table = Array(s)
            let p_table = Array(p)
            
            var s_index = 0
            var p_index = 0
            var isAny = false
            while s_index < s_table.count && p_index < p_table.count {
                
                let s_char = s_table[s_index]
                let p_char = p_table[p_index]
                if p_char == s_char || p_char == "." {
                    
                    s_index += 1
                    p_index += 1
                    if p_index < p_table.count && p_table[p_index] == "*" {
                        isAny = true
                    }
                } else if p_char == "*" {
                    
                    if p_index > 0 {
                        
                        let p_pre_char = p_table[p_index - 1]
                        if p_pre_char == s_char {
                            s_index += 1
                        } else if p_pre_char == "."  {
                            s_index += 1
                            isAny = true
                        } else {
                            p_index += 1
                        }
                    } else {
                        p_index += 1
                    }
                } else if (p_index + 1 <  p_table.count && p_table[p_index + 1] == "*") {
                    p_index += 2
                } else {
                    return false
                }
            }
            
        return (p_index >= p_table.count) 
        }

}
