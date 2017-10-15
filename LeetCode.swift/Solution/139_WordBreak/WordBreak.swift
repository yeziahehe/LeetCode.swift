//
//  WordBreak.swift
//  LeetCode.swift
//
//  Created by 叶帆 on 2017/10/15.
//  Copyright © 2017年 Suzhou Coryphaei Information&Technology Co., Ltd. All rights reserved.
//

/**
 Given a non-empty string s and a dictionary wordDict containing a list of non-empty words, determine if s can be segmented into a space-separated sequence of one or more dictionary words. You may assume the dictionary does not contain duplicate words.
 
 For example, given
 s = "leetcode",
 dict = ["leet", "code"].
 
 Return true because "leetcode" can be segmented as "leet code".
 */

import Foundation

class Solution {
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        
        if s.isEmpty {
            return true
        }
        
        if wordDict.count == 0 {
            return false
        }
        
        var wordArray = Array.init(repeating: false, count: s.count + 1)
        wordArray[0] = true
        
        for i in 1...s.count {
            for j in stride(from: i-1, through: 0, by: -1) {

                if wordArray[j] && wordDict.contains(String(s[s.index(s.startIndex, offsetBy: j)..<s.index(s.startIndex, offsetBy: i)])) {
                    wordArray[i] = true
                    break
                }
            }
        }
        
        return wordArray[s.count]
    }
}
