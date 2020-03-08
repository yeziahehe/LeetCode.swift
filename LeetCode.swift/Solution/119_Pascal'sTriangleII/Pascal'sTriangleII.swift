//
//  Pascal'sTriangleII.swift
//  LeetCode.swift
//
//  Created by 叶帆 on 2020/3/8.
//  Copyright © 2020 Suzhou Coryphaei Information&Technology Co., Ltd. All rights reserved.
//

/**
 Given a non-negative index k where k ≤ 33, return the kth index row of the Pascal's triangle.

 Note that the row index starts from 0.


 In Pascal's triangle, each number is the sum of the two numbers directly above it.

 Example:

 Input: 3
 Output: [1,3,3,1]
 Follow up:

 Could you optimize your algorithm to use only O(k) extra space?
 =====
 给定一个非负索引 k，其中 k ≤ 33，返回杨辉三角的第 k 行。



 在杨辉三角中，每个数是它左上方和右上方的数的和。

 示例:

 输入: 3
 输出: [1,3,3,1]
 进阶：

 你可以优化你的算法到 O(k) 空间复杂度吗？
 */

import Foundation

class Solution {
    func getRow(_ rowIndex: Int) -> [Int] {
        var temp = 1
        var ans:[Int] = []
        for i in 0...rowIndex {
            ans.append(temp)
            temp = temp * (rowIndex - i)/(i + 1)
        }
        return ans
    }
}

// 组合公式C(n,i) = n!/(i!*(n-i)!)
// 则第(i+1)项是第i项的倍数=(n-i)/(i+1)
