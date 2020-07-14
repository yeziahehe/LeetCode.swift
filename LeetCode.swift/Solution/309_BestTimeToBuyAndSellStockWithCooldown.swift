//
//  309_BestTimeToBuyAndSellStockWithCooldown.swift
//  LeetCode.swift
//
//  Created by 叶帆 on 2020/7/14.
//  Copyright © 2020 Suzhou Coryphaei Information&Technology Co., Ltd. All rights reserved.
//

/**
 Say you have an array for which the ith element is the price of a given stock on day i.

 Design an algorithm to find the maximum profit. You may complete as many transactions as you like (ie, buy one and sell one share of the stock multiple times) with the following restrictions:

 You may not engage in multiple transactions at the same time (ie, you must sell the stock before you buy again).
 After you sell your stock, you cannot buy stock on next day. (ie, cooldown 1 day)
 Example:

 Input: [1,2,3,0,2]
 Output: 3
 Explanation: transactions = [buy, sell, cooldown, buy, sell]

 ======
 给定一个整数数组，其中第 i 个元素代表了第 i 天的股票价格 。

 设计一个算法计算出最大利润。在满足以下约束条件下，你可以尽可能地完成更多的交易（多次买卖一支股票）:

 你不能同时参与多笔交易（你必须在再次购买前出售掉之前的股票）。
 卖出股票后，你无法在第二天买入股票 (即冷冻期为 1 天)。
 示例:

 输入: [1,2,3,0,2]
 输出: 3
 解释: 对应的交易状态为: [买入, 卖出, 冷冻期, 买入, 卖出]

 */
import Foundation

class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        if prices.count <= 1 {
            return 0
        }
        let n = prices.count
        var f0 = -prices[0]
        var f1 = 0
        var f2 = 0
        for i in 1..<n {
            let _f0 = max(f0, f2 - prices[i])
            let _f1 = f0 + prices[i]
            let _f2 = max(f1, f2)
            f0 = _f0
            f1 = _f1
            f2 = _f2
        }
        return max(f1, f2)
    }
}
