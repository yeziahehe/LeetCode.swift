//
//  CopyListWithRandomPointer.swift
//  LeetCode.swift
//
//  Created by 叶帆 on 2020/4/3.
//  Copyright © 2020 Suzhou Coryphaei Information&Technology Co., Ltd. All rights reserved.
//

/**
 给定一个链表，每个节点包含一个额外增加的随机指针，该指针可以指向链表中的任何节点或空节点。

 要求返回这个链表的 深拷贝。

 我们用一个由 n 个节点组成的链表来表示输入/输出中的链表。每个节点用一个 [val, random_index] 表示：

 val：一个表示 Node.val 的整数。
 random_index：随机指针指向的节点索引（范围从 0 到 n-1）；如果不指向任何节点，则为  null 。
  

 示例 1：



 输入：head = [[7,null],[13,0],[11,4],[10,2],[1,0]]
 输出：[[7,null],[13,0],[11,4],[10,2],[1,0]]
 示例 2：



 输入：head = [[1,1],[2,1]]
 输出：[[1,1],[2,1]]
 示例 3：



 输入：head = [[3,null],[3,0],[3,null]]
 输出：[[3,null],[3,0],[3,null]]
 示例 4：

 输入：head = []
 输出：[]
 解释：给定的链表为空（空指针），因此返回 null。
  

 提示：

 -10000 <= Node.val <= 10000
 Node.random 为空（null）或指向链表中的节点。
 节点数目不超过 1000 。

 =====
 A linked list is given such that each node contains an additional random pointer which could point to any node in the list or null.

 Return a deep copy of the list.

 The Linked List is represented in the input/output as a list of n nodes. Each node is represented as a pair of [val, random_index] where:

 val: an integer representing Node.val
 random_index: the index of the node (range from 0 to n-1) where random pointer points to, or null if it does not point to any node.
  

 Example 1:


 Input: head = [[7,null],[13,0],[11,4],[10,2],[1,0]]
 Output: [[7,null],[13,0],[11,4],[10,2],[1,0]]
 Example 2:


 Input: head = [[1,1],[2,1]]
 Output: [[1,1],[2,1]]
 Example 3:



 Input: head = [[3,null],[3,0],[3,null]]
 Output: [[3,null],[3,0],[3,null]]
 Example 4:

 Input: head = []
 Output: []
 Explanation: Given linked list is empty (null pointer), so return null.
  

 Constraints:

 -10000 <= Node.val <= 10000
 Node.random is null or pointing to a node in the linked list.
 Number of Nodes will not exceed 1000.
 
 */
import Foundation

public class Node {
    public var val: Int
    public var next: Node?
    public var random: Node?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
        self.random = nil
    }
}

class Solution {
    func copyRandomList(_ head: Node?) -> Node? {
        if head == nil {
            return head
        }
        var node = head
        // 1. 将复制节点添加到原节点后面
        while node != nil {
            let copy = Node(node!.val)
            copy.next = node?.next
            node?.next = copy
            node = copy.next
        }
        // 2. 复制random节点
        node = head
        while node != nil {
            node?.next?.random = node?.random?.next
            node = node?.next?.next
        }
        // 3. 取出拷贝的链表
        node = head
        let newHead = head?.next
        var newNode = newHead
        while node != nil {
            node?.next = node?.next?.next
            newNode?.next = newNode?.next?.next
            node = node?.next
            newNode = newNode?.next
        }
        return newHead
    }
}
