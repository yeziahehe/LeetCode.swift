//
//  053_MaximumSubArray.swift
//  LeetCode.swift
//
//  Created by 叶帆 on 2020/9/6.
//  Copyright © 2020 Suzhou Coryphaei Information&Technology Co., Ltd. All rights reserved.
//

/**
 给定一个整数数组 nums ，找到一个具有最大和的连续子数组（子数组最少包含一个元素），返回其最大和。

 示例:

 输入: [-2,1,-3,4,-1,2,1,-5,4]
 输出: 6
 解释: 连续子数组 [4,-1,2,1] 的和最大，为 6。
 进阶:

 如果你已经实现复杂度为 O(n) 的解法，尝试使用更为精妙的分治法求解。



 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/maximum-subarray
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。*/
import Foundation

class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        let n = nums.count
        if n == 0 {
            return 0
        }
        var dp_0 = nums[0];
        var dp_1 = 0;
        var res = dp_0
        for i in 1..<n {
            // dp[i] = max(nums[i], nums[i] + dp[i-1])
            dp_1 = max(nums[i], dp_0 + nums[i])
            dp_0 = dp_1
            res = max(res, dp_1)
        }
        return res
    }
}
