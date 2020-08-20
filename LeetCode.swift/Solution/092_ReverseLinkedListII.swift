//
//  092_ReverseLinkedListII.swift
//  LeetCode.swift
//
//  Created by 叶帆 on 2020/8/13.
//  Copyright © 2020 Suzhou Coryphaei Information&Technology Co., Ltd. All rights reserved.
//

/**
 反转从位置 m 到 n 的链表。请使用一趟扫描完成反转。

 说明:
 1 ≤ m ≤ n ≤ 链表长度。

 示例:

 输入: 1->2->3->4->5->NULL, m = 2, n = 4
 输出: 1->4->3->2->5->NULL

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/reverse-linked-list-ii
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
import Foundation

class Solution {
    var successor: ListNode?

    func reverseN(_ head: ListNode?, _ n: Int) -> ListNode? {
        if n == 1 {
            successor = head?.next
            return head
        }
        let last = reverseN(head?.next, n - 1)
        head?.next?.next = head
        head?.next = successor
        return last
    }

    func reverseBetween(_ head: ListNode?, _ m: Int, _ n: Int) -> ListNode? {
        if m == 1 {
            return reverseN(head, n)
        }
        head?.next = reverseBetween(head?.next, m - 1, n - 1)
        return head
    }
}

class Solution1 {
    func reverseBetween(_ head: ListNode?, _ m: Int, _ n: Int) -> ListNode? {
        if n == 1 || head == nil {
            return head
        }
        var prev: ListNode?
        var cur: ListNode? = head
        var m = m
        var n = n
        while m > 1 {
            prev = cur
            cur = cur?.next
            m -= 1
            n -= 1
        }
        let before: ListNode? = prev
        let after: ListNode? = cur
        var newHead: ListNode? = head
        while n > 0 {
            let t = cur?.next
            cur?.next = prev
            prev = cur
            cur = t
            n -= 1
        }
        if before != nil {
            before?.next = prev
        } else {
            newHead = prev
        }
        after?.next = cur
        return newHead
    }
}
