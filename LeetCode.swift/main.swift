//
//  main.swift
//  LeetCode.swift
//
//  Created by 叶帆 on 2017/10/10.
//  Copyright © 2017年 Suzhou Coryphaei Information&Technology Co., Ltd. All rights reserved.
//

import Foundation

print("Hello, LeetCode!")

let obj = MyLinkedList()
obj.addAtHead(1)
obj.addAtIndex(1, 2)
obj.addAtIndex(2, 3)
obj.addAtIndex(3, 4)
obj.addAtIndex(4, 5)


let solution = Solution().oddEvenList(obj.head)
print(solution)


