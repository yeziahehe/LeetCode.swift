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

//reversed iteratively
class Solution {
    func reverseList(_ head: ListNode?) -> ListNode? {
        var pre: ListNode? = nil
        var cur = head
        while cur != nil {
            let t = cur?.next
            cur?.next = pre
            pre = cur
            cur = t
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
        let newHead = reverseList(head?.next)
        head?.next?.next = head
        head?.next = nil
        return newHead
    }
}
