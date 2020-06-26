//
//  WordSearch.swift
//  LeetCode.swift
//
//  Created by 叶帆 on 2020/6/24.
//  Copyright © 2020 Suzhou Coryphaei Information&Technology Co., Ltd. All rights reserved.
//

/**
 Given a 2D board and a word, find if the word exists in the grid.

 The word can be constructed from letters of sequentially adjacent cell, where "adjacent" cells are those horizontally or vertically neighboring. The same letter cell may not be used more than once.

 Example:

 board =
 [
   ['A','B','C','E'],
   ['S','F','C','S'],
   ['A','D','E','E']
 ]

 Given word = "ABCCED", return true.
 Given word = "SEE", return true.
 Given word = "ABCB", return false.
  

 Constraints:

 board and word consists only of lowercase and uppercase English letters.
 1 <= board.length <= 200
 1 <= board[i].length <= 200
 1 <= word.length <= 10^3

 ======
 给定一个二维网格和一个单词，找出该单词是否存在于网格中。

 单词必须按照字母顺序，通过相邻的单元格内的字母构成，其中“相邻”单元格是那些水平相邻或垂直相邻的单元格。同一个单元格内的字母不允许被重复使用。

  

 示例:

 board =
 [
   ['A','B','C','E'],
   ['S','F','C','S'],
   ['A','D','E','E']
 ]

 给定 word = "ABCCED", 返回 true
 给定 word = "SEE", 返回 true
 给定 word = "ABCB", 返回 false
  

 提示：

 board 和 word 中只包含大写和小写英文字母。
 1 <= board.length <= 200
 1 <= board[i].length <= 200
 1 <= word.length <= 10^3

 */
import Foundation

class Solution {
    var board: [[Character]] = []
    var word: String = ""
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        self.board = board
        self.word  = word
        for i in 0..<board.count {
            for j in 0..<board[0].count {
                if dfs(i, j, 0) {
                    return true
                }
            }
        }
        return false
    }

    func dfs(_ i: Int, _ j: Int, _ k: Int) -> Bool {
        // 终止条件 返回 false
        // ① 行或列索引越界 或 ② 当前矩阵元素与目标字符不同 或 ③ 当前矩阵元素已访问过
        if i < 0 || i >= board.count || j < 0 || j >= board[0].count || board[i][j] != Array(word)[k] {
            return false
        }
        // 终止条件 返回 true
        // 字符串 word 已全部匹配，即 k = word.count - 1 。
        if k == word.count - 1 {
            return true
        }
        // 标记当前矩阵元素
        // 将 board[i][j] 值暂存于变量 tmp ，并修改为字符 '#' ，代表此元素已访问过，防止之后搜索时重复访问。
        let temp = board[i][j]
        board[i][j] = "#"
        // 搜索下一单元格
        // 朝当前元素的 上、下、左、右 四个方向开启下层递归，使用 或 连接 （代表只需一条可行路径） ，并记录结果至 res 。
        let res = dfs(i + 1, j, k + 1) || dfs(i, j + 1, k + 1) || dfs(i, j - 1, k + 1) || dfs(i - 1, j, k + 1)
        // 还原当前矩阵元素
        // 将 tmp 暂存值还原至 board[i][j] 元素。
        board[i][j] = temp
        return res
    }
}
