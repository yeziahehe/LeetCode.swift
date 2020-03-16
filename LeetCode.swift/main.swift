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
obj.addAtHead(0)
obj.addAtIndex(1, 0)


let solution = Solution().isPalindrome(obj.head)
print(solution)


