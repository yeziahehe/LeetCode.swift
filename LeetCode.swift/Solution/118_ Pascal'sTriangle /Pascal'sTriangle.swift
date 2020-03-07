//
//  Pascal'sTriangle.swift
//  LeetCode.swift
//
//  Created by 叶帆 on 2020/3/7.
//  Copyright © 2020 Suzhou Coryphaei Information&Technology Co., Ltd. All rights reserved.
//

/**
 Given a non-negative integer numRows, generate the first numRows of Pascal's triangle.


 In Pascal's triangle, each number is the sum of the two numbers directly above it.

 Example:

 Input: 5
 Output:
 [
      [1],
     [1,1],
    [1,2,1],
   [1,3,3,1],
  [1,4,6,4,1]
 ]

 =====
 
 给定一个非负整数 numRows，生成杨辉三角的前 numRows 行。



 在杨辉三角中，每个数是它左上方和右上方的数的和。

 示例:

 输入: 5
 输出:
 [
      [1],
     [1,1],
    [1,2,1],
   [1,3,3,1],
  [1,4,6,4,1]
 ]

 */

import Foundation

class Solution {
    func generate(_ numRows: Int) -> [[Int]] {
        var ans: [[Int]] = []
        for i in 0..<numRows {
            if i == 0 {
                ans.append([1])
            } else {
                // 头和尾的元素都是1，中间用循环赋值即可
                var nums: [Int] = [1, 1]
                for j in 1..<i {
                    nums.insert(ans[i-1][j-1]+ans[i-1][j], at: j)
                }
                ans.append(nums)
            }
        }
        return ans
    }
}
