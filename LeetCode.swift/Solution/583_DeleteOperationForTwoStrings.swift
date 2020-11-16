//
//  583_DeleteOperationForTwoStrings.swift
//  LeetCode.swift
//
//  Created by 叶帆 on 2020/11/16.
//  Copyright © 2020 Suzhou Coryphaei Information&Technology Co., Ltd. All rights reserved.
//

/**
 给定两个单词 word1 和 word2，找到使得 word1 和 word2 相同所需的最小步数，每步可以删除任意一个字符串中的一个字符。

  

 示例：

 输入: "sea", "eat"
 输出: 2
 解释: 第一步将"sea"变为"ea"，第二步将"eat"变为"ea"
  

 提示：

 给定单词的长度不超过500。
 给定单词中的字符只含有小写字母。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/delete-operation-for-two-strings
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
import Foundation

class Solution {
    func minDistance(_ word1: String, _ word2: String) -> Int {
        let m = word1.count
        let n = word2.count
        let lcs = longestCommonSubsequence(word1, word2)
        return m - lcs + n - lcs
    }

    func longestCommonSubsequence(_ word1: String, _ word2: String) -> Int {
        let m = word1.count
        let n = word2.count
        if m == 0 || n == 0 {
            return 0
        }
        let s1 = Array(word1)
        let s2 = Array(word2)
        var dp = Array(repeating: Array(repeating: 0, count: n + 1), count: m + 1)
        for i in 1...m {
            for j in 1...n {
                if s1[i-1] == s2[j-1] {
                    dp[i][j] = 1 + dp[i-1][j-1]
                } else {
                    dp[i][j] = max(dp[i-1][j], dp[i][j-1])
                }
            }
        }
        return dp[m][n]
    }
}
