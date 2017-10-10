//
//  main.swift
//  LeetCode.swift
//
//  Created by 叶帆 on 2017/10/10.
//  Copyright © 2017年 Suzhou Coryphaei Information&Technology Co., Ltd. All rights reserved.
//

import Foundation

print("Hello, LeetCode!")

let l1 = ListNode(2)
let temp1 = ListNode(4)
let temp2 = ListNode(3)
l1.next = temp1
temp1.next = temp2

let l2 = ListNode(5)
let temp3 = ListNode(6)
let temp4 = ListNode(4)
l2.next = temp3
temp3.next = temp4


let solution = Solution().addTwoNumbers(l1, l2)
print(solution?.val)
