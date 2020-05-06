//
//  SerializeAndDeserializeBST.swift
//  LeetCode.swift
//
//  Created by 叶帆 on 2020/5/6.
//  Copyright © 2020 Suzhou Coryphaei Information&Technology Co., Ltd. All rights reserved.
//

/**
 Serialization is the process of converting a data structure or object into a sequence of bits so that it can be stored in a file or memory buffer, or transmitted across a network connection link to be reconstructed later in the same or another computer environment.

 Design an algorithm to serialize and deserialize a binary search tree. There is no restriction on how your serialization/deserialization algorithm should work. You just need to ensure that a binary search tree can be serialized to a string and this string can be deserialized to the original tree structure.

 The encoded string should be as compact as possible.

 Note: Do not use class member/global/static variables to store states. Your serialize and deserialize algorithms should be stateless.
 =====
 序列化是将数据结构或对象转换为一系列位的过程，以便它可以存储在文件或内存缓冲区中，或通过网络连接链路传输，以便稍后在同一个或另一个计算机环境中重建。

 设计一个算法来序列化和反序列化二叉搜索树。 对序列化/反序列化算法的工作方式没有限制。 您只需确保二叉搜索树可以序列化为字符串，并且可以将该字符串反序列化为最初的二叉搜索树。

 编码的字符串应尽可能紧凑。

 注意：不要使用类成员/全局/静态变量来存储状态。 你的序列化和反序列化算法应该是无状态的。

 */
import Foundation

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

class Codec {
    // Encodes a tree to a single string.
    func serialize(_ root: TreeNode?) -> String {
        guard let root = root else {
            return ""
        }
        let (l, r) = (serialize(root.left), serialize(root.right))
        return [String(root.val), l, r].filter { !$0.isEmpty }.joined(separator: " ")
    }
    
    // Decodes your encoded data to tree.
    func deserialize(_ data: String) -> TreeNode? {
        let vals = data.split(separator: " ").map { Int($0)! }
        var i = 0
        func h(_ cap: Int) -> TreeNode? {
            guard i < vals.count && vals[i] <= cap else {
                return nil
            }
            let root = TreeNode(vals[i])
            i += 1
            root.left = h(root.val)
            root.right = h(cap)
            return root
        }
        return h(Int.max)
    }
}
