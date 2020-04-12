//
//  SymmetricTree.swift
//  LeetCode.swift
//
//  Created by 叶帆 on 2020/4/12.
//  Copyright © 2020 Suzhou Coryphaei Information&Technology Co., Ltd. All rights reserved.
//

/**
 Given a binary tree, check whether it is a mirror of itself (ie, symmetric around its center).

 For example, this binary tree [1,2,2,3,4,4,3] is symmetric:

     1
    / \
   2   2
  / \ / \
 3  4 4  3
  

 But the following [1,2,2,null,3,null,3] is not:

     1
    / \
   2   2
    \   \
    3    3
  

 Follow up: Solve it both recursively and iteratively.
 =====
 给定一个二叉树，检查它是否是镜像对称的。

  

 例如，二叉树 [1,2,2,3,4,4,3] 是对称的。

     1
    / \
   2   2
  / \ / \
 3  4 4  3
  

 但是下面这个 [1,2,2,null,3,null,3] 则不是镜像对称的:

     1
    / \
   2   2
    \   \
    3    3
  

 进阶：

 你可以运用递归和迭代两种方法解决这个问题吗？

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
    func isSymmetric(_ root: TreeNode?) -> Bool {
        return isMirror(root, root)
    }
    
    func isMirror(_ left: TreeNode?, _ right: TreeNode?) -> Bool {
        if left == nil && right == nil {
            return true
        }
        if left == nil || right == nil {
            return false
        }
        if left?.val != right?.val {
            return false
        }
        return isMirror(left?.right, right?.left) && isMirror(left?.left, right?.right)
    }
}

class Solution2 {
    func isSymmetric(_ root: TreeNode?) -> Bool {
        var queue: [TreeNode?] = []
        queue.append(root)
        queue.append(root)
        while !queue.isEmpty {
            let q = queue.removeFirst()
            let p = queue.removeFirst()
            if q == nil && p == nil {
                continue
            }
            if q == nil || p == nil {
                return false
            }
            if q!.val != p!.val {
                return false
            }
            queue.append(q!.left)
            queue.append(p!.right)
            queue.append(q!.right)
            queue.append(p!.left)
        }
        return true
    }
}
