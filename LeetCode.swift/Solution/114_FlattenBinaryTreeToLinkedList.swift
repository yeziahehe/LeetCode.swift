//
//  114_FlattenBinaryTreeToLinkedList.swift
//  LeetCode.swift
//
//  Created by 叶帆 on 2020/10/9.
//  Copyright © 2020 Suzhou Coryphaei Information&Technology Co., Ltd. All rights reserved.
//

/**
 给定一个二叉树，原地将它展开为一个单链表。

  

 例如，给定二叉树

     1
    / \
   2   5
  / \   \
 3   4   6
 将其展开为：

 1
  \
   2
    \
     3
      \
       4
        \
         5
          \
           6

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/flatten-binary-tree-to-linked-list
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
import Foundation

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public var next: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
        self.next = nil
    }
}

class Solution {
    func flatten(_ root: TreeNode?) {
        if root == nil {
            return
        }
        flatten(root?.left)
        flatten(root?.right)
        /**** 后序遍历位置 ****/
        // 1、左右子树已经被拉平成一条链表
        let left = root?.left
        let right = root?.right
        // 2、将左子树作为右子树
        root?.left = nil
        root?.right = left
        // 3、将原先的右子树接到当前右子树的末端
        var p = root
        while p?.right != nil {
            p = p?.right
        }
        p?.right = right
    }
}
