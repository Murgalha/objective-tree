#import <Foundation/Foundation.h>
#import "tree.h"
#import "ui.h"

int main(int argc, char *argv[]) {
    NSAutoreleasePool* pool = [[NSAutoreleasePool alloc] init];
    
    UI* ui = [[UI alloc] init];
    
    [ui mainMenu];

    [pool drain];
    return 0;
}
