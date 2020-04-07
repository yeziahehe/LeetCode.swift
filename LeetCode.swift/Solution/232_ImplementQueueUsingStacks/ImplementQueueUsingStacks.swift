//
//  ImplementQueueUsingStacks.swift
//  LeetCode.swift
//
//  Created by 叶帆 on 2020/4/7.
//  Copyright © 2020 Suzhou Coryphaei Information&Technology Co., Ltd. All rights reserved.
//

/**
 Implement the following operations of a queue using stacks.

 push(x) -- Push element x to the back of queue.
 pop() -- Removes the element from in front of queue.
 peek() -- Get the front element.
 empty() -- Return whether the queue is empty.
 Example:

 MyQueue queue = new MyQueue();

 queue.push(1);
 queue.push(2);
 queue.peek();  // returns 1
 queue.pop();   // returns 1
 queue.empty(); // returns false
 Notes:

 You must use only standard operations of a stack -- which means only push to top, peek/pop from top, size, and is empty operations are valid.
 Depending on your language, stack may not be supported natively. You may simulate a stack by using a list or deque (double-ended queue), as long as you use only standard operations of a stack.
 You may assume that all operations are valid (for example, no pop or peek operations will be called on an empty queue).
 =====
 使用栈实现队列的下列操作：

 push(x) -- 将一个元素放入队列的尾部。
 pop() -- 从队列首部移除元素。
 peek() -- 返回队列首部的元素。
 empty() -- 返回队列是否为空。
 示例:

 MyQueue queue = new MyQueue();

 queue.push(1);
 queue.push(2);
 queue.peek();  // 返回 1
 queue.pop();   // 返回 1
 queue.empty(); // 返回 false
 说明:

 你只能使用标准的栈操作 -- 也就是只有 push to top, peek/pop from top, size, 和 is empty 操作是合法的。
 你所使用的语言也许不支持栈。你可以使用 list 或者 deque（双端队列）来模拟一个栈，只要是标准的栈操作即可。
 假设所有操作都是有效的 （例如，一个空的队列不会调用 pop 或者 peek 操作）。

 */

import Foundation

class Stack {
    private var array = [Int]()
    
    func push(x: Int) {
        array.append(x)
    }
    
    func pop() -> Int {
        return array.removeLast()
    }
    
    func empty() -> Bool {
        return array.isEmpty
    }

    func top() -> Int {
        return array.last ?? -1
    }
}

class MyQueue {

    var stack = Stack()
    var temp = Stack()
    /** Initialize your data structure here. */
    init() {

    }
    
    /** Push element x to the back of queue. */
    func push(_ x: Int) {
        while !stack.empty() {
            temp.push(x: stack.pop())
        }
        stack.push(x: x)
        while !temp.empty() {
            stack.push(x: temp.pop())
        }
    }
    
    /** Removes the element from in front of queue and returns that element. */
    func pop() -> Int {
        return stack.pop()
    }
    
    /** Get the front element. */
    func peek() -> Int {
        return stack.top()
    }
    
    /** Returns whether the queue is empty. */
    func empty() -> Bool {
        return stack.empty()
    }
}
