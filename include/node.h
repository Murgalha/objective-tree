#import <Foundation/Foundation.h>

@interface Node : NSObject {
    int value;
    Node* left;
    Node* right;
}

-(id)init;
-(id)init:(double)Value;
-(double)value;
-(void)setValue:(double)Value;
-(Node*)right;
-(void)setRight:(Node*)pointer;
-(Node*)left;
-(void)setLeft:(Node*)pointer;

@end
