#import "tree.h"

@implementation AVLTree

-(id)init {
    self = [super init];
    self->root = NULL;
    self->size = 0;
    return self;
}

-(int)nodeHeight:(Node*)node {
    return node ? 1+MAX([self nodeHeight:[node left]],[self nodeHeight:[node right]]) : -1;
}

-(int)treeHeight {
    return [self nodeHeight:self->root];
}

-(Node*)getFather:(Node*)node {
    Node* aux = self->root;
    if(aux == NULL) return NULL;
    if(node == self->root) return NULL;

    while([aux left] != node && [aux right] != node) {
        if([node value] < [aux value])
            aux = [aux left];
        else
            aux = [aux right];
    }
    return aux;
}

-(void) updateBF:(Node*)n {
    int bf = ([self nodeHeight:[n left]]+1) - ([self nodeHeight:[n right]]+1);
    [n updateBalanceFactor:bf];
}

-(void)rotateLeft:(Node*)node son:(Node*)son {
    Node* aux = [self getFather:node];

    if(aux == NULL) self->root = son;
    else if(node == [aux right])
        [aux setRight:son];
    else
        [aux setLeft:son];
    [node setRight:[son left]];
    [son setLeft:node];
}

-(void)rotateRight:(Node*)node son:(Node*)son {
    Node* aux = [self getFather:node];

    if(aux == NULL) self->root = son;
    else if(node == [aux left])
        [aux setLeft:son];
    else
        [aux setRight:son];
    [node setLeft:[son right]];
    [son setRight:node];
}

-(void)rotate:(Node*)node value:(double)value {
    if([node balanceFactor] > 1) {
        if(value < [node value]) {
            if([[node left] balanceFactor] > 0)
                [self rotateRight:node son:[node left]];
            else {
                [self rotateLeft:[node left] son:[[node left] right]];
                [self rotateRight:node son:[node left]];
            }
            [self updateBF:node];
            [self updateBF:[node left]];
        }
    }
    else if([node balanceFactor] < -1) {
        if(value > [node value]) {
            if([[node right] balanceFactor] < 0)
                [self rotateLeft:node son:[node right]];
            else {
                [self rotateRight:[node right] son:[[node right] left]];
                [self rotateLeft:node son:[node right]];
            }
            [self updateBF:node];
            [self updateBF:[node right]];
        }
    }
}

-(double)search:(double)value pointer:(Node*)node {
    if(node == NULL)
        return -1;
    if([node value] == value)
        return value;
    else if([node value] > value)
        return [self search:value pointer:[node left]];
    else
        return [self search:value pointer:[node right]];
}

-(BOOL)insert:(double)value nAddress:(Node**)N {
	if (*N == NULL) {
		Node *n = [[Node alloc] init];
		*N = n;
	}

	if(value < [(*N) value])
        [self insert:value nAddress:[(*N) rightAddress]];
	if(value > [(*N) value])
        [self insert:value nAddress:[(*N) leftAddress]];

    [self updateBF:*N];

	if (abs([(*N) balanceFactor]) > 1) {
        [self rotate:(*N) value:value];
    }
    return YES;
}

@end
