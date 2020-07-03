//
//  718_MaximumLengthOfRepeatedSubarray.swift
//  LeetCode.swift
//
//  Created by 叶帆 on 2020/7/1.
//  Copyright © 2020 Suzhou Coryphaei Information&Technology Co., Ltd. All rights reserved.
//

/**
 Given two integer arrays A and B, return the maximum length of an subarray that appears in both arrays.

 Example 1:

 Input:
 A: [1,2,3,2,1]
 B: [3,2,1,4,7]
 Output: 3
 Explanation:
 The repeated subarray with maximum length is [3, 2, 1].
  

 Note:

 1 <= len(A), len(B) <= 1000
 0 <= A[i], B[i] < 100
 ======
 给两个整数数组 A 和 B ，返回两个数组中公共的、长度最长的子数组的长度。

  

 示例：

 输入：
 A: [1,2,3,2,1]
 B: [3,2,1,4,7]
 输出：3
 解释：
 长度最长的公共子数组是 [3, 2, 1] 。
  

 提示：

 1 <= len(A), len(B) <= 1000
 0 <= A[i], B[i] < 100

 */
import Foundation

class Solution {
    /**
     双层循环找出所有的 i, j 组合，时间复杂度 O(m * n)O(m∗n)，其中 m 和 n 分别为 A 和 B 的 长度。
     如果 A[i] == B[j]，dp[i][j] = dp[i - 1][j - 1] + 1
     否则，dp[i][j] = 0
     */
    func findLength(_ A: [Int], _ B: [Int]) -> Int {
        let n = A.count
        let m = B.count
        var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: m + 1), count: n + 1)
        var res = 0
        for i in 1...n {
            for j in 1...m {
                dp[i][j] = A[i - 1] == B[j - 1] ? dp[i - 1][j - 1] + 1 : 0
                res = max(res, dp[i][j])
            }
        }
        return res
    }
}
