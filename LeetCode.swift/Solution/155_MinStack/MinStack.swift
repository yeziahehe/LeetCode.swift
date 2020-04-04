//
//  MinStack.swift
//  LeetCode.swift
//
//  Created by 叶帆 on 2020/4/4.
//  Copyright © 2020 Suzhou Coryphaei Information&Technology Co., Ltd. All rights reserved.
//

/**
 Design a stack that supports push, pop, top, and retrieving the minimum element in constant time.

 push(x) -- Push element x onto stack.
 pop() -- Removes the element on top of the stack.
 top() -- Get the top element.
 getMin() -- Retrieve the minimum element in the stack.
  

 Example:

 MinStack minStack = new MinStack();
 minStack.push(-2);
 minStack.push(0);
 minStack.push(-3);
 minStack.getMin();   --> Returns -3.
 minStack.pop();
 minStack.top();      --> Returns 0.
 minStack.getMin();   --> Returns -2.
 =====
 设计一个支持 push，pop，top 操作，并能在常数时间内检索到最小元素的栈。

 push(x) -- 将元素 x 推入栈中。
 pop() -- 删除栈顶的元素。
 top() -- 获取栈顶元素。
 getMin() -- 检索栈中的最小元素。
 示例:

 MinStack minStack = new MinStack();
 minStack.push(-2);
 minStack.push(0);
 minStack.push(-3);
 minStack.getMin();   --> 返回 -3.
 minStack.pop();
 minStack.top();      --> 返回 0.
 minStack.getMin();   --> 返回 -2.

 */

import Foundation

class MinStack {

    private var array:[(Int, Int)] = []
    
    /** initialize your data structure here. */
    init() {
        array = []
    }
    
    func push(_ x: Int) {
        array.append((x, min(x, array.last?.1 ?? x)))
    }
    
    func pop() {
        _ = array.removeLast()
    }
    
    func top() -> Int {
        return array.last?.0 ?? -1
    }
    
    func getMin() -> Int {
        return array.last?.1 ?? -1
    }
}
