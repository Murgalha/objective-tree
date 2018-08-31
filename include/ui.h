#ifndef _UI_H_
#define _UI_H_

#import <Foundation/Foundation.h>
#import "tree.h"

/* Define the UI class containing an 
AVLTree to be managed */
@interface UI : NSObject {
    AVLTree* tree;
}

/* Constructor that creates a tree */
-(id)init;

/* Initialize main menu */
-(void)mainMenu;

@end

#endif
