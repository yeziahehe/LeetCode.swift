//
//  ReverseLinkedList.swift
//  LeetCode.swift
//
//  Created by 叶帆 on 2017/11/6.
//  Copyright © 2017年 Suzhou Coryphaei Information&Technology Co., Ltd. All rights reserved.
//

/**
 Reverse a singly linked list.
 
 Hint:
 A linked list can be reversed either iteratively or recursively. Could you implement both?
 
 */

import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

//reversed iteratively
class Solution1 {
    func reverseList(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil {
            return head
        }
        var headNode = head
        var pre: ListNode? = nil
        while (headNode != nil) {
            let tmp = headNode?.next
            headNode?.next = pre
            pre = headNode
            headNode = tmp
        }
        return pre
    }
}

//reversed recursively
class Solution2 {
    func reverseList(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil {
            return head
        }
        let next = head?.next
        head?.next = nil
        let newHead = reverseList(next)
        next?.next = head
        return newHead
    }
}
