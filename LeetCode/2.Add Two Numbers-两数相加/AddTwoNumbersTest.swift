//
//  AddTwoNumbersTest.swift
//  LeetCode
//
//  Created by Mac on 2020/9/23.
//

import Foundation

class AddTwoNumbersTest:TestProtocol {
    
    var l1:ListNode?
    var l2:ListNode?
    var check:[Int] = []
    
    func testData() {
        l1 = AddTwoNumbers.newNode(number: [2,4,3])//[1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1])
        l2 = AddTwoNumbers.newNode(number: [5,6,4])
        check = [7,0,8]//[6,6,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1]
    }
    
    func testTargetCode() -> Any {
        return AddTwoNumbers.addTwoNumbers(l1, l2) ?? ListNode(-1)
    }
    
    func checkResult(result: Any) -> Bool {
        if let node = result as? ListNode {
            return (AddTwoNumbers.getNumber(node) == check)
        }
        return false
    }
}
