//
//  MaximumSubarray.swift
//  LeetCode.swift
//
//  Created by 叶帆 on 2017/10/9.
//

/*
Find the contiguous subarray within an array (containing at least one number) which has the largest sum.

For example, given the array [-2,1,-3,4,-1,2,1,-5,4],
the contiguous subarray [4,-1,2,1] has the largest sum = 6.
 */

import Foundation

class Solution {
    
    func maxSubArray(_ nums: [Int]) -> Int {
        
        var sum = 0
        var maxSum = Int.min
        for num in nums {
            sum = max(num, sum + num)
            maxSum = max(maxSum, sum)
        }
        
        return maxSum
    }
}
