//
//  RemoveLinkedListElements.swift
//  LeetCode.swift
//
//  Created by 叶帆 on 2020/3/12.
//  Copyright © 2020 Suzhou Coryphaei Information&Technology Co., Ltd. All rights reserved.
//

/**
 Remove all elements from a linked list of integers that have value val.

 Example:

 Input:  1->2->6->3->4->5->6, val = 6
 Output: 1->2->3->4->5
 =====
 删除链表中等于给定值 val 的所有节点。

 示例:

 输入: 1->2->6->3->4->5->6, val = 6
 输出: 1->2->3->4->5
 */

import Foundation

class Solution {
    func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
        let dummy = ListNode(-1)
        dummy.next = head
        var node: ListNode? = dummy
        while (node != nil) {
            if node?.next?.val == val {
                node?.next = node?.next?.next
            } else {
                node = node?.next
            }
        }
        return dummy.next
    }
}
