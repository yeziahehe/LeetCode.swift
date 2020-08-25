//
//  701_InsertIntoABinarySearchTree.swift
//  LeetCode.swift
//
//  Created by 叶帆 on 2020/8/25.
//  Copyright © 2020 Suzhou Coryphaei Information&Technology Co., Ltd. All rights reserved.
//

/**
 给定二叉搜索树（BST）的根节点和要插入树中的值，将值插入二叉搜索树。 返回插入后二叉搜索树的根节点。 保证原始二叉搜索树中不存在新值。

 注意，可能存在多种有效的插入方式，只要树在插入后仍保持为二叉搜索树即可。 你可以返回任意有效的结果。

 例如,

 给定二叉搜索树:

         4
        / \
       2   7
      / \
     1   3

 和 插入的值: 5
 你可以返回这个二叉搜索树:

          4
        /   \
       2     7
      / \   /
     1   3 5
 或者这个树也是有效的:

          5
        /   \
       2     7
      / \
     1   3
          \
           4

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/insert-into-a-binary-search-tree
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
    func insertIntoBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        // 找到空位置插入新节点
        if root == nil {
            return TreeNode(val)
        }
        if root!.val < val {
            root?.right = insertIntoBST(root?.right, val)
        }
        if root!.val > val {
            root?.left = insertIntoBST(root?.left, val)
        }
        return root
    }
}
