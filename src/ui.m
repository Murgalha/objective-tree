#import <stdio.h>
#import "ui.h"

@implementation UI

-(id)init {
    AVLTree* T = [[AVLTree alloc] init];
    self->tree = T;
    return self;
}

-(NSString*)readLine {
    int counter = 0;
    char* str = NULL;
    char c;

    do {
        c = fgetc(stdin);
        str = (char*) realloc (str, sizeof(char)*(counter+1));
        str[counter++] = c;
    } while(c != '\n');

    str[counter-1] = '\0';

    NSString* input = [[NSString alloc] initWithUTF8String:str];
    return input;
}

-(NSString*)filterViewMenuInput:(NSString*)raw {
    raw = [raw lowercaseString];

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
        printf("What do you want to see?\n");
        printf("1. Pre-order print\n");
        printf("2. In-order print\n");
        printf("3. Post-order print\n");
        printf("4. Predecessor\n");
        printf("5. Successor\n");
        printf("6. Return\n");

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
            
        }
        else if([input isEqualToString:@"successor"]) {
            
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
        printf("Type the number you want to insert or ENTER on empty line to return: ");
        input = [self readLine];
    }
}

-(NSString*)filterMainMenuInput:(NSString*)raw {
    raw = [raw lowercaseString];

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
        printf("Welcome to the AVL Tree Manager.\nWhat do you want to do?\n");
        printf("1. Insert\n");
        printf("2. View\n");
        printf("3. Exit\n");

        input = [self readLine];
        input = [self filterMainMenuInput:input];
        
        if([input isEqualToString:@"insert"]) {
            // insert menu
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
