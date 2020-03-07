//
//  AddBinary.swift
//  LeetCode.swift
//
//  Created by 叶帆 on 2020/3/7.
//  Copyright © 2020 Suzhou Coryphaei Information&Technology Co., Ltd. All rights reserved.
//

/**
 Given two binary strings, return their sum (also a binary string).

 The input strings are both non-empty and contains only characters 1 or 0.

 Example 1:

 Input: a = "11", b = "1"
 Output: "100"
 Example 2:

 Input: a = "1010", b = "1011"
 Output: "10101"

 =====
 给定两个二进制字符串，返回他们的和（用二进制表示）。

 输入为非空字符串且只包含数字 1 和 0。

 示例 1:

 输入: a = "11", b = "1"
 输出: "100"
 示例 2:

 输入: a = "1010", b = "1011"
 输出: "10101"

 */

import Foundation

class Solution {
    func addBinary(_ a: String, _ b: String) -> String {
        let a = Array(a)
        let b = Array(b)
        var ans = ""
        var carry = 0
        var i = a.count - 1
        var j = b.count - 1
        while i >= 0 || j >= 0 || carry > 0 {
            if i >= 0 {
                carry += Int(String(a[i]))!
                i -= 1
            }
            if j >= 0 {
                carry += Int(String(b[j]))!
                j -= 1
            }
            ans = "\(carry % 2)" + ans
            carry = carry / 2
        }
        return ans
    }
    /**
    func addBinary(_ a: String, _ b: String) -> String {
        let max = String(UInt64.max)
        print("\(max) has \(max.count) digits.")
        return String((UInt64(a, radix: 2) ?? 0) + (UInt64(b, radix: 2) ?? 0), radix: 2)
    }
    func addBinary(_ a: String, _ b: String) -> String {
        var x = Int(a, radix: 2) ?? 0
        var y = Int(b, radix: 2) ?? 0
        var ans: Int = 0
        var carry: Int = 0
        while y != 0 {
            ans = x ^ y
            carry = (x & y) << 1
            x = ans
            y = carry
        }
        return String(ans, radix: 2)
    }
    */
}

/**
看到二进制的题目，要善用位运算。
相加用位运算分两步：
- 按位异或 ^ ：算出不进位每一位的相加值
- 按位与 & 并左移以为 << ：算出需要进位的二进制值
*/
