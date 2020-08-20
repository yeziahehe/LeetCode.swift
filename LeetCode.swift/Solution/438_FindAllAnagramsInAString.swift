//
//  438_FindAllAnagramsInAString.swift
//  LeetCode.swift
//
//  Created by 叶帆 on 2020/8/20.
//  Copyright © 2020 Suzhou Coryphaei Information&Technology Co., Ltd. All rights reserved.
//

/**
 给定一个字符串 s 和一个非空字符串 p，找到 s 中所有是 p 的字母异位词的子串，返回这些子串的起始索引。

 字符串只包含小写英文字母，并且字符串 s 和 p 的长度都不超过 20100。

 说明：

 字母异位词指字母相同，但排列不同的字符串。
 不考虑答案输出的顺序。
 示例 1:

 输入:
 s: "cbaebabacd" p: "abc"

 输出:
 [0, 6]

 解释:
 起始索引等于 0 的子串是 "cba", 它是 "abc" 的字母异位词。
 起始索引等于 6 的子串是 "bac", 它是 "abc" 的字母异位词。
  示例 2:

 输入:
 s: "abab" p: "ab"

 输出:
 [0, 1, 2]

 解释:
 起始索引等于 0 的子串是 "ab", 它是 "ab" 的字母异位词。
 起始索引等于 1 的子串是 "ba", 它是 "ab" 的字母异位词。
 起始索引等于 2 的子串是 "ab", 它是 "ab" 的字母异位词。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/find-all-anagrams-in-a-string
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
import Foundation

class Solution {
    func findAnagrams(_ s: String, _ p: String) -> [Int] {
        let sArr = [Character](s)
        let pArr = [Character](p)
        var window: [Character: Int] = [:]
        var need: [Character: Int] = [:]
        var valid: Int = 0
        var res: [Int] = []
        for c in pArr {
            need[c] = need[c] != nil ? need[c]! + 1 : 1
        }
        var left = 0
        var right = 0
        while right < sArr.count {
            let c = sArr[right]
            right += 1
            if need[c] != nil {
                window[c] = window[c] != nil ? window[c]! + 1 : 1
                if window[c] == need[c] {
                    valid += 1
                }
            }
            if right - left >= pArr.count {
                if valid == need.count {
                    res.append(left)
                }
                let d = sArr[left]
                left += 1
                if need[d] != nil {
                    if window[d] == need[d] {
                        valid -= 1
                    }
                    window[d]! -= 1
                }
            }
        }
        return res
    }
}
