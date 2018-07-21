#import <Foundation/Foundation.h>

@interface Node : NSObject {
    int value;
    int balanceFactor;
    Node* left;
    Node* right;
}

-(id)init;
-(id)init:(double)Value;
-(double)value;
-(void)setValue:(double)Value;
-(Node*)right;
-(void)setRight:(Node*)pointer;
-(Node**)rightAddress;
-(Node*)left;
-(void)setLeft:(Node*)pointer;
-(Node**)leftAddress;
-(int)balanceFactor;
-(void)updateBalanceFactor:(int)bf;

@end
