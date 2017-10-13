//
//  MoveZeroes.swift
//  LeetCode.swift
//
//  Created by 叶帆 on 2017/10/13.
//  Copyright © 2017年 Suzhou Coryphaei Information&Technology Co., Ltd. All rights reserved.
//

/**
 Given an array nums, write a function to move all 0's to the end of it while maintaining the relative order of the non-zero elements.
 
 For example, given nums = [0, 1, 0, 3, 12], after calling your function, nums should be [1, 3, 12, 0, 0].
 
 Note:
 You must do this in-place without making a copy of the array.
 Minimize the total number of operations.
 */

import Foundation

class Solution {
    func moveZeroes(_ nums: inout [Int]) {
        var i = 0
        for num in nums {
            if num != 0 {
                nums[i] = num
                i += 1
            }
        }
        if i < nums.count {
            for zeroIndex in i..<nums.count {
                nums[zeroIndex] = 0
            }
        }
    }
}
