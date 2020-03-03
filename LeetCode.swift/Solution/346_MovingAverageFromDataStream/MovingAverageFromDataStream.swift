//
//  MovingAverageFromDataStream.swift
//  LeetCode.swift
//
//  Created by 叶帆 on 2020/3/3.
//  Copyright © 2020 Suzhou Coryphaei Information&Technology Co., Ltd. All rights reserved.
//

/**
 Given a stream of integers and a window size, calculate the moving average of all integers in the sliding window.

 Example:

 MovingAverage m = new MovingAverage(3);
 m.next(1) = 1
 m.next(10) = (1 + 10) / 2
 m.next(3) = (1 + 10 + 3) / 3
 m.next(5) = (10 + 3 + 5) / 3

 =====
 
 给定一个整数数据流和一个窗口大小，根据该滑动窗口的大小，计算其所有整数的移动平均值。

 示例:

 MovingAverage m = new MovingAverage(3);
 m.next(1) = 1
 m.next(10) = (1 + 10) / 2
 m.next(3) = (1 + 10 + 3) / 3
 m.next(5) = (10 + 3 + 5) / 3

 */

import Foundation

class MovingAverage {

    var data: [Int]
    var size: Int
    var sum: Int
    
    /** Initialize your data structure here. */
    init(_ size: Int) {
        data = []
        self.size = size
        sum = 0
    }
    
    func next(_ val: Int) -> Double {
        if data.count == size {
            sum -= data[0]
            data.remove(at: 0)
        }
        sum += val
        data.append(val)
        return (Double)(sum)/(Double)(data.count)
    }
}

/**
 * Your MovingAverage object will be instantiated and called as such:
 * let obj = MovingAverage(size)
 * let ret_1: Double = obj.next(val)
 */
