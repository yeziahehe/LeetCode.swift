//
//  main.swift
//  LeetCode.swift
//
//  Created by 叶帆 on 2017/10/10.
//  Copyright © 2017年 Suzhou Coryphaei Information&Technology Co., Ltd. All rights reserved.
//

import Foundation

print("Hello, LeetCode!")

let cache = Cache(capacity: 2) // Cache容量为 2

print(cache.get(key: 1)) // 返回 -1
cache.put(key: 1, val: 10)
print(cache.get(key: 1)) // 返回 10

cache.put(key: 2, val: 20)
print(cache.get(key: 2)) // 返回 20

cache.put(key: 3, val: 30) // 因pair（1，10）被访问时间更早，将被移除
print(cache.get(key: 1)) // 返回 -1
print(cache.get(key: 2)) // 返回 20
print(cache.get(key: 3)) // 返回 30
