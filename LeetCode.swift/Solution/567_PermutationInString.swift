//
//  567_PermutationInString.swift
//  LeetCode.swift
//
//  Created by 叶帆 on 2020/8/20.
//  Copyright © 2020 Suzhou Coryphaei Information&Technology Co., Ltd. All rights reserved.
//

/**
 给定两个字符串 s1 和 s2，写一个函数来判断 s2 是否包含 s1 的排列。

 换句话说，第一个字符串的排列之一是第二个字符串的子串。

 示例1:

 输入: s1 = "ab" s2 = "eidbaooo"
 输出: True
 解释: s2 包含 s1 的排列之一 ("ba").
  

 示例2:

 输入: s1= "ab" s2 = "eidboaoo"
 输出: False
  

 注意：

 输入的字符串只包含小写字母
 两个字符串的长度都在 [1, 10,000] 之间

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/permutation-in-string
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
import Foundation

class Solution {
    func checkInclusion(_ s1: String, _ s2: String) -> Bool {
        let s1Arr = [Character](s1)
        let s2Arr = [Character](s2)
        var window: [Character: Int] = [:]
        var need: [Character: Int] = [:]
        var valid: Int = 0
        for c in s1Arr {
            need[c] = need[c] != nil ? need[c]! + 1 : 1
        }
        var left = 0
        var right = 0
        while right < s2Arr.count {
            let c = s2Arr[right]
            right += 1
            if need[c] != nil {
                window[c] = window[c] != nil ? window[c]! + 1 : 1
                if window[c] == need[c] {
                    valid += 1
                }
            }
            while right - left >= s1Arr.count {
                if valid == need.count {
                    return true
                }
                let d = s2Arr[left]
                left += 1
                if need[d] != nil {
                    if window[d] == need[d] {
                        valid -= 1
                    }
                    window[d]! -= 1
                }
            }
        }
        return false
    }
}
