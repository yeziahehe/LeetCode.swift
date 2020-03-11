//
//  LinkedListCycleII.swift
//  LeetCode.swift
//
//  Created by 叶帆 on 2020/3/11.
//  Copyright © 2020 Suzhou Coryphaei Information&Technology Co., Ltd. All rights reserved.
//

/**
 Given a linked list, return the node where the cycle begins. If there is no cycle, return null.

 To represent a cycle in the given linked list, we use an integer pos which represents the position (0-indexed) in the linked list where tail connects to. If pos is -1, then there is no cycle in the linked list.

 Note: Do not modify the linked list.

  

 Example 1:

 Input: head = [3,2,0,-4], pos = 1
 Output: tail connects to node index 1
 Explanation: There is a cycle in the linked list, where tail connects to the second node.


 Example 2:

 Input: head = [1,2], pos = 0
 Output: tail connects to node index 0
 Explanation: There is a cycle in the linked list, where tail connects to the first node.


 Example 3:

 Input: head = [1], pos = -1
 Output: no cycle
 Explanation: There is no cycle in the linked list.


  

 Follow-up:
 Can you solve it without using extra space?
 =====
 给定一个链表，返回链表开始入环的第一个节点。 如果链表无环，则返回 null。

 为了表示给定链表中的环，我们使用整数 pos 来表示链表尾连接到链表中的位置（索引从 0 开始）。 如果 pos 是 -1，则在该链表中没有环。

 说明：不允许修改给定的链表。

  

 示例 1：

 输入：head = [3,2,0,-4], pos = 1
 输出：tail connects to node index 1
 解释：链表中有一个环，其尾部连接到第二个节点。


 示例 2：

 输入：head = [1,2], pos = 0
 输出：tail connects to node index 0
 解释：链表中有一个环，其尾部连接到第一个节点。


 示例 3：

 输入：head = [1], pos = -1
 输出：no cycle
 解释：链表中没有环。


  

 进阶：
 你是否可以不用额外空间解决此题？

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
    func detectCycle(head: ListNode?) -> ListNode? {
        var slow = head
        var fast = head
        while true {
            if fast == nil || fast?.next == nil {
                return nil
            }
            slow = slow?.next
            fast = fast?.next?.next
            if slow === fast {
                break
            }
        }
        fast = head
        while slow !== fast {
            slow = slow?.next
            fast = fast?.next
        }
        return fast
    }
}
