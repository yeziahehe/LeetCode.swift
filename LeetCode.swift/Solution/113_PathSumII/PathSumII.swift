//
//  PathSumII.swift
//  LeetCode.swift
//
//  Created by 叶帆 on 2020/7/1.
//  Copyright © 2020 Suzhou Coryphaei Information&Technology Co., Ltd. All rights reserved.
//

/**
 Given a binary tree and a sum, find all root-to-leaf paths where each path's sum equals the given sum.

 Note: A leaf is a node with no children.

 Example:

 Given the below binary tree and sum = 22,

       5
      / \
     4   8
    /   / \
   11  13  4
  /  \    / \
 7    2  5   1
 Return:

 [
    [5,4,11,2],
    [5,8,4,5]
 ]

 ======
 给定一个二叉树和一个目标和，找到所有从根节点到叶子节点路径总和等于给定目标和的路径。

 说明: 叶子节点是指没有子节点的节点。

 示例:
 给定如下二叉树，以及目标和 sum = 22，

               5
              / \
             4   8
            /   / \
           11  13  4
          /  \    / \
         7    2  5   1
 返回:

 [
    [5,4,11,2],
    [5,8,4,5]
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
    var res: [[Int]] = []
    var path: [Int] = []
    func pathSum(_ root: TreeNode?, _ sum: Int) -> [[Int]] {
        recur(root, sum)
        return res
    }

    func recur(_ root: TreeNode?, _ sum: Int) {
        guard let root = root else {
            return
        }
        path.append(root.val)
        let tar = sum - root.val
        if tar == 0 && root.left == nil && root.right == nil {
            res.append(path)
        }
        recur(root.left, sum - root.val)
        recur(root.right, sum - root.val)
        path.removeLast()
    }
}
