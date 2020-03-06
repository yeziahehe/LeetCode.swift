//
//  SpiralMatrix.swift
//  LeetCode.swift
//
//  Created by 叶帆 on 2020/3/6.
//  Copyright © 2020 Suzhou Coryphaei Information&Technology Co., Ltd. All rights reserved.
//

/**
 Given a matrix of m x n elements (m rows, n columns), return all elements of the matrix in spiral order.

 Example 1:

 Input:
 [
  [ 1, 2, 3 ],
  [ 4, 5, 6 ],
  [ 7, 8, 9 ]
 ]
 Output: [1,2,3,6,9,8,7,4,5]
 Example 2:

 Input:
 [
   [1, 2, 3, 4],
   [5, 6, 7, 8],
   [9,10,11,12]
 ]
 Output: [1,2,3,4,8,12,11,10,9,5,6,7]

 =====
 
 给定一个包含 m x n 个元素的矩阵（m 行, n 列），请按照顺时针螺旋顺序，返回矩阵中的所有元素。

 示例 1:

 输入:
 [
  [ 1, 2, 3 ],
  [ 4, 5, 6 ],
  [ 7, 8, 9 ]
 ]
 输出: [1,2,3,6,9,8,7,4,5]
 示例 2:

 输入:
 [
   [1, 2, 3, 4],
   [5, 6, 7, 8],
   [9,10,11,12]
 ]
 输出: [1,2,3,4,8,12,11,10,9,5,6,7]

 */

import Foundation

class Solution {
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        var i = 0
        var j = 0
        var h = 1
        var v = 0
        var ans: [Int] = []
        var m: [[Int]] = matrix
        if m.count == 0 {
            return []
        }
        for _ in 0..<(m.count * m[0].count) {
            ans.append(m[i][j])
            m[i][j] = 0
            if i+v == m.count || i+v == -1 || j+h == m[0].count || j+h == -1 || m[i+v][j+h] == 0 {
                // 要变方向
                if h == 1 && v == 0 {
                    // → (1, 0)
                    h = 0
                    v = 1
                } else if h == 0 && v == 1 {
                    h = -1
                    v = 0
                } else if h == -1 && v == 0 {
                    h = 0
                    v = -1
                } else if h == 0 && v == -1 {
                    h = 1
                    v = 0
                }
            }
            i += v
            j += h
        }
        return ans
    }
}

/** (h, v) 组合代表移动方向
 → (1, 0)
 ↓ (0, 1)
 ← (-1, 0)
 ↑ (0, -1)
*/

