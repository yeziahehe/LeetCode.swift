//
//  RomanToInteger.swift
//  LeetCode.swift
//
//  Created by 叶帆 on 2017/11/14.
//  Copyright © 2017年 Suzhou Coryphaei Information&Technology Co., Ltd. All rights reserved.
//

/**
 Given a roman numeral, convert it to an integer.
 
 Input is guaranteed to be within the range from 1 to 3999.
 */

import Foundation

class Solution {
    func romanToInt(_ s: String) -> Int {
        var pre = Int.min
        var sum = 0
        for character in s.reversed() {
            let int = toInt(character)
            if int < pre {
                sum -= int
            } else {
                sum += int
            }
            pre = int
        }
        return sum
    }
    
    private func toInt(_ character: Character) -> Int {
        switch character {
        case "M":
            return 1000
        case "D":
            return 500
        case "C":
            return 100
        case "L":
            return 50
        case "X":
            return 10
        case "V":
            return 5
        case "I":
            return 1
        default:
            return 0
        }
    }
}
