//
//   AddTwoNumbers.swift
//  LeetCode
//
//  Created by Mac on 2020/9/23.
//

import Foundation

/**
 * Definition for singly-linked list.
 */
public class ListNode:CustomStringConvertible {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
    
    public var description: String {
        return "\(self.toNumber())"
    }
    
    private func toNumber() -> [Int] {
        
        var numbers:[Int] = []
        var repeatNode = self
        while true {
            numbers.append(repeatNode.val)
            if let next = repeatNode.next {
                repeatNode = next
            } else {
                break
            }
        }
        return numbers
    }
}
 
class AddTwoNumbers {
    
    static func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        
        var repeatNode1 = l1
        var repeatNode2 = l2
        var result:ListNode?
        var nextRepeatNode:ListNode?
        var isEnterOne = false
        
        while repeatNode1 != nil || repeatNode2 != nil {
          
            var sum = (repeatNode1?.val ?? 0) + (repeatNode2?.val ?? 0)
            if isEnterOne {
                sum = sum + 1
                isEnterOne = false
            }
            
            if sum >= 10 {
                sum = (sum % 10)
                isEnterOne = true
            }
            
            if let nextNode = nextRepeatNode {
                nextNode.next = ListNode(sum)
                nextRepeatNode = nextNode.next
            } else {
                nextRepeatNode = ListNode(sum)
                result = nextRepeatNode
            }
            
            repeatNode1 = repeatNode1?.next
            repeatNode2 = repeatNode2?.next
        }
        
        if isEnterOne == true {
            nextRepeatNode?.next = ListNode(1)
        }
        
        return result
    }
    
    static func getNumber(_ node: ListNode?) -> [Int] {
        
        guard let listNode = node else {
            return []
        }
        
        var numbers:[Int] = []
        var repeatNode = listNode
        while true {
            numbers.append(repeatNode.val)
            if let next = repeatNode.next {
                repeatNode = next
            } else {
                break
            }
        }
        return numbers
    }
    
    static func newNode(number:[Int]) -> ListNode? {

        var result:ListNode?
        var nextRepeatNode:ListNode?
        for n in number {
            if let nextNode = nextRepeatNode {
                nextNode.next = ListNode(n)
                nextRepeatNode = nextNode.next
            } else {
                nextRepeatNode = ListNode(n)
                result = nextRepeatNode
            }
        }
        return result
    }
    
}
