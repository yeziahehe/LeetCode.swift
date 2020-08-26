//
//  450_DeleteNodeInABST.swift
//  LeetCode.swift
//
//  Created by 叶帆 on 2020/8/25.
//  Copyright © 2020 Suzhou Coryphaei Information&Technology Co., Ltd. All rights reserved.
//

/**
 给定一个二叉搜索树的根节点 root 和一个值 key，删除二叉搜索树中的 key 对应的节点，并保证二叉搜索树的性质不变。返回二叉搜索树（有可能被更新）的根节点的引用。

 一般来说，删除节点可分为两个步骤：

 首先找到需要删除的节点；
 如果找到了，删除它。
 说明： 要求算法时间复杂度为 O(h)，h 为树的高度。

 示例:

 root = [5,3,6,2,4,null,7]
 key = 3

     5
    / \
   3   6
  / \   \
 2   4   7

 给定需要删除的节点值是 3，所以我们首先找到 3 这个节点，然后删除它。

 一个正确的答案是 [5,4,6,2,null,null,7], 如下图所示。

     5
    / \
   4   6
  /     \
 2       7

 另一个正确答案是 [5,2,6,null,4,null,7]。

     5
    / \
   2   6
    \   \
     4   7

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/delete-node-in-a-bst
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
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
    func deleteNode(_ root: TreeNode?, _ key: Int) -> TreeNode? {
        if root == nil {
            return nil
        }
        if root!.val == key {
            // 这两个 if 把情况 1 和 2 都正确处理了
            if root?.left == nil {
                return root?.right
            }
            if root?.right == nil {
                return root?.left
            }
            // 找到右子树的最小节点
            let minNode = getMin(root?.right)
            // 把 root 改成 minNode
            root?.val = minNode!.val
            // 转而去删除 minNode
            root?.right = deleteNode(root?.right, minNode!.val)
            
        } else if root!.val > key {
            root?.left = deleteNode(root?.left, key)
        } else if root!.val < key {
            root?.right = deleteNode(root?.right, key)
        }
        return root
    }

    func getMin(_ node: TreeNode?) -> TreeNode? {
        var node = node
        // BST 最左边的就是最小的
        while node?.left != nil {
            node = node?.left
        }
        return node
    }
}
