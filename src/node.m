#import "node.h"

@implementation Node

/* Empty constructor */
-(id)init {
    self = [super init];
    self->value = -1;
    self->left = NULL;
    self->right = NULL;
    self->balanceFactor = 0;
    return self;
}

/* Constructor with value */
-(id)init:(double)Value {
    self = [super init];
    self->value = Value;
    self->left = NULL;
    self->right = NULL;
    self->balanceFactor = 0;
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

/* Return address o right node pointer */
-(Node**)rightAddress {
    return &(self->right);
}

-(Node*)left {
    return self->left;
}

-(void)setLeft:(Node*)pointer {
    self->left = pointer;
}

/* Return address o left node pointer */
-(Node**)leftAddress {
    return &(self->left);
}

-(int)balanceFactor {
    return self->balanceFactor;
}

-(void)updateBalanceFactor:(int)bf {
    self->balanceFactor = bf;
}

@end
