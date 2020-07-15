//
//  96_UniqueBinarySearchTrees.swift
//  LeetCode.swift
//
//  Created by 叶帆 on 2020/7/15.
//  Copyright © 2020 Suzhou Coryphaei Information&Technology Co., Ltd. All rights reserved.
//

/**
 Given n, how many structurally unique BST's (binary search trees) that store values 1 ... n?

 Example:

 Input: 3
 Output: 5
 Explanation:
 Given n = 3, there are a total of 5 unique BST's:

    1         3     3      2      1
     \       /     /      / \      \
      3     2     1      1   3      2
     /     /       \                 \
    2     1         2                 3
 ======
 给定一个整数 n，求以 1 ... n 为节点组成的二叉搜索树有多少种？

 示例:

 输入: 3
 输出: 5
 解释:
 给定 n = 3, 一共有 5 种不同结构的二叉搜索树:

    1         3     3      2      1
     \       /     /      / \      \
      3     2     1      1   3      2
     /     /       \                 \
    2     1         2                 3

 */
import Foundation

class Solution {
    func numTrees(_ n: Int) -> Int {
        /**
          卡特兰数 公式
         G(n) = G(0)*G(n-1)+G(1)*(n-2)+...+G(n-1)*G(0)
         */
        var dp: [Int] = Array(repeating: 0, count: n + 1)
        dp[0] = 1
        dp[1] = 1
        for i in 2..<n+1 {
            for j in 0..<i {
                dp[i] += dp[j] * dp[i - j - 1]
            }
        }
        return dp[n]
    }
}
