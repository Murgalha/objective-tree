#ifndef _TREE_H_
#define _TREE_H_

#import <Foundation/Foundation.h>
#import "node.h"

/* Define AVLTree class containing
a pointer to the tree's root and the
number of elements */
@interface AVLTree : NSObject {
    Node* root;
    int size;
}

/* Constructor initializing the pointer
as NULL and size as 0 */
-(id)init;

/* Get the height of the deepest branch */
-(int)treeHeight;

/* Search for 'value' on tree
Return NULL if not found and return 
a pointer to the node otherwise */
-(Node*)search:(double)value;

/* Insert 'value' on the tree */
-(void)insert:(double)value;

/* Print tree in pre-order */
-(void)printPreOrder;

/* Print tree in-order */
-(void)printInOrder;

/* Print tree in post-order */
-(void)printPostOrder;

/* Get the predecessor of a given value
Returns -1 if it is already de minimum value*/
-(double)predecessorOf:(double)value;

/* Get the successor of a given value
Returns -1 if it is already de maximum value*/
-(double)successorOf:(double)value;

/* Get the minimum value of the tree */
-(double)min;

/* Get the maximum value of the tree */
-(double)max;

@end

#endif
