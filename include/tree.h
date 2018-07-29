#import <Foundation/Foundation.h>
#import "node.h"

@interface AVLTree : NSObject {
    Node* root;
    int size;
}

-(id)init;
-(int)treeHeight;
-(double)search:(double)value pointer:(Node*)node;
-(void)insert:(double)value;

@end
