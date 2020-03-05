//
//  DiagonalTraverse.swift
//  LeetCode.swift
//
//  Created by 叶帆 on 2020/3/5.
//  Copyright © 2020 Suzhou Coryphaei Information&Technology Co., Ltd. All rights reserved.
//

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
