//
//  PalindromeLinkedList.swift
//  LeetCode.swift
//
//  Created by 叶帆 on 2020/3/13.
//  Copyright © 2020 Suzhou Coryphaei Information&Technology Co., Ltd. All rights reserved.
//

/**
 Given a singly linked list, determine if it is a palindrome.

 Example 1:

 Input: 1->2
 Output: false
 Example 2:

 Input: 1->2->2->1
 Output: true
 Follow up:
 Could you do it in O(n) time and O(1) space?
 =====
 请判断一个链表是否为回文链表。

 示例 1:

 输入: 1->2
 输出: false
 示例 2:

 输入: 1->2->2->1
 输出: true
 进阶：
 你能否用 O(n) 时间复杂度和 O(1) 空间复杂度解决此题？

 */

import Foundation

class Solution {
    func isPalindrome(_ head: ListNode?) -> Bool {
        let middle = endOfFirstHalf(head)
        var first = head
        var second = reverseList(middle?.next)
        while(second != nil) {
            if first?.val != second?.val {
                reverseList(middle?.next)
                return false
            }
            first = first?.next
            second = second?.next
        }
        reverseList(middle?.next)
        return true
    }

    @discardableResult
    func reverseList(_ head: ListNode?) -> ListNode? {
        var pre: ListNode? = nil
        var cur = head
        while(cur != nil) {
            let t = cur?.next
            cur?.next = pre
            pre = cur
            cur = t
        }
        return pre
    }

    func endOfFirstHalf(_ head: ListNode?) -> ListNode? {
        var fast = head
        var slow = head
        while(slow?.next != nil && fast?.next?.next != nil) {
            fast = fast?.next?.next
            slow = slow?.next
        }
        return slow
    }
}
