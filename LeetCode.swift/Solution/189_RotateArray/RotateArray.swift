//
//  RotateArray.swift
//  LeetCode.swift
//
//  Created by 叶帆 on 2020/3/8.
//  Copyright © 2020 Suzhou Coryphaei Information&Technology Co., Ltd. All rights reserved.
//

import Foundation

class Solution {
    func rotate(_ nums: inout [Int], _ k: Int) {
        let i = k % nums.count
        nums = Array(nums[nums.count-i..<nums.count]) + Array(nums[0..<nums.count-i])
    }
}

class Solution1 {
    func rotate(_ nums: inout [Int], _ k: Int) {
        let i = k % nums.count
        reverse(&nums, 0, nums.count - 1)
        reverse(&nums, 0, nums.count - i - 1)
        reverse(&nums, nums.count - i, nums.count - 1)
    }
    
   func reverse(_ nums: inout [Int], _ left: Int, _ right: Int) {
        var l = left
        var r = right
        while (l < r) {
            nums.swapAt(l, r)
            l += 1
            r -= 1
        }
    }
}
