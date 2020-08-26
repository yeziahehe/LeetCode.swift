//
//  222_CountCompleteTreeNodes.swift
//  LeetCode.swift
//
//  Created by 叶帆 on 2020/8/26.
//  Copyright © 2020 Suzhou Coryphaei Information&Technology Co., Ltd. All rights reserved.
//

/**
 给出一个完全二叉树，求出该树的节点个数。

 说明：

 完全二叉树的定义如下：在完全二叉树中，除了最底层节点可能没填满外，其余每层节点数都达到最大值，并且最下面一层的节点都集中在该层最左边的若干位置。若最底层为第 h 层，则该层包含 1~ 2h 个节点。

 示例:

 输入:
     1
    / \
   2   3
  / \  /
 4  5 6

 输出: 6

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/count-complete-tree-nodes
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
    func countNodes(_ root: TreeNode?) -> Int {
        var l = root
        var r = root
        // 记录左、右子树的高度
        var hl = 0
        var hr = 0
        while l != nil {
            l = l?.left
            hl += 1
        }
        while r != nil {
            r = r?.right
            hr += 1
        }
        // 如果左右子树的高度相同，则是一棵满二叉树
        if hl == hr {
            return Int(pow(2, Float(hl))) - 1
        }
        // 如果左右高度不同，则按照普通二叉树的逻辑计算
        return 1 + countNodes(root?.left) + countNodes(root?.right)
    }
}
