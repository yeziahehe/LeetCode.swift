//
//  MaximumProductOfThreeNumbers.swift
//  LeetCode.swift
//
//  Created by 叶帆 on 2017/11/3.
//  Copyright © 2017年 Suzhou Coryphaei Information&Technology Co., Ltd. All rights reserved.
//

/**
 Given an integer array, find three numbers whose product is maximum and output the maximum product.
 
 Example 1:
    Input: [1,2,3]
    Output: 6
 
 Example 2:
    Input: [1,2,3,4]
    Output: 24
 
 Note:
    1. The length of the given array will be in range [3,104] and all elements are in the range [-1000, 1000].
    2. Multiplication of any three numbers in the input won't exceed the range of 32-bit signed integer.
 */

import Foundation

/**
 Time complexity : O(n). Only one iteration over the numsnums array of length nn is required.
 Space complexity : O(1). Constant extra space is used.
 */

class Solution {
    func maximumProduct(_ nums: [Int]) -> Int {
        var min1 = Int.max
        var min2 = Int.max
        var max1 = Int.min
        var max2 = Int.min
        var max3 = Int.min
        
        for num in nums {
            
            if num <= min1 {
                min2 = min1
                min1 = num
            } else if num <= min2 {
                min2 = num
            }
            
            if num >= max1 {
                max3 = max2
                max2 = max1
                max1 = num
            } else if num >= max2 {
                max3 = max2
                max2 = num
            } else if num >= max3 {
                max3 = num
            }
        }
        
        return max(min1 * min2 * max1, max1 * max2 * max3)
    }
}
