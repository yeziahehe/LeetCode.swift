//
//  IntegerBreak.swift
//  LeetCode.swift
//
//  Created by 叶帆 on 2020/6/26.
//  Copyright © 2020 Suzhou Coryphaei Information&Technology Co., Ltd. All rights reserved.
//

/**
 Given a positive integer n, break it into the sum of at least two positive integers and maximize the product of those integers. Return the maximum product you can get.

 Example 1:

 Input: 2
 Output: 1
 Explanation: 2 = 1 + 1, 1 × 1 = 1.
 Example 2:

 Input: 10
 Output: 36
 Explanation: 10 = 3 + 3 + 4, 3 × 3 × 4 = 36.
 Note: You may assume that n is not less than 2 and not larger than 58.

 ======
 给定一个正整数 n，将其拆分为至少两个正整数的和，并使这些整数的乘积最大化。 返回你可以获得的最大乘积。

 示例 1:

 输入: 2
 输出: 1
 解释: 2 = 1 + 1, 1 × 1 = 1。
 示例 2:

 输入: 10
 输出: 36
 解释: 10 = 3 + 3 + 4, 3 × 3 × 4 = 36。
 说明: 你可以假设 n 不小于 2 且不大于 58。

 */

import Foundation

class Solution {
    func integerBreak(_ n: Int) -> Int {
        if n < 3 {
            return n - 1
        }
        var dp: [Int] = Array(repeating: 0, count: n + 1)
        dp[2] = 1
        for i in 3...n {
            for j in 1..<i {
                /**
                 dp[i] = 维持原状态，不剪
                 dp[i-j]*j = 从 j 处剪一下，减下来的部分是 i-j，i-j 继续剪
                 (i-j)*j = 从 j 处剪一下，减下来的部分是 i-j，i-j 不再剪了
                 */
                dp[i] = max(dp[i], max(dp[i-j] * j, (i - j) * j))
            }
        }
        return dp[n]
    }
}

/**
切分规则：
最优： 3 。把绳子尽可能切为多个长度为 3 的片段，留下的最后一段绳子的长度可能为 0,1,2 三种情况。
次优： 2 。若最后一段绳子长度为 2 ；则保留，不再拆为 1+1 。
最差： 1 。若最后一段绳子长度为 1 ；则应把一份 3 + 1 替换为 2 + 2，因为 2×2>3×1。
*/
class Solution1 {
    func integerBreak(_ n: Int) -> Int {
        // 当 n≤3 时，按照规则应不切分，但由于题目要求必须剪成 m>1 段，因此必须剪出一段长度为 1 的绳子，即返回 n−1 。
        if n < 3 {
            return n - 1
        }
        let a = n / 3
        let b = n % 3
        if b == 0 {
            return NSDecimalNumber(decimal: pow(3, a)).intValue
        } else if b == 1 {
            return NSDecimalNumber(decimal: pow(Decimal(3), a - 1) * 4).intValue
        } else {
            return NSDecimalNumber(decimal: pow(3, a) * 2).intValue
        }
    }
}
