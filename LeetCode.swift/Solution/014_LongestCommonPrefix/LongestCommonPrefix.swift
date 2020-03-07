//
//  LongestCommonPrefix.swift
//  LeetCode.swift
//
//  Created by 叶帆 on 2020/3/7.
//  Copyright © 2020 Suzhou Coryphaei Information&Technology Co., Ltd. All rights reserved.
//

/**
 Write a function to find the longest common prefix string amongst an array of strings.

 If there is no common prefix, return an empty string "".

 Example 1:

 Input: ["flower","flow","flight"]
 Output: "fl"
 Example 2:

 Input: ["dog","racecar","car"]
 Output: ""
 Explanation: There is no common prefix among the input strings.
 Note:

 All given inputs are in lowercase letters a-z.

 =====
 编写一个函数来查找字符串数组中的最长公共前缀。

 如果不存在公共前缀，返回空字符串 ""。

 示例 1:

 输入: ["flower","flow","flight"]
 输出: "fl"
 示例 2:

 输入: ["dog","racecar","car"]
 输出: ""
 解释: 输入不存在公共前缀。
 说明:

 所有输入只包含小写字母 a-z 。

 */

import Foundation

class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        if strs.count == 0 {
            return ""
        } else if strs.count == 1 {
            return strs.first!
        } else {
            var ans = strs.first!
            for i in 1..<strs.count {
                while !strs[i].hasPrefix(ans) {
                    ans.removeLast()
                    if ans.isEmpty {
                        return ""
                    }
                }
            }
            return ans
        }
    }
}
