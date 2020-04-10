//
//  BinaryTreeInorderTraversal.swift
//  LeetCode.swift
//
//  Created by 叶帆 on 2020/4/10.
//  Copyright © 2020 Suzhou Coryphaei Information&Technology Co., Ltd. All rights reserved.
//

/**
 Given a binary tree, return the inorder traversal of its nodes' values.

 Example:

 Input: [1,null,2,3]
    1
     \
      2
     /
    3

 Output: [1,3,2]
 Follow up: Recursive solution is trivial, could you do it iteratively?
 =====
 给定一个二叉树，返回它的中序 遍历。

 示例:

 输入: [1,null,2,3]
    1
     \
      2
     /
    3

 输出: [1,3,2]
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
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        guard let root = root else {
            return []
        }
        var ans: [Int] = []
        ans += inorderTraversal(root.left)
        ans.append(root.val)
        ans += inorderTraversal(root.right)
        return ans
    }
    // 迭代
    func inorderTraversal1(_ root: TreeNode?) -> [Int] {
        guard let root = root else {
            return []
        }
        var ans: [Int] = []
        var stack: [TreeNode] = []
        var node: TreeNode? = root
        while !stack.isEmpty || node != nil {
            //不断往左子树方向走，每走一次就将当前节点保存到栈中
            while node != nil {
                stack.append(node!)
                node = node!.left
            }
            // 当走到空的时候，加入 ans，继续遍历右子树
            node = stack.popLast()
            ans.append(node!.val)
            node = node!.right
        }
        return ans
    }
}
