//
//  PopulatingNextRightPointersInEachNodeII.swift
//  LeetCode.swift
//
//  Created by 叶帆 on 2020/5/6.
//  Copyright © 2020 Suzhou Coryphaei Information&Technology Co., Ltd. All rights reserved.
//

/**
 Given a binary tree

 struct Node {
   int val;
   Node *left;
   Node *right;
   Node *next;
 }
 Populate each next pointer to point to its next right node. If there is no next right node, the next pointer should be set to NULL.

 Initially, all next pointers are set to NULL.

  

 Follow up:

 You may only use constant extra space.
 Recursive approach is fine, you may assume implicit stack space does not count as extra space for this problem.
  

 Example 1:



 Input: root = [1,2,3,4,5,null,7]
 Output: [1,#,2,3,#,4,5,7,#]
 Explanation: Given the above binary tree (Figure A), your function should populate each next pointer to point to its next right node, just like in Figure B. The serialized output is in level order as connected by the next pointers, with '#' signifying the end of each level.
  

 Constraints:

 The number of nodes in the given tree is less than 6000.
 -100 <= node.val <= 100
 =====
 给定一个二叉树

 struct Node {
   int val;
   Node *left;
   Node *right;
   Node *next;
 }
 填充它的每个 next 指针，让这个指针指向其下一个右侧节点。如果找不到下一个右侧节点，则将 next 指针设置为 NULL。

 初始状态下，所有 next 指针都被设置为 NULL。

  

 进阶：

 你只能使用常量级额外空间。
 使用递归解题也符合要求，本题中递归程序占用的栈空间不算做额外的空间复杂度。
  

 示例：



 输入：root = [1,2,3,4,5,null,7]
 输出：[1,#,2,3,#,4,5,7,#]
 解释：给定二叉树如图 A 所示，你的函数应该填充它的每个 next 指针，以指向其下一个右侧节点，如图 B 所示。
  

 提示：

 树中的节点数小于 6000
 -100 <= node.val <= 100

 */
import Foundation

public class Node {
    public var val: Int
    public var left: Node?
    public var right: Node?
    public var next: Node?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
        self.next = nil
    }
}

class Solution {
    func connect(_ root: Node?) -> Node? {
        guard let root = root else {
            return nil
        }
        if root.left != nil {
            if root.right != nil {
                root.left!.next = root.right
            } else {
                // find next
                root.left!.next = findEmptyChild(root.next)
            }
        }
        if root.right != nil {
            // find next
            root.right!.next = findEmptyChild(root.next)
        }
        _ = connect(root.right)
        _ = connect(root.left)
        return root
    }

    private func findEmptyChild(_ node: Node?) -> Node? {
        if node == nil {
            return nil
        }
        if node?.left != nil {
            return node?.left
        }
        if node?.right != nil {
            return node?.right
        }
        return findEmptyChild(node?.next)
    }
}
