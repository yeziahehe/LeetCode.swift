//
//  ReverseWordsInAString.swift
//  LeetCode.swift
//
//  Created by 叶帆 on 2020/3/8.
//  Copyright © 2020 Suzhou Coryphaei Information&Technology Co., Ltd. All rights reserved.
//

/**
 Given an input string, reverse the string word by word.

  

 Example 1:

 Input: "the sky is blue"
 Output: "blue is sky the"
 Example 2:

 Input: "  hello world!  "
 Output: "world! hello"
 Explanation: Your reversed string should not contain leading or trailing spaces.
 Example 3:

 Input: "a good   example"
 Output: "example good a"
 Explanation: You need to reduce multiple spaces between two words to a single space in the reversed string.
  

 Note:

 A word is defined as a sequence of non-space characters.
 Input string may contain leading or trailing spaces. However, your reversed string should not contain leading or trailing spaces.
 You need to reduce multiple spaces between two words to a single space in the reversed string.
  

 Follow up:

 For C programmers, try to solve it in-place in O(1) extra space.
 =====
 给定一个字符串，逐个翻转字符串中的每个单词。

  

 示例 1：

 输入: "the sky is blue"
 输出: "blue is sky the"
 示例 2：

 输入: "  hello world!  "
 输出: "world! hello"
 解释: 输入字符串可以在前面或者后面包含多余的空格，但是反转后的字符不能包括。
 示例 3：

 输入: "a good   example"
 输出: "example good a"
 解释: 如果两个单词间有多余的空格，将反转后单词间的空格减少到只含一个。
  

 说明：

 无空格字符构成一个单词。
 输入字符串可以在前面或者后面包含多余的空格，但是反转后的字符不能包括。
 如果两个单词间有多余的空格，将反转后单词间的空格减少到只含一个。
  

 进阶：

 请选用 C 语言的用户尝试使用 O(1) 额外空间复杂度的原地解法。
 */

import Foundation

class Solution {
    func reverseWords(_ s: String) -> String {
        var ans = ""
        let a = s.split(separator: " ").reversed().map { String($0) }
        for i in 0..<a.count {
            ans = i == 0 ? a[i] : ans + " " + a[i]
        }
        return ans
    }
}
