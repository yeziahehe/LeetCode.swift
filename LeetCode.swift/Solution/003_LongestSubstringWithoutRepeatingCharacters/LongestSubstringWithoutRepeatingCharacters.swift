//
//  LongestSubstringWithoutRepeatingCharacters.swift
//  LeetCode.swift
//
//  Created by 叶帆 on 2017/10/10.
//  Copyright © 2017年 Suzhou Coryphaei Information&Technology Co., Ltd. All rights reserved.
//

/**
 
 Given a string, find the length of the longest substring without repeating characters.
 
 Examples:
 
 Given "abcabcbb", the answer is "abc", which the length is 3.
 
 Given "bbbbb", the answer is "b", with the length of 1.
 
 Given "pwwkew", the answer is "wke", with the length of 3. Note that the answer must be a substring, "pwke" is a subsequence and not a substring.
 */

import Foundation

class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        let sArr = [Character](s)
        var window: [Character: Int] = [:]
        var left = 0
        var right = 0
        var res = 0
        while right < sArr.count {
            let c = sArr[right]
            right += 1
            window[c] = window[c] != nil ? window[c]! + 1 : 1
            while window[c]! > 1 {
                let d = sArr[left]
                left += 1
                window[d]! -= 1
            }
            res = max(res, right - left)
        }
        return res
    }
}
