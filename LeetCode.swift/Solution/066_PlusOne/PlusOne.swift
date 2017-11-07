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
        var reDigits: [Int] = digits.reversed()
        var carry = 0
        
        for (index, digit) in reDigits.enumerated() {
            let sum = index == 0 ? digit + 1 + carry : digit + carry
            carry = sum / 10
            reDigits[index] = sum % 10
        }
        
        if carry > 0 {
            reDigits.append(carry)
        }
        
        return reDigits.reversed()
    }
}
