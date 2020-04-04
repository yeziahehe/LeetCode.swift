//
//  ValidParentheses.swift
//  LeetCode.swift
//
//  Created by 叶帆 on 2020/4/4.
//  Copyright © 2020 Suzhou Coryphaei Information&Technology Co., Ltd. All rights reserved.
//

/**
 Given a string containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.

 An input string is valid if:

 Open brackets must be closed by the same type of brackets.
 Open brackets must be closed in the correct order.
 Note that an empty string is also considered valid.

 Example 1:

 Input: "()"
 Output: true
 Example 2:

 Input: "()[]{}"
 Output: true
 Example 3:

 Input: "(]"
 Output: false
 Example 4:

 Input: "([)]"
 Output: false
 Example 5:

 Input: "{[]}"
 Output: true
 =====
 给定一个只包括 '('，')'，'{'，'}'，'['，']' 的字符串，判断字符串是否有效。

 有效字符串需满足：

 左括号必须用相同类型的右括号闭合。
 左括号必须以正确的顺序闭合。
 注意空字符串可被认为是有效字符串。

 示例 1:

 输入: "()"
 输出: true
 示例 2:

 输入: "()[]{}"
 输出: true
 示例 3:

 输入: "(]"
 输出: false
 示例 4:

 输入: "([)]"
 输出: false
 示例 5:

 输入: "{[]}"
 输出: true

 */

import Foundation

class Solution {
    func isValid(_ s: String) -> Bool {
        var charArray = [Character]()
        for c in s {
            if c == "(" || c == "{" || c == "[" {
                charArray.append(c)
            } else {
                // 右半边
                if charArray.isEmpty {
                    return false
                }
                
                if (c == ")" && charArray.removeLast() != "(") || (c == "]" && charArray.removeLast() != "[") || (c == "}" && charArray.removeLast() != "{") {
                    return false
                }
            }
        }
        return charArray.isEmpty ? true : false
    }
}
