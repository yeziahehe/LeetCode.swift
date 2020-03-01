//
//  SumOfLeftLeaves.swift
//  LeetCode.swift
//
//  Created by 叶帆 on 2020/3/1.
//  Copyright © 2020 Suzhou Coryphaei Information&Technology Co., Ltd. All rights reserved.
//

/**
 Find the sum of all left leaves in a given binary tree.

 Example:

     3
    / \
   9  20
     /  \
    15   7

 There are two left leaves in the binary tree, with values 9 and 15 respectively. Return 24.

 ==========
 
 计算给定二叉树的所有左叶子之和。

 示例：

     3
    / \
   9  20
     /  \
    15   7

 在这个二叉树中，有两个左叶子，分别是 9 和 15，所以返回 24

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
    func sumOfLeftLeaves(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }

        var sum = 0
        if let left = root.left, left.left == nil, left.right == nil {
            sum += left.val
        }

        return sum + sumOfLeftLeaves(root.left) + sumOfLeftLeaves(root.right)
    }
}
