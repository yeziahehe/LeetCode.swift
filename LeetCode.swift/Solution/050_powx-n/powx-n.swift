//
//  Pow(x, n).swift
//  LeetCode.swift
//
//  Created by 叶帆 on 2020/6/28.
//  Copyright © 2020 Suzhou Coryphaei Information&Technology Co., Ltd. All rights reserved.
//

/**

 Implement pow(x, n), which calculates x raised to the power n (xn).

 Example 1:

 Input: 2.00000, 10
 Output: 1024.00000
 Example 2:

 Input: 2.10000, 3
 Output: 9.26100
 Example 3:

 Input: 2.00000, -2
 Output: 0.25000
 Explanation: 2-2 = 1/22 = 1/4 = 0.25
 Note:

 -100.0 < x < 100.0
 n is a 32-bit signed integer, within the range [−231, 231 − 1]
 
 ======
 实现 pow(x, n) ，即计算 x 的 n 次幂函数。

 示例 1:

 输入: 2.00000, 10
 输出: 1024.00000
 示例 2:

 输入: 2.10000, 3
 输出: 9.26100
 示例 3:

 输入: 2.00000, -2
 输出: 0.25000
 解释: 2-2 = 1/22 = 1/4 = 0.25
 说明:

 -100.0 < x < 100.0
 n 是 32 位有符号整数，其数值范围是 [−231, 231 − 1] 。

 */
import Foundation

class Solution {
    func myPow(_ x: Double, _ n: Int) -> Double {
        if x == 0 {
            return 1
        }
        if n < 0 {
            return myPow(1/x, -n)
        }
        var x = x
        var n = n
        var res = 1.0
        while n > 0 {
            /**
             根据二分推导，可通过循环 x = x^2 操作，每次把幂从 n 降至 n//2 ，直至将幂降为 0 ；
             设 res=1 ，则初始状态 x^n = x^n * res。在循环二分时，每当 n 为奇数时，将多出的一项 x 乘入 res ，则最终可化至 x^n = x^0 * res  ，返回 res 即可。
             */
            if n & 1 == 1 {
                res *= x
            }
            x *= x
            n >>= 1
        }
        return res
    }
}
