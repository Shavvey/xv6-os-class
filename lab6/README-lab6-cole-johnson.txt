# Question 1: 10 points) Using the doubly-indirect system, what is the maximum
number of blocks one inode can address? This correlates to how many bytes on disk?

Adding a new doubly-indirect block, we would have another block that holds references
to 128 singly-indirect block, which will each hold references to 128 data blocks.
So, we have addresses a total of this many blocks:
12 (our 12 direct block) + 128 (our single-indirect block) + 128*128 (our new doubly-indirect block)
= 16524
The total is 16524 blocks that can be addressed. Since we there is 512 bytes per block, this amounts
to 8460288 bytes in total per file.

# Question 2: (10 points) If a triple indirect system is implemented, what is the
maximum number of blocks one inode can address? This correlates to how many
bytes on disk?

Following the same method as question 1, we would have: 12 + 128 + 128*128 + 128*128*128 = 2113676 blocks.
Since we have 512 bytes per block, this amounts to 1082202112 bytes.
