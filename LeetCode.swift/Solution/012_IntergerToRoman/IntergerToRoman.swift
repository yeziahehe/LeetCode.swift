//
//  IntergerToRoman.swift
//  LeetCode.swift
//
//  Created by 叶帆 on 2017/11/12.
//  Copyright © 2017年 Suzhou Coryphaei Information&Technology Co., Ltd. All rights reserved.
//

/**
 Given an integer, convert it to a roman numeral.
 
 Input is guaranteed to be within the range from 1 to 3999.
 */

import Foundation

// 枚举法
class Solution1 {
    func intToRoman(_ num: Int) -> String {
        let M = ["", "M", "MM", "MMM"]
        let C = ["", "C", "CC", "CCC", "CD", "D", "DC", "DCC", "DCCC", "CM"]
        let X = ["", "X", "XX", "XXX", "XL", "L", "LX", "LXX", "LXXX", "XC"]
        let I = ["", "I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX"]
        
        return M[num/1000] + C[num/100%10] + X[num/10%10] + I[num%10]
    }
}

// 贪心算法
class Solution2 {
    func intToRoman(_ num: Int) -> String {
        var val = num
        var res = ""
        let int = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]
        let roman = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"]
        
        
        for index in 0...12 {
            while (val >= int[index]) {
                val -= int[index]
                res += roman[index]
            }
        }
        
        return res
    }
}
