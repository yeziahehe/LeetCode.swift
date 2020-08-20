//
//  025_ReverseNodesInKGroup .swift
//  LeetCode.swift
//
//  Created by 叶帆 on 2020/8/14.
//  Copyright © 2020 Suzhou Coryphaei Information&Technology Co., Ltd. All rights reserved.
//

/**
 给你一个链表，每 k 个节点一组进行翻转，请你返回翻转后的链表。

 k 是一个正整数，它的值小于或等于链表的长度。

 如果节点总数不是 k 的整数倍，那么请将最后剩余的节点保持原有顺序。

  

 示例：

 给你这个链表：1->2->3->4->5

 当 k = 2 时，应当返回: 2->1->4->3->5

 当 k = 3 时，应当返回: 3->2->1->4->5

  

 说明：

 你的算法只能使用常数的额外空间。
 你不能只是单纯的改变节点内部的值，而是需要实际进行节点交换。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/reverse-nodes-in-k-group
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
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
    /** 反转区间 [a, b) 的元素，注意是左闭右开 */
    func reverse(_ a: ListNode?, _ b: ListNode?) -> ListNode? {
        var prev: ListNode?
        var cur: ListNode? = a
        while cur !== b {
            let t = cur?.next
            cur?.next = prev
            prev = cur
            cur = t
        }
        return prev
    }

    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        if head == nil {
            return nil
        }
        // 区间 [a, b) 包含 k 个待反转元素
        let a: ListNode? = head
        var b: ListNode? = head
        for _ in 0..<k {
            // 不足 k 个，不需要反转，base case
            if b == nil {
                return head
            }
            b = b?.next
        }
        // 反转前 k 个元素
        let newHead = reverse(a, b)
        // 递归反转后续链表并连接起来
        a?.next = reverseKGroup(b, k)
        return newHead
    }
}
