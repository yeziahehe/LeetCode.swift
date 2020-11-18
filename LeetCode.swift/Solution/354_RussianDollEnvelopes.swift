//
//  354_RussianDollEnvelopes.swift
//  LeetCode.swift
//
//  Created by 叶帆 on 2020/11/18.
//  Copyright © 2020 Suzhou Coryphaei Information&Technology Co., Ltd. All rights reserved.
//

/**
 给定一些标记了宽度和高度的信封，宽度和高度以整数对形式 (w, h) 出现。当另一个信封的宽度和高度都比这个信封大的时候，这个信封就可以放进另一个信封里，如同俄罗斯套娃一样。

 请计算最多能有多少个信封能组成一组“俄罗斯套娃”信封（即可以把一个信封放到另一个信封里面）。

 说明:
 不允许旋转信封。

 示例:

 输入: envelopes = [[5,4],[6,4],[6,7],[2,3]]
 输出: 3
 解释: 最多信封的个数为 3, 组合为: [2,3] => [5,4] => [6,7]。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/russian-doll-envelopes
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
import Foundation

class Solution {
    func maxEnvelopes(_ envelopes: [[Int]]) -> Int {
        let n = envelopes.count
        if n == 0 {
            return 0
        }
        // 按宽度升序排列，如果宽度一样，则按高度降序排列
        let sortEnvelopes = envelopes.sorted { (a, b) -> Bool in
            return a[0] == b[0] ? a[1] > b[1] : a[0] < b[0]
        }
        var dp = Array(repeating: 1, count: n)
        var res = 1
        for i in 1..<n {
            for j in 0..<i {
                if sortEnvelopes[i][1] > sortEnvelopes[j][1] {
                    dp[i] = max(dp[i], dp[j] + 1)
                }
            }
            res = max(res, dp[i])
        }
        return res
    }
}
