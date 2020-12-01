# balanced_bst

A Balanced Binary Search Tree program made in Ruby for [The Odin Project](https://www.theodinproject.com/courses/ruby-programming/lessons/binary-search-trees). It consists of two classes, one for the nodes in the tree and one for the tree itself, and one driver script that demonstrates some of the different methods in the tree class.

## Methods for class Tree

- **#build_tree:** Builds the tree using a passed array
- **#pretty_print:** Prints tree visually, with the root node on the left and the leaf nodes on the right
- **#insert(value):** Inserts a node with the passed value to the appropriate place in the tree
- **#min_child(node):** Finds the lowest (value-wise, not level-wise) ancestor of a given node
- **#delete(value):** Deletes the node with the passed value, if found
- **#find(value):** Returns the node with the passed value, if found 
- **#level_order:** Returns an array of the nodes in [level order](https://www.geeksforgeeks.org/level-order-tree-traversal/)
- **#in_order, pre_order, post_order:** Return arrays of the nodes in ["in order", "pre order", and "post order"](https://www.geeksforgeeks.org/tree-traversals-inorder-preorder-and-postorder/), respectively.
- **#height:** Returns the height of the tree, or the height of a passed node
- **#depth(node):** Returns the depth of a passed node (or how many levels it is from the root node)
- **#balanced?:** Returns true if the tree is balanced, false otherwise
- **#rebalance:** Using #level_order and #build_tree, this recreates the tree so that it is balanced

