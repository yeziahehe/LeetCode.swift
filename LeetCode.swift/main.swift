//
//  main.swift
//  LeetCode.swift
//
//  Created by 叶帆 on 2017/10/10.
//  Copyright © 2017年 Suzhou Coryphaei Information&Technology Co., Ltd. All rights reserved.
//

import Foundation

print("Hello, LeetCode!")

// let solution = Solution().reverseWords("the sky is blue")
// print(solution)

let obj = MyLinkedList()
obj.addAtHead(1)
obj.addAtTail(3)
obj.addAtIndex(1, 2)
let ret_1: Int = obj.get(1)
obj.deleteAtIndex(0)
let ret_2: Int = obj.get(0)

