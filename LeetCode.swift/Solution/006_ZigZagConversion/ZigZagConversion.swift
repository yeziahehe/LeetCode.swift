//
//  ZigZag Conversion.swift
//  LeetCode.swift
//
//  Created by 叶帆 on 2019/6/19.
//  Copyright © 2019 Suzhou Coryphaei Information&Technology Co., Ltd. All rights reserved.
//

import Foundation

func convert(_ s: String, _ numRows: Int) -> String {
    if numRows < 2 {
        return s
    }
    var a = [String](repeatElement("", count: numRows))
    var i = 0
    for c in s {
        let j = i%(2*numRows - 2)
        if j >= 0 && j <= numRows - 1 {
            // 从上往下
            var d = a[j]
            d.append(c)
            a[j] = d
        } else {
            // 从下往上
            let k = 2*numRows - j - 2
            var d = a[k]
            d.append(c)
            a[k] = d
        }
        i = i + 1
    }
    var ss = ""
    for c in a {
        ss.append(c)
    }
    return ss
}
