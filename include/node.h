#ifndef _NODE_H_
#define _NODE_H_

#import <Foundation/Foundation.h>

/* Defining Node class containing
its value, balance factor and a pointer 
to the left and one to the right son */
@interface Node : NSObject {
    double value;
    int balanceFactor;
    Node* left;
    Node* right;
}

/* Empty constructor initializing value with -1,
balance factor with 0 and pointers with NULL */
-(id)init;

/* Empty constructor initializing value with 'Value',
balance factor with 0 and pointers with NULL */
-(id)init:(double)Value;

/* Getter for 'value' variable */
-(double)value;

/* Sets 'Value' on variable 'value' */
-(void)setValue:(double)Value;

/* Getter for right node pointer */
-(Node*)right;

/* Setter for right node pointer */
-(void)setRight:(Node*)pointer;

/* Getter for the address that stores
the right node variable */
-(Node**)rightAddress;

/* Getter for left node pointer */
-(Node*)left;

/* Setter for left node pointer */
-(void)setLeft:(Node*)pointer;

/* Getter for the address that stores
the left node variable */
-(Node**)leftAddress;

/* Getter for 'balanceFactor' variable */
-(int)balanceFactor;

/* Setter for 'balanceFactor' variable */
-(void)updateBalanceFactor:(int)bf;

@end

#endif
