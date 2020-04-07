//
//  ImplementStackUsingQueues.swift
//  LeetCode.swift
//
//  Created by 叶帆 on 2020/4/6.
//  Copyright © 2020 Suzhou Coryphaei Information&Technology Co., Ltd. All rights reserved.
//

/**
 Implement the following operations of a stack using queues.

 push(x) -- Push element x onto stack.
 pop() -- Removes the element on top of the stack.
 top() -- Get the top element.
 empty() -- Return whether the stack is empty.
 Example:

 MyStack stack = new MyStack();

 stack.push(1);
 stack.push(2);
 stack.top();   // returns 2
 stack.pop();   // returns 2
 stack.empty(); // returns false
 Notes:

 You must use only standard operations of a queue -- which means only push to back, peek/pop from front, size, and is empty operations are valid.
 Depending on your language, queue may not be supported natively. You may simulate a queue by using a list or deque (double-ended queue), as long as you use only standard operations of a queue.
 You may assume that all operations are valid (for example, no pop or top operations will be called on an empty stack).
 =====
 使用队列实现栈的下列操作：

 push(x) -- 元素 x 入栈
 pop() -- 移除栈顶元素
 top() -- 获取栈顶元素
 empty() -- 返回栈是否为空
 注意:

 你只能使用队列的基本操作-- 也就是 push to back, peek/pop from front, size, 和 is empty 这些操作是合法的。
 你所使用的语言也许不支持队列。 你可以使用 list 或者 deque（双端队列）来模拟一个队列 , 只要是标准的队列操作即可。
 你可以假设所有操作都是有效的（例如, 对一个空的栈不会调用 pop 或者 top 操作）。

 */

import Foundation

class Queue {
    private var array = [Int]()
    
    func push(x: Int) {
        array.append(x)
    }
    
    func pop() -> Int {
        return array.removeFirst()
    }
    
    func empty() -> Bool {
        return array.isEmpty
    }

    func peek() -> Int {
        return array.first ?? -1
    }
}

class MyStack {

    var queue = Queue()
    var temp = Queue()

    /** Initialize your data structure here. */
    init() {
        
    }
    
    /** Push element x onto stack. */
    func push(_ x: Int) {
        temp.push(x: x)
        while !queue.empty() {
            temp.push(x: queue.pop())
        }
        while !temp.empty() {
            queue.push(x: temp.pop())
        }
    }
    
    /** Removes the element on top of the stack and returns that element. */
    func pop() -> Int {
        return queue.pop()
    }
    
    /** Get the top element. */
    func top() -> Int {
        return queue.peek()
    }
    
    /** Returns whether the stack is empty. */
    func empty() -> Bool {
        return queue.empty()
    }
}
