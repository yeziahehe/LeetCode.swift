//
//  RemoveNthNodeFromEndOfList.swift
//  LeetCode.swift
//
//  Created by 叶帆 on 2020/3/12.
//  Copyright © 2020 Suzhou Coryphaei Information&Technology Co., Ltd. All rights reserved.
//

/**
 Given a linked list, remove the n-th node from the end of list and return its head.

 Example:

 Given linked list: 1->2->3->4->5, and n = 2.

 After removing the second node from the end, the linked list becomes 1->2->3->5.
 Note:

 Given n will always be valid.

 Follow up:

 Could you do this in one pass?
 =====
 给定一个链表，删除链表的倒数第 n 个节点，并且返回链表的头结点。

 示例：

 给定一个链表: 1->2->3->4->5, 和 n = 2.

 当删除了倒数第二个节点后，链表变为 1->2->3->5.
 说明：

 给定的 n 保证是有效的。

 进阶：

 你能尝试使用一趟扫描实现吗？

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

class Solution {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        let dummy = ListNode(-1)
        dummy.next = head
        
        var first: ListNode? = dummy
        var second: ListNode? = dummy
        
        for _ in 0..<n {
            first = first?.next
        }
        
        while(first?.next != nil) {
            first = first?.next
            second = second?.next
        }
        
        second?.next = second?.next?.next
        return dummy.next
    }
}

class Solution1 {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        // 两次遍历
        var size = 0
        var node = head
        while node != nil {
            size += 1
            node = node?.next
        }
        if n == size {
            return head?.next
        }
        node = head
        for i in 0..<size-n-1 {
            node = node?.next
        }
        node?.next = node?.next?.next
        return head
    }
}
