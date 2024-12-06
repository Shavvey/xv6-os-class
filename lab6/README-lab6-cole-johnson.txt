# Question 1: 10 points) Using the doubly-indirect system, what is the maximum
number of blocks one inode can address? This correlates to how many bytes on disk?

Adding a new doubly-indirect block (taking the place of one data block), 
we would have another block that holds references
to 128 singly-indirect block, which will each hold references to 128 data blocks.
So, we can address a total of this many blocks:
11 (our 11 direct blocks) + 128 (our singly-indirect block) + 128*128 (our new doubly-indirect block)
= 16524 blocks.
The total is 16523 blocks that can be addressed using this system. 
Since there is 512 bytes per block, this amounts to 8459776 bytes in total per file.

# Question 2: (10 points) If a triple indirect system is implemented, what is the
maximum number of blocks one inode can address? This correlates to how many
bytes on disk?

Following the same method as question 1, we would have: 11 + 128 + 128*128 + 128*128*128 = 2113675 blocks.
Since we have 512 bytes per block, this amounts to 1082201600 bytes.
