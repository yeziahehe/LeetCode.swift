//
//  300_LongestIncreasingSubsequence.swift
//  LeetCode.swift
//
//  Created by 叶帆 on 2020/10/12.
//  Copyright © 2020 Suzhou Coryphaei Information&Technology Co., Ltd. All rights reserved.
//

/**
 给定一个无序的整数数组，找到其中最长上升子序列的长度。

 示例:

 输入: [10,9,2,5,3,7,101,18]
 输出: 4
 解释: 最长的上升子序列是 [2,3,7,101]，它的长度是 4。
 说明:

 可能会有多种最长上升子序列的组合，你只需要输出对应的长度即可。
 你算法的时间复杂度应该为 O(n2) 。
 进阶: 你能将算法的时间复杂度降低到 O(n log n) 吗?

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/longest-increasing-subsequence
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
import Foundation

class Solution {
    func lengthOfLIS(_ nums: [Int]) -> Int {
        var top = Array(repeating: 0, count: nums.count)
        var piles = 0
        for i in 0..<nums.count {
            var poker = nums[i]
            var left = 0
            var right = piles
            while left < right {
                let mid = left + (right - left) / 2
                if top[mid] > poker {
                    right = mid
                } else if top[mid] < poker {
                    left = mid + 1
                } else  {
                    right = mid
                }
            }
            if left == piles {
                piles += 1
            }
            top[left] = poker
        }
        return piles
    }
}

class Solution1 {
    func lengthOfLIS(_ nums: [Int]) -> Int {
        var dp = Array(repeating: 1, count: nums.count)
        for i in 0..<nums.count {
            for j in 0..<i {
                if nums[j] < nums[i] {
                    dp[i] = max(dp[i], dp[j] + 1)
                }
            }
        }
        var res = 0
        for i in 0..<nums.count {
            res = max(res, dp[i])
        }
        return res
    }
}
