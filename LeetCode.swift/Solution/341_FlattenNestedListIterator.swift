//
//  341_FlattenNestedListIterator.swift
//  LeetCode.swift
//
//  Created by 叶帆 on 2020/12/14.
//  Copyright © 2020 Suzhou Coryphaei Information&Technology Co., Ltd. All rights reserved.
//

/**
 给你一个嵌套的整型列表。请你设计一个迭代器，使其能够遍历这个整型列表中的所有整数。

 列表中的每一项或者为一个整数，或者是另一个列表。其中列表的元素也可能是整数或是其他列表。

  

 示例 1:

 输入: [[1,1],2,[1,1]]
 输出: [1,1,2,1,1]
 解释: 通过重复调用 next 直到 hasNext 返回 false，next 返回的元素的顺序应该是: [1,1,2,1,1]。
 示例 2:

 输入: [1,[4,[6]]]
 输出: [1,4,6]
 解释: 通过重复调用 next 直到 hasNext 返回 false，next 返回的元素的顺序应该是: [1,4,6]。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/flatten-nested-list-iterator
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
import Foundation

class NestedInteger {
    private var val: Int?
    private var list: [NestedInteger]?

    // Return true if this NestedInteger holds a single integer, rather than a nested list.
    // 如果其中存的是一个整数，则返回 true，否则返回 false
    public func isInteger() -> Bool {
        return val != nil
    }

    // Return the single integer that this NestedInteger holds, if it holds a single integer
    // The result is undefined if this NestedInteger holds a nested list
    // 如果其中存的是一个整数，则返回这个整数，否则返回 null
    public func getInteger() -> Int? {
        return val ?? nil
    }

    // Set this NestedInteger to hold a single integer.
    public func setInteger(value: Int) {
        val = value
        list = nil
    }

    // Set this NestedInteger to hold a nested list and adds a nested integer to it.
    public func add(elem: NestedInteger) {
        val = nil
        list = [elem]
    }

    // Return the nested list that this NestedInteger holds, if it holds a nested list
    // The result is undefined if this NestedInteger holds a single integer
    // 如果其中存的是一个列表，则返回这个列表，否则返回 null
    public func getList() -> [NestedInteger] {
        return list ?? []
    }
}

class NestedIterator {

    private var list: [NestedInteger]!

    // 构造函数输入一个 NestedInteger 列表
    init(_ nestedList: [NestedInteger]) {
        // 不直接用 nestedList 的引用，是因为不能确定它的底层实现
        // 必须保证是 LinkedList，否则下面的 addFirst 会很低效
        list = nestedList
    }
    
    // 返回下一个整数
    func next() -> Int {
        // hasNext 方法保证了第一个元素一定是整数类型
        return list.removeFirst().getInteger() ?? 0
    }
    
    // 是否还有下一个元素？
    func hasNext() -> Bool {
        // 循环拆分列表元素，直到列表第一个元素是整数类型
        while !list.isEmpty && !(list.first?.isInteger())! {
            // 当列表开头第一个元素是列表类型时，进入循环
            let first = list.removeFirst().getList()
            // 将第一个列表打平并按顺序添加到开头
            for i in (0..<first.count).reversed() {
                list.insert(first[i], at: 0)
            }
        }
        return !list.isEmpty
    }
}
