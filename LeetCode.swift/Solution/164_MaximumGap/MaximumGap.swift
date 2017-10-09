//
//  MaximumGap.swift
//  LeetCode.swift
//
//  Created by 叶帆 on 2017/10/9.
//

/*
 Given an unsorted array, find the maximum difference between the successive elements in its sorted form.
 
 Try to solve it in linear time/space.
 
 Return 0 if the array contains less than 2 elements.
 
 You may assume all elements in the array are non-negative integers and fit in the 32-bit signed integer range.
 */

import Foundation

class Solution {
    
    struct Bucket {
        public var empty: Bool = true
        public var maxValue: Int = Int.min
        public var minValue: Int = Int.max
    }
    
    func maximumGap(_ nums: [Int]) -> Int {
        
        if nums.isEmpty || nums.count < 2 {
            return 0
        }
        
        let maxValue = nums.max()!, minValue = nums.min()!
        
        let bucketCount = max(1, (maxValue - minValue) / (nums.count - 1))//处理最大值和最小相等、差值比个数小太多的情况
        let bucketNum = (maxValue - minValue) / bucketCount + 1//极限值[1, 10000000]
        var buckets = Array(repeatElement(Bucket(), count: bucketNum))
        
        for num in nums {
            let index = (num - minValue) / bucketCount
            buckets[index].empty = false
            buckets[index].maxValue = max(num, buckets[index].maxValue)
            buckets[index].minValue = min(num, buckets[index].minValue)
        }
        
        var preBucketMax = minValue, maxGap: Int = 0
        
        for bucket in buckets {
            if bucket.empty {
                continue
            }
            
            maxGap = max(bucket.minValue - preBucketMax, maxGap)
            preBucketMax = bucket.maxValue
        }
        
        return maxGap
    }
}
