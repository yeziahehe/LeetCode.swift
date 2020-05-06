//
//  SerializeAndDeserializeBinaryTree.swift
//  LeetCode.swift
//
//  Created by 叶帆 on 2020/5/6.
//  Copyright © 2020 Suzhou Coryphaei Information&Technology Co., Ltd. All rights reserved.
//

/**
 Serialization is the process of converting a data structure or object into a sequence of bits so that it can be stored in a file or memory buffer, or transmitted across a network connection link to be reconstructed later in the same or another computer environment.

 Design an algorithm to serialize and deserialize a binary tree. There is no restriction on how your serialization/deserialization algorithm should work. You just need to ensure that a binary tree can be serialized to a string and this string can be deserialized to the original tree structure.

 Example:

 You may serialize the following tree:

     1
    / \
   2   3
      / \
     4   5

 as "[1,2,3,null,null,4,5]"
 Clarification: The above format is the same as how LeetCode serializes a binary tree. You do not necessarily need to follow this format, so please be creative and come up with different approaches yourself.

 Note: Do not use class member/global/static variables to store states. Your serialize and deserialize algorithms should be stateless.
 =====
 序列化是将一个数据结构或者对象转换为连续的比特位的操作，进而可以将转换后的数据存储在一个文件或者内存中，同时也可以通过网络传输到另一个计算机环境，采取相反方式重构得到原数据。

 请设计一个算法来实现二叉树的序列化与反序列化。这里不限定你的序列 / 反序列化算法执行逻辑，你只需要保证一个二叉树可以被序列化为一个字符串并且将这个字符串反序列化为原始的树结构。

 示例:

 你可以将以下二叉树：

     1
    / \
   2   3
      / \
     4   5

 序列化为 "[1,2,3,null,null,4,5]"
 提示: 这与 LeetCode 目前使用的方式一致，详情请参阅 LeetCode 序列化二叉树的格式。你并非必须采取这种方式，你也可以采用其他的方法解决这个问题。

 说明: 不要使用类的成员 / 全局 / 静态变量来存储状态，你的序列化和反序列化算法应该是无状态的。

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
    private static let spliter = ","
    private static let nullStr = "N"

    func serialize(_ root: TreeNode?) -> String {
        var str = ""
        buildString(root, &str)
        return str
    }

    private func buildString(_ root: TreeNode?, _ str: inout String) {
        guard let root = root else {
            str = str + Codec.nullStr + Codec.spliter
            return
        }
        str = str + "\(root.val)" + Codec.spliter
        buildString(root.left, &str)
        buildString(root.right, &str)
    }
    
    func deserialize(_ data: String) -> TreeNode? {
        var nodes: [String] = data.split(separator: Character(Codec.spliter)).map { String($0) }
        return buildTree(&nodes)
    }

    private func buildTree(_ nodes: inout [String]) -> TreeNode? {
        let val = nodes.removeFirst()
        if val == Codec.nullStr {
            return nil
        }
        let node = TreeNode(Int(val)!)
        node.left = buildTree(&nodes)
        node.right = buildTree(&nodes)
        return node
    }
}
