//
//  FindMinimumInRotatedSortedArrayII.swift
//  LeetCode.swift
//
//  Created by 叶帆 on 2020/6/22.
//  Copyright © 2020 Suzhou Coryphaei Information&Technology Co., Ltd. All rights reserved.
//

/**
 Suppose an array sorted in ascending order is rotated at some pivot unknown to you beforehand.

 (i.e.,  [0,1,2,4,5,6,7] might become  [4,5,6,7,0,1,2]).

 Find the minimum element.

 The array may contain duplicates.

 Example 1:

 Input: [1,3,5]
 Output: 1
 Example 2:

 Input: [2,2,2,0,1]
 Output: 0
 Note:

 This is a follow up problem to Find Minimum in Rotated Sorted Array.
 Would allow duplicates affect the run-time complexity? How and why?


 ======
 假设按照升序排序的数组在预先未知的某个点上进行了旋转。

 ( 例如，数组 [0,1,2,4,5,6,7] 可能变为 [4,5,6,7,0,1,2] )。

 请找出其中最小的元素。

 注意数组中可能存在重复的元素。

 示例 1：

 输入: [1,3,5]
 输出: 1
 示例 2：

 输入: [2,2,2,0,1]
 输出: 0
 说明：

 这道题是 寻找旋转排序数组中的最小值 的延伸题目。
 允许重复会影响算法的时间复杂度吗？会如何影响，为什么？

 */
import Foundation

class Solution {
    func findMin(_ nums: [Int]) -> Int {
        var low = 0
        var high = nums.count - 1
        while low < high {
            if nums[low] < nums[high] {
                return nums[low]
            }
            let mid = (low + high) / 2
            if nums[mid] > nums[high] {
                low = mid + 1
            } else if nums[mid] < nums[high] {
                high = mid
            } else {
                // 处理重复元素
                high -= 1
            }
        }
        return nums[low]
    }
}
