//
//  239_SlidingWindowMaximum.swift
//  LeetCode.swift
//
//  Created by 叶帆 on 2020/8/20.
//  Copyright © 2020 Suzhou Coryphaei Information&Technology Co., Ltd. All rights reserved.
//

/**
 给定一个数组 nums，有一个大小为 k 的滑动窗口从数组的最左侧移动到数组的最右侧。你只可以看到在滑动窗口内的 k 个数字。滑动窗口每次只向右移动一位。

 返回滑动窗口中的最大值。

  

 进阶：

 你能在线性时间复杂度内解决此题吗？

  

 示例:

 输入: nums = [1,3,-1,-3,5,3,6,7], 和 k = 3
 输出: [3,3,5,5,6,7]
 解释:

   滑动窗口的位置                最大值
 ---------------               -----
 [1  3  -1] -3  5  3  6  7       3
  1 [3  -1  -3] 5  3  6  7       3
  1  3 [-1  -3  5] 3  6  7       5
  1  3  -1 [-3  5  3] 6  7       5
  1  3  -1  -3 [5  3  6] 7       6
  1  3  -1  -3  5 [3  6  7]      7
  

 提示：

 1 <= nums.length <= 10^5
 -10^4 <= nums[i] <= 10^4
 1 <= k <= nums.length


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/sliding-window-maximum
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
import Foundation

class MonotonicQueue {
    var queue: [Int] = []
    /// 在队尾添加元素 n
    func push(_ n: Int) {
        while !queue.isEmpty && queue.last! < n {
            queue.removeLast()
        }
        queue.append(n)
    }

    /// 返回当前队列中的最大值
    func max() -> Int {
        return queue.first ?? 0
    }

    /// 队头元素如果是 n，删除它
    func pop(_ n: Int) {
        if !queue.isEmpty && queue.first! == n {
            queue.removeFirst()
        }
    }
}

class Solution {
    func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
        let window = MonotonicQueue()
        var res: [Int] = []
        for i in 0..<nums.count {
            if i < k - 1 {
                // 先把窗口的前 k - 1 填满
                window.push(nums[i])
            } else {
                // 窗口开始向前滑动
                window.push(nums[i])
                res.append(window.max())
                window.pop(nums[i - k + 1])
                // nums[i - k + 1] 就是窗口最后的元素
            }
        }
        return res
    }
}
