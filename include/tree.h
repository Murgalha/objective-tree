#ifndef _TREE_H_
#define _TREE_H_

#import <Foundation/Foundation.h>
#import "node.h"

@interface AVLTree : NSObject {
    Node* root;
    int size;
}

-(id)init;
-(int)treeHeight;
-(Node*)search:(double)value pointer:(Node*)node;
-(void)insert:(double)value;
-(void)printPreOrder;
-(void)printInOrder;
-(void)printPostOrder;
-(double)predecessorOf:(double)value;
-(double)successorOf:(double)value;
-(double)min;
-(double)max;

@end

#endif
