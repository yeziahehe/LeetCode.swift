//
//  DesignLinkedList.swift
//  LeetCode.swift
//
//  Created by 叶帆 on 2020/3/11.
//  Copyright © 2020 Suzhou Coryphaei Information&Technology Co., Ltd. All rights reserved.
//

/**
 Design your implementation of the linked list. You can choose to use the singly linked list or the doubly linked list. A node in a singly linked list should have two attributes: val and next. val is the value of the current node, and next is a pointer/reference to the next node. If you want to use the doubly linked list, you will need one more attribute prev to indicate the previous node in the linked list. Assume all nodes in the linked list are 0-indexed.

 Implement these functions in your linked list class:

 get(index) : Get the value of the index-th node in the linked list. If the index is invalid, return -1.
 addAtHead(val) : Add a node of value val before the first element of the linked list. After the insertion, the new node will be the first node of the linked list.
 addAtTail(val) : Append a node of value val to the last element of the linked list.
 addAtIndex(index, val) : Add a node of value val before the index-th node in the linked list. If index equals to the length of linked list, the node will be appended to the end of linked list. If index is greater than the length, the node will not be inserted.
 deleteAtIndex(index) : Delete the index-th node in the linked list, if the index is valid.
  

 Example:

 Input:
 ["MyLinkedList","addAtHead","addAtTail","addAtIndex","get","deleteAtIndex","get"]
 [[],[1],[3],[1,2],[1],[1],[1]]
 Output:
 [null,null,null,null,2,null,3]

 Explanation:
 MyLinkedList linkedList = new MyLinkedList(); // Initialize empty LinkedList
 linkedList.addAtHead(1);
 linkedList.addAtTail(3);
 linkedList.addAtIndex(1, 2);  // linked list becomes 1->2->3
 linkedList.get(1);            // returns 2
 linkedList.deleteAtIndex(1);  // now the linked list is 1->3
 linkedList.get(1);            // returns 3
  

 Constraints:

 0 <= index,val <= 1000
 Please do not use the built-in LinkedList library.
 At most 2000 calls will be made to get, addAtHead, addAtTail,  addAtIndex and deleteAtIndex.
 =====
 设计链表的实现。您可以选择使用单链表或双链表。单链表中的节点应该具有两个属性：val 和 next。val 是当前节点的值，next 是指向下一个节点的指针/引用。如果要使用双向链表，则还需要一个属性 prev 以指示链表中的上一个节点。假设链表中的所有节点都是 0-index 的。

 在链表类中实现这些功能：

 get(index)：获取链表中第 index 个节点的值。如果索引无效，则返回-1。
 addAtHead(val)：在链表的第一个元素之前添加一个值为 val 的节点。插入后，新节点将成为链表的第一个节点。
 addAtTail(val)：将值为 val 的节点追加到链表的最后一个元素。
 addAtIndex(index,val)：在链表中的第 index 个节点之前添加值为 val  的节点。如果 index 等于链表的长度，则该节点将附加到链表的末尾。如果 index 大于链表长度，则不会插入节点。如果index小于0，则在头部插入节点。
 deleteAtIndex(index)：如果索引 index 有效，则删除链表中的第 index 个节点。
  

 示例：

 MyLinkedList linkedList = new MyLinkedList();
 linkedList.addAtHead(1);
 linkedList.addAtTail(3);
 linkedList.addAtIndex(1,2);   //链表变为1-> 2-> 3
 linkedList.get(1);            //返回2
 linkedList.deleteAtIndex(1);  //现在链表是1-> 3
 linkedList.get(1);            //返回3
  

 提示：

 所有val值都在 [1, 1000] 之内。
 操作次数将在  [1, 1000] 之内。
 请不要使用内置的 LinkedList 库。
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

class MyLinkedList {
    
    var head: ListNode?
    var size: Int = 0

    /** Initialize your data structure here. */
    init() {
        head = nil
        size = 0
    }
    
    /** Get the value of the index-th node in the linked list. If the index is invalid, return -1. */
    func get(_ index: Int) -> Int {
        if index < 0 || index >= size {
            return -1
        }
        var indexNode = head
        for _ in 0..<index {
            indexNode = indexNode!.next
        }
        return indexNode!.val
    }
    
    /** Add a node of value val before the first element of the linked list. After the insertion, the new node will be the first node of the linked list. */
    func addAtHead(_ val: Int) {
        let newHead = ListNode(val)
        newHead.next = head
        head = newHead
        size += 1
    }
    
    /** Append a node of value val to the last element of the linked list. */
    func addAtTail(_ val: Int) {
        guard head != nil else {
            head = ListNode(val)
            size += 1
            return
        }
        let node = ListNode(val)
        var tailNode = head
            for _ in 0..<size-1 {
            tailNode = tailNode!.next
        }
        tailNode?.next = node
        size += 1
    }
    
    /** Add a node of value val before the index-th node in the linked list. If index equals to the length of linked list, the node will be appended to the end of linked list. If index is greater than the length, the node will not be inserted. */
    func addAtIndex(_ index: Int, _ val: Int) {
        if index > size {
            return
        }
        if index <= 0 {
            addAtHead(val)
            size += 1
            return
        }
        let node = ListNode(val)
        var indexNode = head
        for _ in 0..<index-1 {
            indexNode = indexNode!.next
        }
        node.next = indexNode!.next
        indexNode!.next = node
        size += 1
    }
    
    /** Delete the index-th node in the linked list, if the index is valid. */
    func deleteAtIndex(_ index: Int) {
        if index >= size || index < 0 || size <= 0 {
            return
        }
        if index == 0 {
            head = head!.next
            return
        }
        var indexNode = head
        for _ in 0..<index-1 {
            indexNode = indexNode!.next
        }
        indexNode!.next = indexNode!.next!.next
        size -= 1
    }
}

/**
 * Your MyLinkedList object will be instantiated and called as such:
 * let obj = MyLinkedList()
 * let ret_1: Int = obj.get(index)
 * obj.addAtHead(val)
 * obj.addAtTail(val)
 * obj.addAtIndex(index, val)
 * obj.deleteAtIndex(index)
 */

// 双向链表
class MyLinkedList1 {
    
    class ListNode {
        public var val: Int
        public var prev: ListNode?
        public var next: ListNode?
        public init(_ val: Int) {
            self.val = val
            self.prev = nil
            self.next = nil
        }
    }
    
    var size: Int = 0
    var head: ListNode?
    var tail: ListNode? {
        guard var node = head else {
            return nil
        }
        
        while let next = node.next {
            node = next
        }
        return node
    }

    /** Initialize your data structure here. */
    init() {
        head = nil
        size = 0
    }
    
    /** Get the value of the index-th node in the linked list. If the index is invalid, return -1. */
    func get(_ index: Int) -> Int {
        if index < 0 || index >= size {
            return -1
        }
        if index < (size >> 1) {
            var indexNode = head
            for _ in 0..<index {
                indexNode = indexNode!.next
            }
            return indexNode!.val
        } else {
            var indexNode = tail
            for _ in index..<size-1 {
                indexNode = indexNode!.prev
            }
            return indexNode!.val
        }
        
    }
    
    /** Add a node of value val before the first element of the linked list. After the insertion, the new node will be the first node of the linked list. */
    func addAtHead(_ val: Int) {
        let newHead = ListNode(val)
        if head == nil {
            head = newHead
        } else {
            newHead.next = head
            head?.prev = newHead
            head = newHead
        }
        size += 1
    }
    
    /** Append a node of value val to the last element of the linked list. */
    func addAtTail(_ val: Int) {
        let newTail = ListNode(val)
        if head == nil {
            head = newTail
        } else {
            newTail.prev = tail
            tail?.next = newTail
        }
        size += 1
    }
    
    /** Add a node of value val before the index-th node in the linked list. If index equals to the length of linked list, the node will be appended to the end of linked list. If index is greater than the length, the node will not be inserted. */
    func addAtIndex(_ index: Int, _ val: Int) {
        if index > size {
            return
        }
        if index <= 0 {
            addAtHead(val)
            return
        }
        let node = ListNode(val)
        var indexNode = head
        for _ in 0..<index-1 {
            indexNode = indexNode?.next
        }
        node.prev = indexNode
        node.next = indexNode?.next
        indexNode?.next?.prev = node
        indexNode?.next = node
        size += 1
    }
    
    /** Delete the index-th node in the linked list, if the index is valid. */
    func deleteAtIndex(_ index: Int) {
        if index >= size || index < 0 || size <= 0 {
            return
        }
        if index == 0 {
            head = head!.next
            size -= 1
            return
        }
        var indexNode = head
        for _ in 0..<index-1 {
            indexNode = indexNode!.next
        }
        indexNode?.next = indexNode?.next?.next
        indexNode?.next?.prev = indexNode
        size -= 1
    }
}
