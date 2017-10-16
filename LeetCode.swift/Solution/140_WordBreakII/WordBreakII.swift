//
//  WordBreakII.swift
//  LeetCode.swift
//
//  Created by 叶帆 on 2017/10/15.
//  Copyright © 2017年 Suzhou Coryphaei Information&Technology Co., Ltd. All rights reserved.
//

/**
 Given a non-empty string s and a dictionary wordDict containing a list of non-empty words, add spaces in s to construct a sentence where each word is a valid dictionary word. You may assume the dictionary does not contain duplicate words.
 
 Return all such possible sentences.
 
 For example, given
 s = "catsanddog",
 dict = ["cat", "cats", "and", "sand", "dog"].
 
 A solution is ["cats and dog", "cat sand dog"].
 */

import Foundation

class Solution {
    func wordBreak(_ s: String, _ wordDict: [String]) -> [String] {
        var cache = [String: [String]]()
        return DFS(s, wordDict, &cache)
    }
    
    func DFS(_ s: String, _ wordDict: [String], _ cache: inout [String: [String]]) -> [String] {
        if s.count == 0 {
            return [""]
        }
        
        if let value = cache[s] {
            return value
        }
        
        var result = [String]()
        
        for word in wordDict {
            if s.hasPrefix(word) {
                let subWordBreaks = DFS(String(s.suffix(from: word.endIndex)), wordDict, &cache)
                for subWordBreak in subWordBreaks {
                    if subWordBreak.isEmpty {
                        result.append(word)
                    } else {
                        result.append(word + " " + subWordBreak)
                    }
                }
            }
        }
        cache[s] = result;
        
        return result;
    }
}
