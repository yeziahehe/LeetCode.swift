//
//  ConvertSortedArrayToBinarySearchTree.swift
//  LeetCode.swift
//
//  Created by 叶帆 on 2017/11/2.
//  Copyright © 2017年 Suzhou Coryphaei Information&Technology Co., Ltd. All rights reserved.
//

/**
 Given an array where elements are sorted in ascending order, convert it to a height balanced BST.
 */

/**
 平衡二叉搜索树(balanced BST)的时间复杂度为 O(logn)，很容易想到利用递归二分法的思想进行构造。
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
    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        if nums.isEmpty {
            return nil
        }
        
        return sortSubArrayToBST(nums, 0, nums.count - 1)
    }
    
    private func sortSubArrayToBST(_ nums: [Int], _ strat: Int, _ end: Int) -> TreeNode? {
        guard strat <= end else {
            return nil
        }
        
        let mid = (strat + end) / 2
        let node = TreeNode(nums[mid])
        node.left = sortSubArrayToBST(nums, strat, mid - 1)
        node.right = sortSubArrayToBST(nums, mid + 1, end)
        
        return node
    }
}
