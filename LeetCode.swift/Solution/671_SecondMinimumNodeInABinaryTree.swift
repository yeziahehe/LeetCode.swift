//
//  671_SecondMinimumNodeInABinaryTree.swift
//  LeetCode.swift
//
//  Created by 叶帆 on 2021/7/27.
//  Copyright © 2021 Suzhou Coryphaei Information&Technology Co., Ltd. All rights reserved.
//

/**
 给定一个非空特殊的二叉树，每个节点都是正数，并且每个节点的子节点数量只能为 2 或 0。如果一个节点有两个子节点的话，那么该节点的值等于两个子节点中较小的一个。

 更正式地说，root.val = min(root.left.val, root.right.val) 总成立。

 给出这样的一个二叉树，你需要输出所有节点中的第二小的值。如果第二小的值不存在的话，输出 -1 。

  

 示例 1：


 输入：root = [2,2,5,null,null,5,7]
 输出：5
 解释：最小的值是 2 ，第二小的值是 5 。
 示例 2：


 输入：root = [2,2,2]
 输出：-1
 解释：最小的值是 2, 但是不存在第二小的值。
  

 提示：

 树中节点数目在范围 [1, 25] 内
 1 <= Node.val <= 231 - 1
 对于树中每个节点 root.val == min(root.left.val, root.right.val)

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/second-minimum-node-in-a-binary-tree
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
    var ans = -1

    func findSecondMinimumValue(_ root: TreeNode?) -> Int {
        dfs(root, root?.val)
        return ans
    }

    func dfs(_ root: TreeNode?, _ minVal: Int?) {
        if root == nil {
            return
        }
        // minVal 传入的是根节点，根节点是最小的
        // 当前节点要么等于根节点 & 要么大于根节点
        if root!.val != minVal {
            // 大于根节点
            if ans == -1 || root!.val < ans {
                // 未赋值，找到比初始根节点大的
                ans = root!.val
            }
            // 剪枝
            return
        }
        dfs(root?.left, minVal)
        dfs(root?.right, minVal)
    }
}
