//
//  322_CoinChange.swift
//  LeetCode.swift
//
//  Created by 叶帆 on 2020/10/10.
//  Copyright © 2020 Suzhou Coryphaei Information&Technology Co., Ltd. All rights reserved.
//

/**
 给定不同面额的硬币 coins 和一个总金额 amount。编写一个函数来计算可以凑成总金额所需的最少的硬币个数。如果没有任何一种硬币组合能组成总金额，返回 -1。

 你可以认为每种硬币的数量是无限的。

  

 示例 1：

 输入：coins = [1, 2, 5], amount = 11
 输出：3
 解释：11 = 5 + 5 + 1
 示例 2：

 输入：coins = [2], amount = 3
 输出：-1
 示例 3：

 输入：coins = [1], amount = 0
 输出：0
 示例 4：

 输入：coins = [1], amount = 1
 输出：1
 示例 5：

 输入：coins = [1], amount = 2
 输出：2
  

 提示：

 1 <= coins.length <= 12
 1 <= coins[i] <= 231 - 1
 0 <= amount <= 104


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/coin-change
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
import Foundation

class Solution {
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        var dp: [Int] = Array(repeating: amount + 1, count: amount + 1)
        dp[0] = 0
        for i in 0..<dp.count {
            for coin in coins {
                if i - coin < 0 {
                    continue
                }
                dp[i] = min(dp[i], 1 + dp[i - coin])
            }
        }
        return dp[amount] == amount + 1 ? -1 : dp[amount]
    }
}
