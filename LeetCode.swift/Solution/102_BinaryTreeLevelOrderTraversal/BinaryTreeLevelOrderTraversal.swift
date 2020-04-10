//
//  BinaryTreeLevelOrderTraversal.swift
//  LeetCode.swift
//
//  Created by 叶帆 on 2020/4/10.
//  Copyright © 2020 Suzhou Coryphaei Information&Technology Co., Ltd. All rights reserved.
//

/**
 Given a binary tree, return the level order traversal of its nodes' values. (ie, from left to right, level by level).

 For example:
 Given binary tree [3,9,20,null,null,15,7],
     3
    / \
   9  20
     /  \
    15   7
 return its level order traversal as:
 [
   [3],
   [9,20],
   [15,7]
 ]
 =====
 给你一个二叉树，请你返回其按 层序遍历 得到的节点值。 （即逐层地，从左到右访问所有节点）。

  

 示例：
 二叉树：[3,9,20,null,null,15,7],

     3
    / \
   9  20
     /  \
    15   7
 返回其层次遍历结果：

 [
   [3],
   [9,20],
   [15,7]
 ]

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

class Solution {
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else {
            return []
        }
        var ans: [[Int]] = []
        var queue: [TreeNode] = [root]
        
        while !queue.isEmpty {
            var nextLevel: [TreeNode] = []
            var val: [Int] = []
            while queue.count > 0 {
                let node = queue.removeFirst()
                val.append(node.val)
                if let left = node.left {
                    nextLevel.append(left)
                }
                if let right = node.right {
                    nextLevel.append(right)
                }
            }
            ans.append(val)
            queue = nextLevel
        }
        return ans
    }
}
