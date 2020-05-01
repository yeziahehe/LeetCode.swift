//
//  ConstructBinaryTreeFromPreorderAndInorderTraversal.swift
//  LeetCode.swift
//
//  Created by 叶帆 on 2020/5/1.
//  Copyright © 2020 Suzhou Coryphaei Information&Technology Co., Ltd. All rights reserved.
//

/**
 Given preorder and inorder traversal of a tree, construct the binary tree.

 Note:
 You may assume that duplicates do not exist in the tree.

 For example, given

 preorder = [3,9,20,15,7]
 inorder = [9,3,15,20,7]
 Return the following binary tree:

     3
    / \
   9  20
     /  \
    15   7
 =====
 根据一棵树的前序遍历与中序遍历构造二叉树。

 注意:
 你可以假设树中没有重复的元素。

 例如，给出

 前序遍历 preorder = [3,9,20,15,7]
 中序遍历 inorder = [9,3,15,20,7]
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
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        guard !preorder.isEmpty else {
            return nil
        }
        let root = TreeNode(preorder.first!)
        let index = inorder.firstIndex(of: root.val)!
        root.left = buildTree(index.distance(to: 0) < 0 ? Array(preorder[1...index]) : [], index.distance(to: 0) < 0 ? Array(inorder[0..<index]) : [])
        root.right = buildTree(index.distance(to: preorder.count) > 0 ? Array(preorder[index+1..<preorder.count]) : [], index.distance(to: inorder.count) > 0 ? Array(inorder[index+1..<inorder.count]) : [])
        return root
    }
}
