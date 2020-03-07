//
//  ImplementstrStr.swift
//  LeetCode.swift
//
//  Created by 叶帆 on 2017/11/18.
//  Copyright © 2017年 Suzhou Coryphaei Information&Technology Co., Ltd. All rights reserved.
//

/**
 Implement strStr().
 
 Return the index of the first occurrence of needle in haystack, or -1 if needle is not part of haystack.
 
 Example 1:

 Input: haystack = "hello", needle = "ll"
 Output: 2
 
 Example 2:
 
 Input: haystack = "aaaaa", needle = "bba"
 Output: -1
 */

import Foundation

class Solution1 {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        guard !needle.isEmpty else {
            return 0
        }
        guard let range = haystack.range(of: needle) else {
            return -1
        }
        return range.lowerBound.utf16Offset(in: haystack)
    }
}

class Solution {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        if needle.isEmpty {
            return 0
        }
        
        let haystackChar = Array(haystack)
        let needleChar = Array(needle)
        var i = 0
        
        while i < haystackChar.count - needleChar.count + 1 {
            for index in 0..<needleChar.count {
                if haystackChar[i + index] == needleChar[index] {
                    if index == needleChar.count - 1 {
                        return i
                    }
                } else {
                    break
                }
            }
            i += 1
        }
        return -1
    }
}
