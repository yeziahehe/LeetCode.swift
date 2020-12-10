//
//  538_ConvertBSTToGreaterTree.swift
//  LeetCode.swift
//
//  Created by 叶帆 on 2020/12/10.
//  Copyright © 2020 Suzhou Coryphaei Information&Technology Co., Ltd. All rights reserved.
//

/**
 给出二叉 搜索 树的根节点，该树的节点值各不相同，请你将其转换为累加树（Greater Sum Tree），使每个节点 node 的新值等于原树中大于或等于 node.val 的值之和。

 提醒一下，二叉搜索树满足下列约束条件：

 节点的左子树仅包含键 小于 节点键的节点。
 节点的右子树仅包含键 大于 节点键的节点。
 左右子树也必须是二叉搜索树。
 注意：本题和 1038: https://leetcode-cn.com/problems/binary-search-tree-to-greater-sum-tree/ 相同

  

 示例 1：



 输入：[4,1,6,0,2,5,7,null,null,null,3,null,null,null,8]
 输出：[30,36,21,36,35,26,15,null,null,null,33,null,null,null,8]

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/convert-bst-to-greater-tree
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
import Foundation

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() {
        self.val = 0
        self.left = nil
        self.right = nil
    }
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

class Solution {
    // 记录累加和
    var sum = 0

    func convertBST(_ root: TreeNode?) -> TreeNode? {
        traverse(root)
        return root
    }

    func traverse(_ root: TreeNode?) {
        if root == nil {
            return
        }
        traverse(root?.right)
        // 维护累加和
        sum += root!.val
        // 将 BST 转化成累加树
        root!.val = sum
        traverse(root?.left)
    }
}
