//
//  AddTwoNumbers.swift
//  LeetCode.swift
//
//  Created by 叶帆 on 2017/10/10.
//  Copyright © 2017年 Suzhou Coryphaei Information&Technology Co., Ltd. All rights reserved.
//

/**
 You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.
 
 You may assume the two numbers do not contain any leading zero, except the number 0 itself.
 
 Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
 Output: 7 -> 0 -> 8
 */

import Foundation

class Solution {
    
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let headNode = ListNode(0)
        var p = l1, q = l2, curr = headNode
        var carry = 0
        while (p != nil || q != nil || carry != 0){
            let x = (p != nil) ? p!.val : 0
            let y = (q != nil) ? q!.val : 0
            let sum = x + y + carry
            carry = sum / 10
            curr.next = ListNode(sum % 10)
            curr = curr.next!
            if (p != nil) {
                p = p!.next
            }
            if (q != nil) {
                q = q!.next
            }
        }
        return headNode.next!
    }
}
