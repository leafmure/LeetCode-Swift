//
//  TestProtocol.swift
//  LeetCode
//
//  Created by Mac on 2020/9/22.
//

import Foundation

protocol TestProtocol {
    
    /// 开始测试
    func test()
    /// 测试体
    func testTargetCode() -> Any
    /// 检验结果
    func checkResult(result: Any) -> Bool
}

extension TestProtocol {
    
    func test() {
        let startTime = CFAbsoluteTimeGetCurrent()
        let result = testTargetCode()
        let linkTime = CFAbsoluteTimeGetCurrent() - startTime
        let checkStatus = checkResult(result: result)
        print("\(checkStatus ? "✅ 通过" : "❌ 失败"), 耗时：\(String(format: "%0.3fms", linkTime * 1000)), 结果：\(result)")
    }
}
