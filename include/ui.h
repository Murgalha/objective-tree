#ifndef _UI_H_
#define _UI_H_

#import <Foundation/Foundation.h>
#import "tree.h"

@interface UI : NSObject {
    AVLTree* tree;
}

-(id)init;
-(void)mainMenu;

@end

#endif
