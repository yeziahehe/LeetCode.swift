//
//  BinaryTreePreorderTraversal.swift
//  LeetCode.swift
//
//  Created by 叶帆 on 2020/4/10.
//  Copyright © 2020 Suzhou Coryphaei Information&Technology Co., Ltd. All rights reserved.
//

/**
 Given a binary tree, return the preorder traversal of its nodes' values.

 Example:

 Input: [1,null,2,3]
    1
     \
      2
     /
    3

 Output: [1,2,3]
 Follow up: Recursive solution is trivial, could you do it iteratively?
 =====
 给定一个二叉树，返回它的 前序 遍历。

  示例:

 输入: [1,null,2,3]
    1
     \
      2
     /
    3

 输出: [1,2,3]
 进阶: 递归算法很简单，你可以通过迭代算法完成吗？

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
    // 递归
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        guard let root = root else {
            return []
        }
        var ans: [Int] = []
        ans.append(root.val)
        ans += preorderTraversal(root.left)
        ans += preorderTraversal(root.right)
        return ans
    }
    // 迭代
    func preorderTraversal1(_ root: TreeNode?) -> [Int] {
        guard let root = root else {
            return []
        }
        var ans: [Int] = []
        var stack: [TreeNode] = [root]
        while let node = stack.popLast() {
            ans.append(node.val)
            if let right = node.right {
                stack.append(right)
            }
            if let left = node.left {
                stack.append(left)
            }
        }
        return ans
    }
}
