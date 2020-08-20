//
//  076_MinimumWindowSubstring.swift
//  LeetCode.swift
//
//  Created by 叶帆 on 2020/8/20.
//  Copyright © 2020 Suzhou Coryphaei Information&Technology Co., Ltd. All rights reserved.
//

/**
 给你一个字符串 S、一个字符串 T 。请你设计一种算法，可以在 O(n) 的时间复杂度内，从字符串 S 里面找出：包含 T 所有字符的最小子串。

  

 示例：

 输入：S = "ADOBECODEBANC", T = "ABC"
 输出："BANC"
  

 提示：

 如果 S 中不存这样的子串，则返回空字符串 ""。
 如果 S 中存在这样的子串，我们保证它是唯一的答案。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/minimum-window-substring
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
import Foundation

class Solution {
    func minWindow(_ s: String, _ t: String) -> String {
        let sArr = [Character](s)
        let tArr = [Character](t)
        var window: [Character: Int] = [:]
        var need: [Character: Int] = [:]
        // 窗口中满足 need 条件的字符个数
        var valid: Int = 0
        // 记录最小覆盖子串的起始索引和长度
        var start: Int = 0
        var len = Int.max
        for c in tArr {
            need[c] = need[c] != nil ? need[c]! + 1 : 1
        }
        var left = 0
        var right = 0
        while right < sArr.count {
            // c 是将移入窗口的字符
            let c: Character = sArr[right]
            // 右移窗口
            right += 1
            // 进行窗口内数据的一系列更新
            if need[c] != nil {
                window[c] = window[c] != nil ? window[c]! + 1 : 1
                if window[c] == need[c] {
                    valid += 1
                }
            }
            // 判断左侧窗口是否要收缩
            while valid == need.count {
                // 更新最小覆盖子串
                if right - left < len {
                    start = left
                    len = right - left
                }
                // d 是将移出窗口的字符
                let d: Character = sArr[left]
                // 左移窗口
                left += 1
                // 进行窗口内数据的一系列更新
                if need[d] != nil {
                    if window[d] == need[d] {
                        valid -= 1
                    }
                    window[d]! -= 1
                }
            }
        }
        // 返回最小覆盖子串
        return len == Int.max ? "" : String(sArr[start..<start+len])
    }
}
