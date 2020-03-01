//
//  HammingDistance.swift
//  LeetCode.swift
//
//  Created by 叶帆 on 2020/3/1.
//  Copyright © 2020 Suzhou Coryphaei Information&Technology Co., Ltd. All rights reserved.
//

/**
 The Hamming distance between two integers is the number of positions at which the corresponding bits are different.

 Given two integers x and y, calculate the Hamming distance.

 Note:
 0 ≤ x, y < 231.

 Example:

 Input: x = 1, y = 4

 Output: 2

 Explanation:
 1   (0 0 0 1)
 4   (0 1 0 0)
        ↑   ↑

 The above arrows point to positions where the corresponding bits are different.

 ==========
 
 两个整数之间的汉明距离指的是这两个数字对应二进制位不同的位置的数目。

 给出两个整数 x 和 y，计算它们之间的汉明距离。

 注意：
 0 ≤ x, y < 231.

 示例:

 输入: x = 1, y = 4

 输出: 2

 解释:
 1   (0 0 0 1)
 4   (0 1 0 0)
        ↑   ↑

 上面的箭头指出了对应二进制位不同的位置。

 */

import Foundation

class Solution {
    func hammingDistance(_ x: Int, _ y: Int) -> Int {
        var ans = 0
        // 异或运算
        var t = x^y
        while (t>0) {
            ans += t&1
            // 右移一位
            t = t>>1
        }
        return ans
    }
}
