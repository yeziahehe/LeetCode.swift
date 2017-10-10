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
        var start = 0, end = 0
        var i = 0
        while end < array.count {
            i = start
            while i < end {
                if array[i] == array[end] {
                    start = i + 1
                    break
                }
                i += 1
            }
            length = max(length, end - start + 1)
            end += 1
        }
        return length
    }
}
