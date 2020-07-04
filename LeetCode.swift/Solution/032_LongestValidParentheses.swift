//
//  032_LongestValidParentheses.swift
//  LeetCode.swift
//
//  Created by 叶帆 on 2020/7/4.
//  Copyright © 2020 Suzhou Coryphaei Information&Technology Co., Ltd. All rights reserved.
//

/**
 Given a string containing just the characters '(' and ')', find the length of the longest valid (well-formed) parentheses substring.

 Example 1:

 Input: "(()"
 Output: 2
 Explanation: The longest valid parentheses substring is "()"
 Example 2:

 Input: ")()())"
 Output: 4
 Explanation: The longest valid parentheses substring is "()()"

 ======
 给定一个只包含 '(' 和 ')' 的字符串，找出最长的包含有效括号的子串的长度。

 示例 1:

 输入: "(()"
 输出: 2
 解释: 最长有效括号子串为 "()"
 示例 2:

 输入: ")()())"
 输出: 4
 解释: 最长有效括号子串为 "()()"

 */
import Foundation

class Solution {
    func longestValidParentheses(_ s: String) -> Int {
        if s.isEmpty {
            return 0
        }
        var dp: [Int] = Array(repeating: 0, count: s.count)
        let str = Array(s)
        for i in 0..<s.count {
            if str[i] == ")" && i > 0 && i - dp[i - 1] > 0 && str[i - dp[i - 1] - 1] == "(" {
                dp[i] = dp[i - 1] + 2 + (i - dp[i - 1] >= 2 ? dp[i - dp[i - 1] - 2] : 0)
            }
        }
        return dp.max()!
    }
}

class Solution1 {
    func longestValidParentheses(_ s: String) -> Int {
        var stack: [Int] = [-1]
        var res = 0
        for (i, c) in s.enumerated() {
            if c == ")" {
                stack.removeLast()
                if stack.isEmpty {
                    stack.append(i)
                } else {
                    res = max(res, i - (stack.last ?? 0))
                }
            } else {
                stack.append(i)
            }
        }
        return res
    }
}
