/*389. Find the Difference  QuestionEditorial Solution  My Submissions
Total Accepted: 10319
Total Submissions: 20792
Difficulty: Easy
Given two strings s and t which consist of only lowercase letters.

String t is generated by random shuffling string s and then add one more letter at a random position.

Find the letter that was added in t.

Example:

Input:
s = "abcd"
t = "abcde"

Output:
e

Explanation:
'e' is the letter that was added.
Hide Company Tags Google
Hide Tags Hash Table Bit Manipulation
Hide Similar Problems (E) Single Number
*/



/*Bit Manipulation
Use XOR(^) operator
x ^ x = 0
x ^ 0 = x
if the character in t also exist in s, it will be clear
otherwise, it will exist
init char c as t[t.length-1], and search until t.length-1
since there are only one character added in t, so we return the final character is ok*/

/////////////////////////////////////////////////////////////////////////////////////
//C++
class Solution {
public:
    char findTheDifference(string s, string t) {
        char c = t[t.size()-1];
        for(int i = 0; i < t.size()-1; ++i){
            c ^= s[i];
            c ^= t[i];
        }
        return c;
    }
};




/////////////////////////////////////////////////////////////////////////////////////
//Java
public class Solution {
    public char findTheDifference(String s, String t) {
        char c = t.charAt(t.length()-1);
        for(int i = 0; i < t.length()-1; ++i){
            c ^= s.charAt(i);
            c ^= t.charAt(i);
        }
        return c;
    }
}