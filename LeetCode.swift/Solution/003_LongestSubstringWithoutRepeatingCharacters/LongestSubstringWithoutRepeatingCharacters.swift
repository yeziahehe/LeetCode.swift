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
        let array = Array(s)
        var length = 0
        var left = 0, right = 0
        var i = 0
        while right < array.count {
            i = left
            while i < right {
                if array[i] == array[right] {
                    left = i + 1
                    break
                }
                i += 1
            }
            length = max(length, right - left + 1)
            right += 1
        }
        return length
    }
}
