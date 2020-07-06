//
//  044_WildcardMatching.swift
//  LeetCode.swift
//
//  Created by 叶帆 on 2020/7/5.
//  Copyright © 2020 Suzhou Coryphaei Information&Technology Co., Ltd. All rights reserved.
//

/**
 Given an input string (s) and a pattern (p), implement wildcard pattern matching with support for '?' and '*'.

 '?' Matches any single character.
 '*' Matches any sequence of characters (including the empty sequence).
 The matching should cover the entire input string (not partial).

 Note:

 s could be empty and contains only lowercase letters a-z.
 p could be empty and contains only lowercase letters a-z, and characters like ? or *.
 Example 1:

 Input:
 s = "aa"
 p = "a"
 Output: false
 Explanation: "a" does not match the entire string "aa".
 Example 2:

 Input:
 s = "aa"
 p = "*"
 Output: true
 Explanation: '*' matches any sequence.
 Example 3:

 Input:
 s = "cb"
 p = "?a"
 Output: false
 Explanation: '?' matches 'c', but the second letter is 'a', which does not match 'b'.
 Example 4:

 Input:
 s = "adceb"
 p = "*a*b"
 Output: true
 Explanation: The first '*' matches the empty sequence, while the second '*' matches the substring "dce".
 Example 5:

 Input:
 s = "acdcb"
 p = "a*c?b"
 Output: false
 ======
 给定一个字符串 (s) 和一个字符模式 (p) ，实现一个支持 '?' 和 '*' 的通配符匹配。

 '?' 可以匹配任何单个字符。
 '*' 可以匹配任意字符串（包括空字符串）。
 两个字符串完全匹配才算匹配成功。

 说明:

 s 可能为空，且只包含从 a-z 的小写字母。
 p 可能为空，且只包含从 a-z 的小写字母，以及字符 ? 和 *。
 示例 1:

 输入:
 s = "aa"
 p = "a"
 输出: false
 解释: "a" 无法匹配 "aa" 整个字符串。
 示例 2:

 输入:
 s = "aa"
 p = "*"
 输出: true
 解释: '*' 可以匹配任意字符串。
 示例 3:

 输入:
 s = "cb"
 p = "?a"
 输出: false
 解释: '?' 可以匹配 'c', 但第二个 'a' 无法匹配 'b'。
 示例 4:

 输入:
 s = "adceb"
 p = "*a*b"
 输出: true
 解释: 第一个 '*' 可以匹配空字符串, 第二个 '*' 可以匹配字符串 "dce".
 示例 5:

 输入:
 s = "acdcb"
 p = "a*c?b"
 输出: false

 */
import Foundation

class Solution {
    func isMatch(_ s: String, _ p: String) -> Bool {
        let m = s.count
        let n = p.count
        let sStr = Array(s)
        let pStr = Array(p)
        var dp: [[Bool]] = Array(repeating: Array(repeating: false, count: n + 1), count: m + 1)
        dp[0][0] = true
        for i in 1...n {
            if pStr[i - 1] == "*" {
                dp[0][i] = true
            } else {
                break
            }
        }
        for i in 1...m {
            for j in 1...n {
                if pStr[j - 1] == "*" {
                    dp[i][j] = dp[i][j - 1] || dp[i - 1][j]
                } else if pStr[j - 1] == "?" || sStr[i - 1] == pStr[j - 1] {
                    dp[i][j] = dp[i - 1][j - 1]
                }
            }
        }
        return dp[m][n]
    }
}
