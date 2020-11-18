//
//  516_LongestPalindromicSubsequence.swift
//  LeetCode.swift
//
//  Created by 叶帆 on 2020/11/16.
//  Copyright © 2020 Suzhou Coryphaei Information&Technology Co., Ltd. All rights reserved.
//

/**
 给定一个字符串 s ，找到其中最长的回文子序列，并返回该序列的长度。可以假设 s 的最大长度为 1000 。

  

 示例 1:
 输入:

 "bbbab"
 输出:

 4
 一个可能的最长回文子序列为 "bbbb"。

 示例 2:
 输入:

 "cbbd"
 输出:

 2
 一个可能的最长回文子序列为 "bb"。

  

 提示：

 1 <= s.length <= 1000
 s 只包含小写英文字母

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/longest-palindromic-subsequence
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
import Foundation

class Solution {
    func longestPalindromeSubseq(_ s: String) -> Int {
        let n = s.count
        let s = Array(s)
        // dp 数组全部初始化为 0
        var dp = Array(repeating: Array(repeating: 0, count: n), count: n)
        // base case
        // 对角线是 i = j 的情况，此时回文就是本身字符
        for i in 0..<n {
            dp[i][i] = 1
        }
        // 反着遍历保证正确的状态转移
        // 为了保证每次计算dp[i][j]，左、下、左下三个方向的位置已经被计算出来
        // 只能斜着遍历或者反着遍历
        for i in (0..<n).reversed() {
            for j in i+1..<n {
                // 状态转移方程
                if s[i] == s[j] {
                    dp[i][j] = 2 + dp[i+1][j-1]
                } else {
                    dp[i][j] = max(dp[i][j-1], dp[i+1][j])
                }
            }
        }
        // 整个 s 的最长回文子串长度
        return dp[0][n-1]
    }
}
