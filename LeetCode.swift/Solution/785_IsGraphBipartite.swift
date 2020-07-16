//
//  785_IsGraphBipartite.swift
//  LeetCode.swift
//
//  Created by 叶帆 on 2020/7/16.
//  Copyright © 2020 Suzhou Coryphaei Information&Technology Co., Ltd. All rights reserved.
//

/**
 Given an undirected graph, return true if and only if it is bipartite.

 Recall that a graph is bipartite if we can split it's set of nodes into two independent subsets A and B such that every edge in the graph has one node in A and another node in B.

 The graph is given in the following form: graph[i] is a list of indexes j for which the edge between nodes i and j exists.  Each node is an integer between 0 and graph.length - 1.  There are no self edges or parallel edges: graph[i] does not contain i, and it doesn't contain any element twice.

 Example 1:
 Input: [[1,3], [0,2], [1,3], [0,2]]
 Output: true
 Explanation:
 The graph looks like this:
 0----1
 |    |
 |    |
 3----2
 We can divide the vertices into two groups: {0, 2} and {1, 3}.
 Example 2:
 Input: [[1,2,3], [0,2], [0,1,3], [0,2]]
 Output: false
 Explanation:
 The graph looks like this:
 0----1
 | \  |
 |  \ |
 3----2
 We cannot find a way to divide the set of nodes into two independent subsets.
  

 Note:

 graph will have length in range [1, 100].
 graph[i] will contain integers in range [0, graph.length - 1].
 graph[i] will not contain i or duplicate values.
 The graph is undirected: if any element j is in graph[i], then i will be in graph[j].

 ======
 给定一个无向图graph，当这个图为二分图时返回true。

 如果我们能将一个图的节点集合分割成两个独立的子集A和B，并使图中的每一条边的两个节点一个来自A集合，一个来自B集合，我们就将这个图称为二分图。

 graph将会以邻接表方式给出，graph[i]表示图中与节点i相连的所有节点。每个节点都是一个在0到graph.length-1之间的整数。这图中没有自环和平行边： graph[i] 中不存在i，并且graph[i]中没有重复的值。


 示例 1:
 输入: [[1,3], [0,2], [1,3], [0,2]]
 输出: true
 解释:
 无向图如下:
 0----1
 |    |
 |    |
 3----2
 我们可以将节点分成两组: {0, 2} 和 {1, 3}。

 示例 2:
 输入: [[1,2,3], [0,2], [0,1,3], [0,2]]
 输出: false
 解释:
 无向图如下:
 0----1
 | \  |
 |  \ |
 3----2
 我们不能将节点分割成两个独立的子集。
 注意:

 graph 的长度范围为 [1, 100]。
 graph[i] 中的元素的范围为 [0, graph.length - 1]。
 graph[i] 不会包含 i 或者有重复的值。
 图是无向的: 如果j 在 graph[i]里边, 那么 i 也会在 graph[j]里边。

 */
import Foundation

class Solution {
    func isBipartite(_ graph: [[Int]]) -> Bool {
        // graph : [[1,3], [0,2], [1,3], [0,2]]
        // 可以看成 0 的相邻节点为1, 3
        // 1 的相邻节点为0, 2
        // 2 的相邻节点为1, 3
        // 的无向图
        let num = graph.count
        // 相邻节点的颜色
        // 0: 默认 1: 红色 2: 绿色
        var visited = [Int](repeating: 0, count: num)
        for i in 0..<num {
            // 当前节点已经涂过色
            if visited[i] != 0 {
             continue
            }
            var queue = [Int]()
            queue.append(i)
            while !queue.isEmpty {
                let cur = queue.removeFirst()
                let curColor = visited[cur]
                let neighborColor = curColor == 1 ? 2:1
                for(_, neighbor) in graph[cur].enumerated() {
                    if visited[neighbor] == 0 {
                        // 没涂色
                        visited[neighbor] = neighborColor
                        queue.append(neighbor)
                    } else if (visited[neighbor] != neighborColor) {
                        // 当前节点和相邻的节点涂色相同
                        return false
                    }
                }
            }
        }
        return true
    }
}
