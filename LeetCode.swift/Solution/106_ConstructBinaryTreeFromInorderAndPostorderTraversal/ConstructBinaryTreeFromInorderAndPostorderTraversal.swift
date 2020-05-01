//
//  ConstructBinaryTreeFromInorderAndPostorderTraversal.swift
//  LeetCode.swift
//
//  Created by 叶帆 on 2020/4/30.
//  Copyright © 2020 Suzhou Coryphaei Information&Technology Co., Ltd. All rights reserved.
//

/**
 Given inorder and postorder traversal of a tree, construct the binary tree.

 Note:
 You may assume that duplicates do not exist in the tree.

 For example, given

 inorder = [9,3,15,20,7]
 postorder = [9,15,7,20,3]
 Return the following binary tree:

     3
    / \
   9  20
     /  \
    15   7
 =====
 根据一棵树的中序遍历与后序遍历构造二叉树。

 注意:
 你可以假设树中没有重复的元素。

 例如，给出

 中序遍历 inorder = [9,3,15,20,7]
 后序遍历 postorder = [9,15,7,20,3]
 返回如下的二叉树：

     3
    / \
   9  20
     /  \
    15   7

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
    func buildTree(_ inorder: [Int], _ postorder: [Int]) -> TreeNode? {
        guard !inorder.isEmpty else {
            return nil
        }
        let root = TreeNode(postorder.last!)
        let index = inorder.firstIndex(of: root.val)!
        root.left = buildTree(index.distance(to: 0) < 0 ? Array(inorder[0..<index]) : [], index.distance(to: 0) < 0 ? Array(postorder[0..<index]) : [])
        root.right = buildTree(index.distance(to: inorder.count-1) > 0 ? Array(inorder[index+1..<inorder.count]) : [], index.distance(to: 0) <= 0 ? Array(postorder[index..<postorder.count-1]) : [])
        return root
    }
}
