//
//  FindKPairsWithSmallestSums.swift
//  LeetCode.swift
//
//  Created by 叶帆 on 2017/11/5.
//  Copyright © 2017年 Suzhou Coryphaei Information&Technology Co., Ltd. All rights reserved.
//

/**
 You are given two integer arrays nums1 and nums2 sorted in ascending order and an integer k.
 
 Define a pair (u,v) which consists of one element from the first array and one element from the second array.
 
 Find the k pairs (u1,v1),(u2,v2) ...(uk,vk) with the smallest sums.
 
 Example 1:
 Given nums1 = [1,7,11], nums2 = [2,4,6],  k = 3
 
 Return: [1,2],[1,4],[1,6]
 
 The first 3 pairs are returned from the sequence:
 [1,2],[1,4],[1,6],[7,2],[7,4],[11,2],[7,6],[11,4],[11,6]
 
 Example 2:
 Given nums1 = [1,1,2], nums2 = [1,2,3],  k = 2
 
 Return: [1,1],[1,1]
 
 The first 2 pairs are returned from the sequence:
 [1,1],[1,1],[1,2],[2,1],[1,2],[2,2],[1,3],[1,3],[2,3]
 
 Example 3:
 Given nums1 = [1,2], nums2 = [3],  k = 3
 
 Return: [1,3],[2,3]
 
 All possible pairs are returned from the sequence:
 [1,3],[2,3]
 */

import Foundation

class Solution {
    func kSmallestPairs(_ nums1: [Int], _ nums2: [Int], _ k: Int) -> [[Int]] {
        if k <= 0 || nums1.isEmpty || nums2.isEmpty {
            return []
        }
        
        let cnt = min(k, nums1.count * nums2.count)
        var index = Array(repeatElement(0, count: nums1.count))
        var pairs: [[Int]] = []
        var n = 0
        
        while n < cnt {
            var min = Int.max
            var m = 0
            for i in 0..<nums1.count {
                if index[i] < nums2.count && nums1[i]+nums2[index[i]] < min {
                    min = nums1[i]+nums2[index[i]]
                    m = i
                }
            }
            pairs.append([nums1[m], nums2[index[m]]])
            index[m] += 1
            n += 1
        }
        
        return pairs
    }
}
