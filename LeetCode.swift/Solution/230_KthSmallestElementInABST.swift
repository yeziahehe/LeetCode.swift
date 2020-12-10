//
//  230_KthSmallestElementInABST.swift
//  LeetCode.swift
//
//  Created by 叶帆 on 2020/12/10.
//  Copyright © 2020 Suzhou Coryphaei Information&Technology Co., Ltd. All rights reserved.
//

/**
 给定一个二叉搜索树，编写一个函数 kthSmallest 来查找其中第 k 个最小的元素。

 说明：
 你可以假设 k 总是有效的，1 ≤ k ≤ 二叉搜索树元素个数。

 示例 1:

 输入: root = [3,1,4,null,2], k = 1
    3
   / \
  1   4
   \
    2
 输出: 1
 示例 2:

 输入: root = [5,3,6,2,4,null,null,1], k = 3
        5
       / \
      3   6
     / \
    2   4
   /
  1
 输出: 3
 进阶：
 如果二叉搜索树经常被修改（插入/删除操作）并且你需要频繁地查找第 k 小的值，你将如何优化 kthSmallest 函数？

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/kth-smallest-element-in-a-bst
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
    // 记录结果
    var res = 0
    // 记录当前元素的排名
    var rank = 0

    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        // 利用 BST 的中序遍历特性
        traverse(root, k)
        return res
    }

    func traverse(_ root: TreeNode?, _ k: Int) {
        if root == nil {
            return
        }
        traverse(root?.left, k)
        /* 中序遍历代码位置 */
        rank += 1
        if rank == k {
            res = root!.val
        }
        traverse(root?.right, k)
    }
}
