//
//  063_UniquePathsII.swift
//  LeetCode.swift
//
//  Created by 叶帆 on 2020/7/6.
//  Copyright © 2020 Suzhou Coryphaei Information&Technology Co., Ltd. All rights reserved.
//

/**
 A robot is located at the top-left corner of a m x n grid (marked 'Start' in the diagram below).

 The robot can only move either down or right at any point in time. The robot is trying to reach the bottom-right corner of the grid (marked 'Finish' in the diagram below).

 Now consider if some obstacles are added to the grids. How many unique paths would there be?



 An obstacle and empty space is marked as 1 and 0 respectively in the grid.

 Note: m and n will be at most 100.

 Example 1:

 Input:
 [
   [0,0,0],
   [0,1,0],
   [0,0,0]
 ]
 Output: 2
 Explanation:
 There is one obstacle in the middle of the 3x3 grid above.
 There are two ways to reach the bottom-right corner:
 1. Right -> Right -> Down -> Down
 2. Down -> Down -> Right -> Right

 ======
 一个机器人位于一个 m x n 网格的左上角 （起始点在下图中标记为“Start” ）。

 机器人每次只能向下或者向右移动一步。机器人试图达到网格的右下角（在下图中标记为“Finish”）。

 现在考虑网格中有障碍物。那么从左上角到右下角将会有多少条不同的路径？



 网格中的障碍物和空位置分别用 1 和 0 来表示。

 说明：m 和 n 的值均不超过 100。

 示例 1:

 输入:
 [
   [0,0,0],
   [0,1,0],
   [0,0,0]
 ]
 输出: 2
 解释:
 3x3 网格的正中间有一个障碍物。
 从左上角到右下角一共有 2 条不同的路径：
 1. 向右 -> 向右 -> 向下 -> 向下
 2. 向下 -> 向下 -> 向右 -> 向右

 */
import Foundation

class Solution {
    /**
     状态转移方程如下：
                dp[i−1,j]+dp[i,j−1] (i,j)上无障碍物
     dp[i][j]={
                0 (i,j)上有障碍物
     */
    func uniquePathsWithObstacles(_ obstacleGrid: [[Int]]) -> Int {
        if obstacleGrid.isEmpty || obstacleGrid[0][0] == 1 {
            return 0
        }
        let m = obstacleGrid.count
        let n = obstacleGrid[0].count
        var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: n), count: m)
        dp[0][0] = 1
        for i in 1..<m {
            if obstacleGrid[i][0] == 1 {
                break
            }
            dp[i][0] = 1
        }
        for j in 1..<n {
            if obstacleGrid[0][j] == 1 {
                break
            }
            dp[0][j] = 1
        }
        for i in 1..<m {
            for j in 1..<n {
                 dp[i][j] = obstacleGrid[i][j] == 1 ? 0 : dp[i - 1][j] + dp[i][j - 1]
            }
        }
        return dp[m-1][n-1]
    }
}
