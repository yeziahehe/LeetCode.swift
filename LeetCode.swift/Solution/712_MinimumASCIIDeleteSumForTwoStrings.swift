//
//  712_MinimumASCIIDeleteSumForTwoStrings.swift
//  LeetCode.swift
//
//  Created by 叶帆 on 2020/11/16.
//  Copyright © 2020 Suzhou Coryphaei Information&Technology Co., Ltd. All rights reserved.
//

/**
 给定两个字符串s1, s2，找到使两个字符串相等所需删除字符的ASCII值的最小和。

 示例 1:

 输入: s1 = "sea", s2 = "eat"
 输出: 231
 解释: 在 "sea" 中删除 "s" 并将 "s" 的值(115)加入总和。
 在 "eat" 中删除 "t" 并将 116 加入总和。
 结束时，两个字符串相等，115 + 116 = 231 就是符合条件的最小和。
 示例 2:

 输入: s1 = "delete", s2 = "leet"
 输出: 403
 解释: 在 "delete" 中删除 "dee" 字符串变成 "let"，
 将 100[d]+101[e]+101[e] 加入总和。在 "leet" 中删除 "e" 将 101[e] 加入总和。
 结束时，两个字符串都等于 "let"，结果即为 100+101+101+101 = 403 。
 如果改为将两个字符串转换为 "lee" 或 "eet"，我们会得到 433 或 417 的结果，比答案更大。
 注意:

 0 < s1.length, s2.length <= 1000。
 所有字符串中的字符ASCII值在[97, 122]之间。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/minimum-ascii-delete-sum-for-two-strings
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
import Foundation

class Solution {
    func minimumDeleteSum(_ s1: String, _ s2: String) -> Int {
        let m = s1.count
        let n = s2.count
        let s1 = Array(s1)
        let s2 = Array(s2)
        var dp = Array(repeating: Array(repeating: 0, count: n + 1), count: m + 1)
        for i in 1...m {
            for j in 1...n {
                if s1[i-1] == s2[j-1] {
                    dp[i][j] = dp[i-1][j-1] + Int((s1[i-1]).asciiValue!)
                } else {
                    dp[i][j] = max(dp[i-1][j], dp[i][j-1])
                }
            }
        }
        var sum = 0
        for i in 0..<m {
            sum += Int((s1[i]).asciiValue!)
        }
        for i in 0..<n {
            sum += Int((s2[i]).asciiValue!)
        }
        return sum - 2 * dp[m][n]
    }
}
