//
//  DiagonalTraverse.swift
//  LeetCode.swift
//
//  Created by 叶帆 on 2020/3/5.
//  Copyright © 2020 Suzhou Coryphaei Information&Technology Co., Ltd. All rights reserved.
//

/**
 Given a matrix of M x N elements (M rows, N columns), return all elements of the matrix in diagonal order as shown in the below image.

  

 Example:

 Input:
 [
  [ 1, 2, 3 ],
  [ 4, 5, 6 ],
  [ 7, 8, 9 ]
 ]

 Output:  [1,2,4,7,5,3,6,8,9]

 Explanation:

  

 Note:

 The total number of elements of the given matrix will not exceed 10,000.
 
 =====
 
 Given a matrix of M x N elements (M rows, N columns), return all elements of the matrix in diagonal order as shown in the below image.

  

 Example:

 Input:
 [
  [ 1, 2, 3 ],
  [ 4, 5, 6 ],
  [ 7, 8, 9 ]
 ]

 Output:  [1,2,4,7,5,3,6,8,9]

 Explanation:

  

 Note:

 The total number of elements of the given matrix will not exceed 10,000.

 */

import Foundation

class Solution {
    func findDiagonalOrder(_ matrix: [[Int]]) -> [Int] {
        var i = 0
        var j = 0
        var ans: [Int] = []
        while (i < matrix.count && j < matrix[0].count) {
            ans.append(matrix[i][j])
            if (i + j) % 2 == 0 {
                // ↗
                if j == matrix[0].count - 1 {
                    // 右边到顶了，要换方向，坐标(i+1, j)
                    i += 1
                } else if i == 0 {
                    // 上面到顶了，要换方向，坐标(i, j+1)
                    j += 1
                } else {
                    // 不换方向，坐标(i-1, j+1)
                    i -= 1
                    j += 1
                }
            } else {
                // ↙
                if i == matrix.count - 1 {
                    // 下边到底了，要换方向，坐标(i, j+1)
                    j += 1
                } else if j == 0 {
                    // 左边到底了，要换方向，坐标(i+1, j)
                    i += 1
                } else {
                    // 不换方向
                    i += 1
                    j -= 1
                }
            }
        }
        return ans
    }
}
