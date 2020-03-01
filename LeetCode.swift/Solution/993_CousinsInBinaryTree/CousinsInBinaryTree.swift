//
//  CousinsInBinaryTree.swift
//  LeetCode.swift
//
//  Created by 叶帆 on 2019/7/17.
//  Copyright © 2019 Suzhou Coryphaei Information&Technology Co., Ltd. All rights reserved.
//

/**
 In a binary tree, the root node is at depth 0, and children of each depth k node are at depth k+1.
 
 Two nodes of a binary tree are cousins if they have the same depth, but have different parents.
 
 We are given the root of a binary tree with unique values, and the values x and y of two different nodes in the tree.
 
 Return true if and only if the nodes corresponding to the values x and y are cousins.
 
 Example 1:
 
 Input: root = [1,2,3,4], x = 4, y = 3
 Output: false
 
 Example 2:
 
 Input: root = [1,2,3,null,4,null,5], x = 5, y = 4
 Output: true
 
 Example 3:
 
 Input: root = [1,2,3,null,4], x = 2, y = 3
 Output: false
 
 ==========
 
 在二叉树中，根节点位于深度 0 处，每个深度为 k 的节点的子节点位于深度 k+1 处。
 
 如果二叉树的两个节点深度相同，但父节点不同，则它们是一对堂兄弟节点。
 
 我们给出了具有唯一值的二叉树的根节点 root，以及树中两个不同节点的值 x 和 y。
 
 只有与值 x 和 y 对应的节点是堂兄弟节点时，才返回 true。否则，返回 false。

 示例 1：
 
 输入：root = [1,2,3,4], x = 4, y = 3
 输出：false
 
 示例 2：
 
 输入：root = [1,2,3,null,4,null,5], x = 5, y = 4
 输出：true
 
 示例 3：

 输入：root = [1,2,3,null,4], x = 2, y = 3
 输出：false
   
 
 提示：
 
 二叉树的节点数介于 2 到 100 之间。
 每个节点的值都是唯一的、范围为 1 到 100 的整数。
 **/

import Foundation

/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */

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
    func isCousins(_ root: TreeNode?, _ x: Int, _ y: Int) -> Bool {
        
    }
}
