#import "tree.h"

@implementation AVLTree

/* Constructor */
-(id)init {
    /* Initialize empty tree */
    self = [super init];
    self->root = NULL;
    self->size = 0;
    return self;
}

/* Print tree elements in Pre-order */
-(void)preOrder:(Node*) node {
    if(!node)
        return;
    printf("%.2lf ", [node value]);
    [self preOrder:[node left]];
    [self preOrder:[node right]];
}

/* Print tree elements In-order */
/* In-order prints elements in
 * ascending order*/
-(void)inOrder:(Node*)node {
    if(!node)
        return;
    [self inOrder:[node left]];
    printf("%.2lf ", [node value]);
    [self inOrder:[node right]];
}

/* Print tree elements in Post-order */
-(void)postOrder:(Node*)node {
    if(!node)
        return;
    [self postOrder:[node left]];
    [self postOrder:[node right]];
    printf("%.2lf ", [node value]);
}

/* Interface for pre-order print */
-(void)printPreOrder {
    [self preOrder:self->root];
    printf("\n");
}

/* Interface for in-order print */
-(void)printInOrder {
    [self inOrder:self->root];
    printf("\n");
}

/* Interface for post-order print */
-(void)printPostOrder {
    [self postOrder:self->root];
    printf("\n");
}

/* Get the height of given node */
-(int)nodeHeight:(Node*)node {
    /* Choose the highest subtree height (left or right subtree) */
    return node ? 1+MAX([self nodeHeight:[node left]],[self nodeHeight:[node right]]) : -1;
}

/* Calculate tree height */
-(int)treeHeight {
    return [self nodeHeight:self->root];
}

/* Return the father of a given node */
-(Node*)getFather:(Node*)node {
    Node* aux = self->root;

    /* return NULL if 'node' is NULL or the root */
    if(aux == NULL) return NULL;
    if(node == self->root) return NULL;
    
    /* Search the tree for the father o 'node' */
    while([aux left] != node && [aux right] != node) {
        /* Descend left if searching value is smaller
         * than current node */
        if([node value] < [aux value])
            aux = [aux left];
        /* Descend right otherwise */
        else
            aux = [aux right];
    }
    return aux;
}

/* Update balance factor of a given node */
-(void) updateBF:(Node*)n {
    if(!n) return;
    /* Balance factor = (left subtree height) - (right subtree height) */
    int bf = ([self nodeHeight:[n left]]+1) - ([self nodeHeight:[n right]]+1);
    [n updateBalanceFactor:bf];
}

-(void)rotateLeft:(Node*)node son:(Node*)son {
    /* Get father node of 'node' */
    Node* aux = [self getFather:node];

    /* Rearrange pointers for the
     * left rotation */
    if(aux == NULL) self->root = son;
    else if(node == [aux right])
        [aux setRight:son];
    else
        [aux setLeft:son];
    [node setRight:[son left]];
    [son setLeft:node];
}

-(void)rotateRight:(Node*)node son:(Node*)son {
    /* Get father node of 'node' */
    Node* aux = [self getFather:node];

    /* Rearrange pointers for the
     * right rotation */
    if(aux == NULL) self->root = son;
    else if(node == [aux left])
        [aux setLeft:son];
    else
        [aux setRight:son];
    [node setLeft:[son right]];
    [son setRight:node];
}

-(void)rotate:(Node*)node value:(double)value {
    /* Check if left subtree is bigger than right subtree */
    if([node balanceFactor] > 1) {
        if(value < [node value]) {
            if([[node left] balanceFactor] > 0)
                /* Rotate right */
                [self rotateRight:node son:[node left]];
            else {
                /* Rotate left-right */
                [self rotateLeft:[node left] son:[[node left] right]];
                [self rotateRight:node son:[node left]];
            }
            /* Update possuble modified nodes' balance factor */
            [self updateBF:node];
            [self updateBF:[node left]];
        }
    }
    /* Else if right subtree is bigger than left subtree */
    else if([node balanceFactor] < -1) {
        if(value > [node value]) {
            if([[node right] balanceFactor] < 0)
                /* Rotate left */
                [self rotateLeft:node son:[node right]];
            else {
                /* Rotate right-left */
                [self rotateRight:[node right] son:[[node right] left]];
                [self rotateLeft:node son:[node right]];
            }
            /* Update possuble modified nodes' balance factor */
            [self updateBF:node];
            [self updateBF:[node right]];
        }
    }
}

-(Node*)recursiveSearch:(double)value pointer:(Node*)node {
    if(node == NULL)
        return NULL;
    if([node value] == value)
        return node;
    else if([node value] > value)
        return [self recursiveSearch:value pointer:[node left]];
    else
        return [self recursiveSearch:value pointer:[node right]];
}

-(Node*)search:(double)value {
    return [self recursiveSearch:value pointer:self->root];
}

-(void)recursiveInsert:(double)value nAddress:(Node**)N {
    /* Insert node after reaching leaves */
	if (*N == NULL) {
        Node* n = [[Node alloc] init:value];
		*N = n;
	}
    /* Descend on left or right son depending on current node value */
	if(value < [(*N) value])
        [self recursiveInsert:value nAddress:[(*N) leftAddress]];
    else if(value > [(*N) value])
        [self recursiveInsert:value nAddress:[(*N) rightAddress]];

    /* After insertion, update balance factor */
    [self updateBF:*N];

    /* Verify if nodes need to rotate */
	if (abs([(*N) balanceFactor]) > 1) {
        [self rotate:(*N) value:value];
    }
}

-(void)insert:(double)value {
    [self recursiveInsert:value nAddress:&(self->root)]; 
}

-(double)predecessorOf:(double)value {
    /* Initialize result with default error value
     * and verify if any variable needed is NULL */
    double num = -1;
    if(!self->root)
        return -1;
    Node* aux = self->root;
    Node* node = [self search:value];

    if(!node)
        return -1;

    /* Descend the tree searching the biggest
     * number before 'value' */
    while(aux) {
        if(value <= [aux value])
            aux = [aux left];
        else {
            num = [aux value];
            aux = [aux right];
        }
    }
    return num;
}

-(double)successorOf:(double)value {
    /* Initialize result with default error value
     * and verify if any variable needed is NULL */
    double num = -1;
    if(!self->root)
        return -1;
    Node* aux = self->root;
    Node* node = [self search:value];

    if(!node)
        return -1;

    /* Descend the tree searching the smallest
     * number after 'value' */
    while(aux) {
        if(value < [aux value]) {
            num = [aux value];
            aux = [aux left];
        }
        else
            aux = [aux right];
    }
    return num;
}

-(double)min {
    if(!self->root)
        return INT_MIN;
    Node* aux = self->root;
    
    /* Descend on left subtree until
     * last value (minimum value) */
    while([aux left])
        aux = [aux left];
    return [aux value];
}

-(double)max {
    if(!self->root)
        return INT_MIN;
    Node* aux = self->root;

    /* Descend on right subtree until
     * last value (maximum value) */
    while([aux right])
        aux = [aux right];
    return [aux value];
}

@end
