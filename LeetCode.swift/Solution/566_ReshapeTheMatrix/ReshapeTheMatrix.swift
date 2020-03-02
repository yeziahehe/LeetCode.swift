//
//  ReshapeTheMatrix.swift
//  LeetCode.swift
//
//  Created by 叶帆 on 2020/3/2.
//  Copyright © 2020 Suzhou Coryphaei Information&Technology Co., Ltd. All rights reserved.
//

/**
 In MATLAB, there is a very useful function called 'reshape', which can reshape a matrix into a new one with different size but keep its original data.

 You're given a matrix represented by a two-dimensional array, and two positive integers r and c representing the row number and column number of the wanted reshaped matrix, respectively.

 The reshaped matrix need to be filled with all the elements of the original matrix in the same row-traversing order as they were.

 If the 'reshape' operation with given parameters is possible and legal, output the new reshaped matrix; Otherwise, output the original matrix.

 Example 1:
 Input:
 nums =
 [[1,2],
  [3,4]]
 r = 1, c = 4
 Output:
 [[1,2,3,4]]
 Explanation:
 The row-traversing of nums is [1,2,3,4]. The new reshaped matrix is a 1 * 4 matrix, fill it row by row by using the previous list.
 Example 2:
 Input:
 nums =
 [[1,2],
  [3,4]]
 r = 2, c = 4
 Output:
 [[1,2],
  [3,4]]
 Explanation:
 There is no way to reshape a 2 * 2 matrix to a 2 * 4 matrix. So output the original matrix.
 Note:
 The height and width of the given matrix is in range [1, 100].
 The given r and c are all positive.

 =====
 
 在MATLAB中，有一个非常有用的函数 reshape，它可以将一个矩阵重塑为另一个大小不同的新矩阵，但保留其原始数据。

 给出一个由二维数组表示的矩阵，以及两个正整数r和c，分别表示想要的重构的矩阵的行数和列数。

 重构后的矩阵需要将原始矩阵的所有元素以相同的行遍历顺序填充。

 如果具有给定参数的reshape操作是可行且合理的，则输出新的重塑矩阵；否则，输出原始矩阵。

 示例 1:

 输入:
 nums =
 [[1,2],
  [3,4]]
 r = 1, c = 4
 输出:
 [[1,2,3,4]]
 解释:
 行遍历nums的结果是 [1,2,3,4]。新的矩阵是 1 * 4 矩阵, 用之前的元素值一行一行填充新矩阵。
 示例 2:

 输入:
 nums =
 [[1,2],
  [3,4]]
 r = 2, c = 4
 输出:
 [[1,2],
  [3,4]]
 解释:
 没有办法将 2 * 2 矩阵转化为 2 * 4 矩阵。 所以输出原矩阵。
 注意：

 给定矩阵的宽和高范围在 [1, 100]。
 给定的 r 和 c 都是正数。
 
 */

import Foundation

class Solution {
    func matrixReshape(_ nums: [[Int]], _ r: Int, _ c: Int) -> [[Int]] {
        if nums.count * nums[0].count != r * c {
            // 不可以转换
            return nums
        }
        // 可以转换
        var ans = [[Int]](repeating: [Int](repeating: 0, count: c), count: r)
        for i in 0..<r*c {
            ans[i/c][i%c] = nums[i/nums[0].count][i%nums[0].count]
        }
        return ans
    }
}
