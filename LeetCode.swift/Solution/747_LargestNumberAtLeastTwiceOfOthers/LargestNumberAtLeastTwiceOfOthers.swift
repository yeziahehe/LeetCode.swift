//
//  LargestNumberAtLeastTwiceOfOthers.swift
//  LeetCode.swift
//
//  Created by 叶帆 on 2020/3/5.
//  Copyright © 2020 Suzhou Coryphaei Information&Technology Co., Ltd. All rights reserved.
//

/**
 In a given integer array nums, there is always exactly one largest element.

 Find whether the largest element in the array is at least twice as much as every other number in the array.

 If it is, return the index of the largest element, otherwise return -1.

 Example 1:

 Input: nums = [3, 6, 1, 0]
 Output: 1
 Explanation: 6 is the largest integer, and for every other number in the array x,
 6 is more than twice as big as x.  The index of value 6 is 1, so we return 1.
  

 Example 2:

 Input: nums = [1, 2, 3, 4]
 Output: -1
 Explanation: 4 isn't at least as big as twice the value of 3, so we return -1.
  

 Note:

 nums will have a length in the range [1, 50].
 Every nums[i] will be an integer in the range [0, 99].

 =====
 
 在一个给定的数组nums中，总是存在一个最大元素 。

 查找数组中的最大元素是否至少是数组中每个其他数字的两倍。

 如果是，则返回最大元素的索引，否则返回-1。

 示例 1:

 输入: nums = [3, 6, 1, 0]
 输出: 1
 解释: 6是最大的整数, 对于数组中的其他整数,
 6大于数组中其他元素的两倍。6的索引是1, 所以我们返回1.
  

 示例 2:

 输入: nums = [1, 2, 3, 4]
 输出: -1
 解释: 4没有超过3的两倍大, 所以我们返回 -1.
  

 提示:

 nums 的长度范围在[1, 50].
 每个 nums[i] 的整数范围在 [0, 100].
 
 */

import Foundation

class Solution {
    func dominantIndex(_ nums: [Int]) -> Int {
        if nums.count == 0 {
            return -1
        }
        if nums.count == 1 {
            return 0
        }
        let s = nums.sorted()
        if s[nums.count - 1] >= s[nums.count - 2] * 2 {
            return nums.firstIndex(of: s[nums.count - 1])!
        }
        return -1
    }
}
