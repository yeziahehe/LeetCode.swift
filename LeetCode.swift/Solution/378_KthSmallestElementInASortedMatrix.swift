//
//  378_KthSmallestElementInASortedMatrix.swift
//  LeetCode.swift
//
//  Created by 叶帆 on 2020/7/3.
//  Copyright © 2020 Suzhou Coryphaei Information&Technology Co., Ltd. All rights reserved.
//

/**
 Given a n x n matrix where each of the rows and columns are sorted in ascending order, find the kth smallest element in the matrix.

 Note that it is the kth smallest element in the sorted order, not the kth distinct element.

 Example:

 matrix = [
    [ 1,  5,  9],
    [10, 11, 13],
    [12, 13, 15]
 ],
 k = 8,

 return 13.
 Note:
 You may assume k is always valid, 1 ≤ k ≤ n2.

 ======
 给定一个 n x n 矩阵，其中每行和每列元素均按升序排序，找到矩阵中第 k 小的元素。
 请注意，它是排序后的第 k 小元素，而不是第 k 个不同的元素。

  

 示例：

 matrix = [
    [ 1,  5,  9],
    [10, 11, 13],
    [12, 13, 15]
 ],
 k = 8,

 返回 13。
  

 提示：
 你可以假设 k 的值永远是有效的，1 ≤ k ≤ n2 。

 */
import Foundation

class Solution {
    func kthSmallest(_ matrix: [[Int]], _ k: Int) -> Int {
        let len = matrix.count
        var left = matrix[0][0]
        var right = matrix[len - 1][len - 1]
        while left < right {
            let mid = left + (right - left) >> 1
            if check(matrix, mid, k, len) {
                right = mid
            } else {
                left = mid + 1
            }
        }
        return left
    }

    /** 检测小于 mid 的数量是否比 k 多 */
    func check(_ matrix :[[Int]], _ mid : Int, _ k : Int, _ n :Int) -> Bool {
        var i = n - 1
        var j = 0
        var num = 0
        while i >= 0 && j < n {
            // 从左下角开始
            if matrix[i][j] <= mid {
                num += i + 1
                j += 1
            } else {
                i -= 1
            }
        }
        return num >= k
    }
}
