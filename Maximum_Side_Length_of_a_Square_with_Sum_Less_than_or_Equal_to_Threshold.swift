// Given a m x n matrix mat and an integer threshold. Return the maximum side-length of a square with a sum less than or equal to threshold or return 0 if there is no such square.

 

// Example 1:


// Input: mat = [[1,1,3,2,4,3,2],[1,1,3,2,4,3,2],[1,1,3,2,4,3,2]], threshold = 4
// Output: 2
// Explanation: The maximum side length of square with sum less than 4 is 2 as shown.
// Example 2:

// Input: mat = [[2,2,2,2,2],[2,2,2,2,2],[2,2,2,2,2],[2,2,2,2,2],[2,2,2,2,2]], threshold = 1
// Output: 0
// Example 3:

// Input: mat = [[1,1,1,1],[1,0,0,0],[1,0,0,0],[1,0,0,0]], threshold = 6
// Output: 3
// Example 4:

// Input: mat = [[18,70],[61,1],[25,85],[14,40],[11,96],[97,96],[63,45]], threshold = 40184
// Output: 2
 

// Constraints:

// 1 <= m, n <= 300
// m == mat.length
// n == mat[i].length
// 0 <= mat[i][j] <= 10000
// 0 <= threshold <= 10^5

// Solution 1: brute force
// Time complexity: O(n^3)

// Solution 2: count sum, ans use i-len to make sure square
// 
// Time complexity: O(mn)
// Space complexity: O((m+1)(n+1)
class Solution {
    func maxSideLength(_ mat: [[Int]], _ threshold: Int) -> Int {
        let n = mat.count
        let m = mat[0].count
        
        var len = 0 
        var sum = Array(repeating: Array(repeating: 0, count: m+1), count: n+1)
        for i in 0..<n {
            for j in 0..<m {
                sum[i+1][j+1] = sum[i][j+1] + sum[i+1][j] - sum[i][j] + mat[i][j]
                
                if i >= len, j >= len, 
                sum[i+1][j+1] - sum[i-len][j+1] - sum[i+1][j-len] + sum[i-len][j-len] <= threshold {
                    len += 1
                }
            }
        }
        return len
    }
}