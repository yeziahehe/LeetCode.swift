//
//  124_BinaryTreeMaximumPathSum.swift
//  LeetCode.swift
//
//  Created by 叶帆 on 2020/8/25.
//  Copyright © 2020 Suzhou Coryphaei Information&Technology Co., Ltd. All rights reserved.
//

/**
 
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
    var ans = Int.min

    func maxPathSum(_ root: TreeNode?) -> Int {
        _ = oneSideMax(root)
        return ans
    }

    func oneSideMax(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        let left = max(0, oneSideMax(root?.left))
        let right = max(0, oneSideMax(root?.right))
        ans = max(ans, left + right + root!.val)
        return max(left, right) + root!.val
    }
}
