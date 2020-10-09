//
//  654_MaximumBinaryTree.swift
//  LeetCode.swift
//
//  Created by 叶帆 on 2020/10/9.
//  Copyright © 2020 Suzhou Coryphaei Information&Technology Co., Ltd. All rights reserved.
//

/**
 给定一个不含重复元素的整数数组。一个以此数组构建的最大二叉树定义如下：

 二叉树的根是数组中的最大元素。
 左子树是通过数组中最大值左边部分构造出的最大二叉树。
 右子树是通过数组中最大值右边部分构造出的最大二叉树。
 通过给定的数组构建最大二叉树，并且输出这个树的根节点。

  

 示例 ：

 输入：[3,2,1,6,0,5]
 输出：返回下面这棵树的根节点：

       6
     /   \
    3     5
     \    /
      2  0
        \
         1
  

 提示：

 给定的数组的大小在 [1, 1000] 之间。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/maximum-binary-tree
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
    func constructMaximumBinaryTree(_ nums: [Int]) -> TreeNode? {
        return build(nums, 0, nums.count - 1)
    }

    func build(_ nums: [Int], _ low: Int, _ high: Int) -> TreeNode? {
        if low > high {
            return nil
        }
        var index = -1
        var maxVal = Int.min
        for i in low...high {
            if nums[i] > maxVal {
                index = i
                maxVal = nums[i]
            }
        }
        let root = TreeNode(maxVal)
        root.left = build(nums, low, index - 1)
        root.right = build(nums, index + 1, high)
        return root
    }
}
