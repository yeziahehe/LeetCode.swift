//
//  ReverseWordsInAStringIII.swift
//  LeetCode.swift
//
//  Created by 叶帆 on 2020/3/8.
//  Copyright © 2020 Suzhou Coryphaei Information&Technology Co., Ltd. All rights reserved.
//

/**
 Given a string, you need to reverse the order of characters in each word within a sentence while still preserving whitespace and initial word order.

 Example 1:
 Input: "Let's take LeetCode contest"
 Output: "s'teL ekat edoCteeL tsetnoc"
 Note: In the string, each word is separated by single space and there will not be any extra space in the string.
 =====
 给定一个字符串，你需要反转字符串中每个单词的字符顺序，同时仍保留空格和单词的初始顺序。

 示例 1:

 输入: "Let's take LeetCode contest"
 输出: "s'teL ekat edoCteeL tsetnoc"
 注意：在字符串中，每个单词由单个空格分隔，并且字符串中不会有任何额外的空格。

 */

import Foundation

class Solution {
    func reverseWords(_ s: String) -> String {
        let a = s.split(separator: " ").map { String($0) }
        var ans = ""
        for val in a {
            ans = ans + " " + val.reversed()
        }
        return ans.trimmingCharacters(in: .whitespaces)
    }
}
