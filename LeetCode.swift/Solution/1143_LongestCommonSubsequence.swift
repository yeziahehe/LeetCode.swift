//
//  1143_LongestCommonSubsequence.swift
//  LeetCode.swift
//
//  Created by 叶帆 on 2020/11/16.
//  Copyright © 2020 Suzhou Coryphaei Information&Technology Co., Ltd. All rights reserved.
//

/**
 给定两个字符串 text1 和 text2，返回这两个字符串的最长公共子序列的长度。

 一个字符串的 子序列 是指这样一个新的字符串：它是由原字符串在不改变字符的相对顺序的情况下删除某些字符（也可以不删除任何字符）后组成的新字符串。
 例如，"ace" 是 "abcde" 的子序列，但 "aec" 不是 "abcde" 的子序列。两个字符串的「公共子序列」是这两个字符串所共同拥有的子序列。

 若这两个字符串没有公共子序列，则返回 0。

  

 示例 1:

 输入：text1 = "abcde", text2 = "ace"
 输出：3
 解释：最长公共子序列是 "ace"，它的长度为 3。
 示例 2:

 输入：text1 = "abc", text2 = "abc"
 输出：3
 解释：最长公共子序列是 "abc"，它的长度为 3。
 示例 3:

 输入：text1 = "abc", text2 = "def"
 输出：0
 解释：两个字符串没有公共子序列，返回 0。
  

 提示:

 1 <= text1.length <= 1000
 1 <= text2.length <= 1000
 输入的字符串只含有小写英文字符。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/longest-common-subsequence
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
import Foundation

// 自底向上的迭代的动态规划思路
class Solution {
    func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
        let m = text1.count
        let n = text2.count
        let s1 = Array(text1)
        let s2 = Array(text2)
        var dp = Array(repeating: Array(repeating: 0, count: n + 1), count: m + 1)
        // 定义：s1[0..i-1] 和 s2[0..j-1] 的 lcs 长度为 dp[i][j]
        // 目标：s1[0..m-1] 和 s2[0..n-1] 的 lcs 长度，即 dp[m][n]
        // base case: dp[0][..] = dp[..][0] = 0
        for i in 1...m {
            for j in 1...n {
                // 现在 i 和 j 从 1 开始，所以要减一
                if s1[i - 1] == s2[j - 1] {
                    dp[i][j] = 1 + dp[i-1][j-1]
                } else {
                    // s1[i-1] 和 s2[j-1] 至少有一个不在 lcs 中
                    dp[i][j] = max(dp[i-1][j], dp[i][j-1])
                }
            }
        }
        return dp[m][n]
    }
}

// 自顶向下带备忘录的动态规划思路
class Solution1 {
    // 备忘录，消除重叠子问题
    var meno: [[Int]]!

    func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
        let m = text1.count
        let n = text2.count
        // 备忘录值为 -1 代表未曾计算
        meno = Array(repeating: Array(repeating: -1, count: n), count: m)
        // 计算 s1[0..] 和 s2[0..] 的 lcs 长度
        return dp(text1, 0, text2, 0)
    }

    // 定义：计算 s1[i..] 和 s2[j..] 的最长公共子序列长度
    func dp(_ s1: String, _ i: Int, _ s2: String, _ j: Int) -> Int {
        // base case
        if i == s1.count || j == s2.count {
            return 0
        }
        // 如果之前计算过，则直接返回备忘录中的答案
        if meno[i][j] != -1 {
            return meno[i][j]
        }
        // 根据 s1[i] 和 s2[j] 的情况做选择
        if Array(s1)[i] == Array(s2)[j] {
            // s1[i] 和 s2[j] 必然在 lcs 中，
            // 加上 s1[i+1..] 和 s2[j+1..] 中的 lcs 长度，就是答案
            meno[i][j] = 1 + dp(s1, i + 1, s2, j + 1)
        } else {
            // s1[i] 和 s2[j] 中至少有一个字符不在 lcs 中，
            // 穷举三种情况的结果，取其中的最大结果
            meno[i][j] = max(
                // 情况一、s1[i] 不在 lcs 中
                dp(s1, i + 1, s2, j),
                // 情况二、s2[j] 不在 lcs 中
                dp(s1, i, s2, j + 1))
        }
        return meno[i][j]
    }
}
