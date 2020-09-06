//
//  215_KthLargestElementInAnArray.swift
//  LeetCode.swift
//
//  Created by 叶帆 on 2020/9/6.
//  Copyright © 2020 Suzhou Coryphaei Information&Technology Co., Ltd. All rights reserved.
//

/**
 在未排序的数组中找到第 k 个最大的元素。请注意，你需要找的是数组排序后的第 k 个最大的元素，而不是第 k 个不同的元素。

 示例 1:

 输入: [3,2,1,5,6,4] 和 k = 2
 输出: 5
 示例 2:

 输入: [3,2,3,1,2,4,5,5,6] 和 k = 4
 输出: 4
 说明:

 你可以假设 k 总是有效的，且 1 ≤ k ≤ 数组的长度。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/kth-largest-element-in-an-array
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
import Foundation

class Solution {
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        let n = nums.count
        var vnums = nums
        var left = 0
        var right = n - 1
        let target = n - k
        while true {
            let index = partition(&vnums, left, right)
            if index == target {
                return vnums[index]
            } else if index < target {
                left = index + 1
            } else if index > target {
                right = index - 1
            }
        }
    }

    func partition(_ nums: inout [Int], _ left: Int, _ right: Int) -> Int {
        if left == right {
            return left
        }
        let p = nums[left]
        var j = left
        for i in left+1...right {
            if nums[i] < p {
                // 小于 pivot 的元素都被交换到前面
                j += 1
                nums.swapAt(j, i)
            }
        }
        // 在之前遍历的过程中，满足 [left + 1, j] < pivot，并且 (j, i] >= pivot
        nums.swapAt(j, left);
        // 交换以后 [left, j - 1] < pivot, nums[j] = pivot, [j + 1, right] >= pivot
        return j
    }
}
