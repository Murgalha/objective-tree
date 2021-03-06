#import <stdio.h>
#import "ui.h"

@implementation UI

/* Constructor creating a new AVLTree */
-(id)init {
    AVLTree* T = [[AVLTree alloc] init];
    self->tree = T;
    return self;
}

-(NSString*)readLine {
    int counter = 0;
    char* str = NULL;
    char c;

    /* Read every char from stdin until '\n' */
    do {
        c = fgetc(stdin);
        str = (char*) realloc (str, sizeof(char)*(counter+1));
        str[counter++] = c;
    } while(c != '\n');

    /* Replace '\n' with '\0' */
    str[counter-1] = '\0';

    /* Convert char* to NSString and return */
    NSString* input = [[NSString alloc] initWithUTF8String:str];
    return input;
}

-(NSString*)filterViewMenuInput:(NSString*)raw {
    raw = [raw lowercaseString];

    /* Verify if input matches menu option */
    if([raw isEqualToString:@"pre-order"] || [raw isEqualToString:@"1"])
        return @"pre";
    else if([raw isEqualToString:@"in-order"] || [raw isEqualToString:@"2"])
        return @"in";
    else if([raw isEqualToString:@"post-order"] || [raw isEqualToString:@"3"])
        return @"post";
    else if([raw isEqualToString:@"predecessor"] || [raw isEqualToString:@"4"])
        return @"predecessor";
    else if([raw isEqualToString:@"successor"] || [raw isEqualToString:@"5"])
        return @"successor";
    else if([raw isEqualToString:@"return"] || [raw isEqualToString:@"6"])
        return @"return";
    else
        return @"";    
}

-(void)viewMenu {
    NSString* input;

    while(YES) {
        /* Print view menu options */
        printf("What do you want to see?\n");
        printf("1. Pre-order print\n");
        printf("2. In-order print\n");
        printf("3. Post-order print\n");
        printf("4. Predecessor\n");
        printf("5. Successor\n");
        printf("6. Return\n");

        /* Get input and filter it */
        input = [self readLine];
        input = [self filterViewMenuInput:input];

        if([input isEqualToString:@"pre"]) {
            printf("Pre-Order: ");
            [self->tree printPreOrder];
        }
        else if([input isEqualToString:@"in"]) {
            printf("In-Order: ");
            [self->tree printInOrder];            
        }
        else if([input isEqualToString:@"post"]) {
            printf("Post-Order: ");
            [self->tree printPostOrder];            
        }
        else if([input isEqualToString:@"predecessor"]) {
            NSString* str;
            printf("Get predecessor of: ");

            /* Get predecessor input and try to convert */
            str = [self readLine];
            double n = [str doubleValue];

            /* Conversion error */
            if(n <= 0) {
                printf("Invalid number\n");
            }
            /* Print node search error */
            else if(![self->tree search:n]) {
                printf("%.2lf is not on the tree\n", n);
                continue;
            }
            else {
                /* Print predecessor or error if there are none */
                double pred = [self->tree predecessorOf:n];
                if(pred == -1)
                    printf("%.2lf has no predecessor\n", n);
                else
                    printf("Predecessor of %.2lf is %.2lf\n", n, pred);
            }
        }
        else if([input isEqualToString:@"successor"]) {
            NSString* str;
            printf("Get successor of: ");

            /* Get successor input and try to convert */
            str = [self readLine];
            double n = [str doubleValue];

            /* Conversion error */
            if(n <= 0) {
                printf("Invalid number\n");
            }
            /* Search error */
            else if(![self->tree search:n]) {
                printf("%.2lf is not on the tree\n", n);
                continue;
            }
            else {
                /* Print predecessor or error if there are none */
                double succ = [self->tree successorOf:n];
                if(succ == -1)
                    printf("%.2lf has no successor\n", n);
                else
                    printf("Successor of %.2lf is %.2lf\n", n, succ);
            }            
        }
        else if([input isEqualToString:@"return"])
            return;
        else {
            printf("Invalid command\n");
        }
    }
}

-(void)insertMenu {
    NSString* input;

    while(YES) {
        printf("Type the number you want to insert\n(type ENTER on empty line to return): ");
        input = [self readLine];

        if([input isEqualToString:@""])
            return;

        /* Try to convert input */
        double d = [input doubleValue];
        if(d <= 0)
            printf("Invalid command\n");
        else {
            [self->tree insert:d];
            printf("%.2lf inserted\n", d);
        }
    }
}

-(NSString*)filterMainMenuInput:(NSString*)raw {
    raw = [raw lowercaseString];

    /* Verify if input matches menu option */
    if([raw isEqualToString:@"insert"] || [raw isEqualToString:@"1"])
        return @"insert";
    else if([raw isEqualToString:@"view"] || [raw isEqualToString:@"2"])
        return @"view";
    else if([raw isEqualToString:@"exit"] || [raw isEqualToString:@"3"])
        return @"exit";
    else
        return @"";
}

-(void)mainMenu {
    NSString* input;

    while(YES) {
        /* Main menu options */
        printf("Welcome to the AVL Tree Manager.\nWhat do you want to do?\n");
        printf("1. Insert\n");
        printf("2. View\n");
        printf("3. Exit\n");

        /* Get main menu input */
        input = [self readLine];
        input = [self filterMainMenuInput:input];
        
        if([input isEqualToString:@"insert"]) {
            [self insertMenu];
        }
        else if([input isEqualToString:@"view"]) {
            [self viewMenu];
        }
        else if([input isEqualToString:@"exit"]) {
            return;
        }
        else {
            printf("Invalid command\n");
        }
    }
}

@end
