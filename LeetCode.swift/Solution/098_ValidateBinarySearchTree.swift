//
//  098_ValidateBinarySearchTree.swift
//  LeetCode.swift
//
//  Created by 叶帆 on 2020/8/25.
//  Copyright © 2020 Suzhou Coryphaei Information&Technology Co., Ltd. All rights reserved.
//

/**
 给定一个二叉树，判断其是否是一个有效的二叉搜索树。

 假设一个二叉搜索树具有如下特征：

 节点的左子树只包含小于当前节点的数。
 节点的右子树只包含大于当前节点的数。
 所有左子树和右子树自身必须也是二叉搜索树。
 示例 1:

 输入:
     2
    / \
   1   3
 输出: true
 示例 2:

 输入:
     5
    / \
   1   4
      / \
     3   6
 输出: false
 解释: 输入为: [5,1,4,null,null,3,6]。
      根节点的值为 5 ，但是其右子节点值为 4 。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/validate-binary-search-tree
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
    func isValidBST(_ root: TreeNode?) -> Bool {
        return isValidBST(root, nil, nil)
    }

    /* 限定以 root 为根的子树节点必须满足 max.val > root.val > min.val */
    func isValidBST(_ root: TreeNode?, _ min: TreeNode?, _ max: TreeNode?) -> Bool {
        // base case
        if root == nil {
            return true
        }
        // 若 root.val 不符合 max 和 min 的限制，说明不是合法 BST
        if min != nil && root!.val <= min!.val {
            return false
        }
        if max != nil && root!.val >= max!.val {
            return false
        }
        // 限定左子树的最大值是 root.val，右子树的最小值是 root.val
        return isValidBST(root?.left, min, root) && isValidBST(root?.right, root, max)
    }
}
