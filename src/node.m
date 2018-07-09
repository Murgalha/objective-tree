#import <Foundation/Foundation.h>
#import "node.h"

@implementation Node

-(id)init {
    self = [super init];
    self->value = -1;
    self->left = NULL;
    self->right = NULL;
    return self;
}

-(id)init:(double)Value {
    self = [super init];
    self->value = Value;
    self->left = NULL;
    self->right = NULL;
    return self;
}

-(double)value {
    return self->value;
}

-(void)setValue:(double)Value {
    self->value = Value;
}

-(Node*)right {
    return self->right;
}

-(void)setRight:(Node*)pointer {
    self->right = pointer;
}

-(Node*)left {
    return self->left;
}

-(void)setLeft:(Node*)pointer {
    self->left = pointer;
}

@end
