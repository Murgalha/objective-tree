#import <Foundation/Foundation.h>
#import "tree.h"

int main(int argc, char *argv[]) {
    NSAutoreleasePool* pool = [[NSAutoreleasePool alloc] init];
    
    AVLTree* T = [[AVLTree alloc] init];

    [T insert:10];
    [T insert:9];
    [T insert:8];
    [T insert:7];
    [T insert:6];
    [T insert:5];
    [T insert:4.5];
    [T insert:4];
    [T insert:3.2];

    NSLog(@"Tree Height: %d", [T treeHeight]);
    
    [pool drain];
    return 0;
}
