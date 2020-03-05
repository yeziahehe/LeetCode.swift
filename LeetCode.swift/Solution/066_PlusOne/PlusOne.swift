//
//  PlusOne.swift
//  LeetCode.swift
//
//  Created by 叶帆 on 2017/11/7.
//  Copyright © 2017年 Suzhou Coryphaei Information&Technology Co., Ltd. All rights reserved.
//

/**
 Given a non-negative integer represented as a non-empty array of digits, plus one to the integer.
 
 You may assume the integer do not contain any leading zero, except the number 0 itself.
 
 The digits are stored such that the most significant digit is at the head of the list.
 
 */

import Foundation

class Solution {
    func plusOne(_ digits: [Int]) -> [Int] {
        var s: [Int] = digits
        for i in s.enumerated().reversed() {
            s[i.offset] += 1
            s[i.offset] %= 10
            if s[i.offset] != 0 {
                return s
            }
        }
        // 还没 return 说明要加 1
        s.insert(1, at: 0)
        return s
    }
}
