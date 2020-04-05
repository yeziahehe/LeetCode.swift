//
//  DailyTemperatures.swift
//  LeetCode.swift
//
//  Created by 叶帆 on 2020/4/4.
//  Copyright © 2020 Suzhou Coryphaei Information&Technology Co., Ltd. All rights reserved.
//

/**
 Given a list of daily temperatures T, return a list such that, for each day in the input, tells you how many days you would have to wait until a warmer temperature. If there is no future day for which this is possible, put 0 instead.

 For example, given the list of temperatures T = [73, 74, 75, 71, 69, 72, 76, 73], your output should be [1, 1, 4, 2, 1, 1, 0, 0].

 Note: The length of temperatures will be in the range [1, 30000]. Each temperature will be an integer in the range [30, 100].
 =====
 根据每日 气温 列表，请重新生成一个列表，对应位置的输出是需要再等待多久温度才会升高超过该日的天数。如果之后都不会升高，请在该位置用 0 来代替。

 例如，给定一个列表 temperatures = [73, 74, 75, 71, 69, 72, 76, 73]，你的输出应该是 [1, 1, 4, 2, 1, 1, 0, 0]。

 提示：气温 列表长度的范围是 [1, 30000]。每个气温的值的均为华氏度，都是在 [30, 100] 范围内的整数。

 */

import Foundation

class Solution {
    func dailyTemperatures(_ T: [Int]) -> [Int] {
        var ans = Array(repeating: 0, count: T.count)
        var stack: [(Int, Int)] = []
        for (index, t) in T.enumerated().reversed() {
            while !stack.isEmpty && stack.last!.1 <= t {
                stack.removeLast()
            }
            if !stack.isEmpty {
                ans[index] = stack.last!.0 - index
            }
            stack.append((index, t))
        }
        return ans
    }
}
