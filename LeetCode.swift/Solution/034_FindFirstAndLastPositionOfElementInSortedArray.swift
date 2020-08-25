//
//  034_FindFirstAndLastPositionOfElementInSortedArray.swift
//  LeetCode.swift
//
//  Created by 叶帆 on 2020/8/24.
//  Copyright © 2020 Suzhou Coryphaei Information&Technology Co., Ltd. All rights reserved.
//

/**
 给定一个按照升序排列的整数数组 nums，和一个目标值 target。找出给定目标值在数组中的开始位置和结束位置。

 你的算法时间复杂度必须是 O(log n) 级别。

 如果数组中不存在目标值，返回 [-1, -1]。

 示例 1:

 输入: nums = [5,7,7,8,8,10], target = 8
 输出: [3,4]
 示例 2:

 输入: nums = [5,7,7,8,8,10], target = 6
 输出: [-1,-1]


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/find-first-and-last-position-of-element-in-sorted-array
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
import Foundation

class Solution {
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        return [leftBound(nums, target), rightBound(nums, target)]
    }

    func leftBound(_ nums: [Int], _ target: Int) -> Int {
        var left = 0
        var right = nums.count - 1
        while left <= right {
            let mid = left + (right - left) >> 1
            if nums[mid] == target {
                right = mid - 1
            } else if nums[mid] < target {
                left = mid + 1
            } else if nums[mid] > target {
                right = mid - 1
            }
        }
        if left >= nums.count || nums[left] != target {
            return -1
        }
        return left
    }

    func rightBound(_ nums: [Int], _ target: Int) -> Int {
        var left = 0
        var right = nums.count - 1
        while left <= right {
            let mid = left + (right - left) >> 1
            if nums[mid] == target {
                left = mid + 1
            } else if nums[mid] < target {
                left = mid + 1
            } else if nums[mid] > target {
                right = mid - 1
            }
        }
        if right < 0 || nums[right] != target {
            return -1
        }
        return right
    }
}
