//
//  146_LRUCache.swift
//  LeetCode.swift
//
//  Created by 叶帆 on 2020/8/13.
//  Copyright © 2020 Suzhou Coryphaei Information&Technology Co., Ltd. All rights reserved.
//

/**
 运用你所掌握的数据结构，设计和实现一个  LRU (最近最少使用) 缓存机制。它应该支持以下操作： 获取数据 get 和 写入数据 put 。

 获取数据 get(key) - 如果关键字 (key) 存在于缓存中，则获取关键字的值（总是正数），否则返回 -1。
 写入数据 put(key, value) - 如果关键字已经存在，则变更其数据值；如果关键字不存在，则插入该组「关键字/值」。当缓存容量达到上限时，它应该在写入新数据之前删除最久未使用的数据值，从而为新的数据值留出空间。

  

 进阶:

 你是否可以在 O(1) 时间复杂度内完成这两种操作？

  

 示例:

 LRUCache cache = new LRUCache( 2 /* 缓存容量 */ );

 cache.put(1, 1);
 cache.put(2, 2);
 cache.get(1);       // 返回  1
 cache.put(3, 3);    // 该操作会使得关键字 2 作废
 cache.get(2);       // 返回 -1 (未找到)
 cache.put(4, 4);    // 该操作会使得关键字 1 作废
 cache.get(1);       // 返回 -1 (未找到)
 cache.get(3);       // 返回  3
 cache.get(4);       // 返回  4

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/lru-cache
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
import Foundation

class LRUCache {

    var dummyHead = ListNode(0, 0)
    var dummyTail = ListNode(0, 0)
    var capacity: Int
    var map: [Int: ListNode] = [:]
    var size: Int = 0

    init(_ capacity: Int) {
        self.capacity = capacity
        self.dummyHead.next = dummyTail
        self.dummyTail.prev = dummyHead
    }
    
    func get(_ key: Int) -> Int {
        if let node = map[key] {
            // 先从链表中删除这个节点
            remove(node)
            // 重新插到队头
            addHead(node)
            return node.val
        }
        return -1
    }
    
    func put(_ key: Int, _ value: Int) {
        if let node = map[key] {
            node.val = value
            remove(node)
            addHead(node)
        } else {
            // 不存在
            if size >= capacity, let tailNode = removeTail() {
                // 删除最久未使用的元素
                map.removeValue(forKey: tailNode.key)
                size -= 1
            }
            let node = ListNode(key, value)
            addHead(node)
            // 别忘了在 map 中添加 key 的映射
            map[key] = node
            size += 1
        }
    }

    /// 添加头结点
    func addHead(_ node: ListNode) {
        let next = dummyHead.next
        node.next = next
        node.prev = dummyHead
        dummyHead.next = node
        next?.prev = node
    }

    /// 删除节点
    func remove(_ node: ListNode) {
        node.prev?.next = node.next
        node.next?.prev = node.prev
        node.next = nil
        node.prev = nil
    }

    /// 删除尾节点
    func removeTail() -> ListNode? {
        if let node = dummyTail.prev {
            dummyTail.prev = node.prev
            dummyTail.prev?.next = dummyTail
            return node
        }
        return nil
    }
}

public class ListNode {
    /**
    到这里就能回答刚才「为什么必须要用双向链表」的问题了，因为我们需要删除操作。删除一个节点不光要得到该节点本身的指针，也需要操作其前驱节点的指针，而双向链表才能支持直接查找前驱，保证操作的时间复杂度 O(1)。
    */
    public var key: Int
    public var val: Int
    public var prev: ListNode?
    public var next: ListNode?
    public init(_ key: Int, _ val: Int) {
        self.key = key
        self.val = val
    }
}
