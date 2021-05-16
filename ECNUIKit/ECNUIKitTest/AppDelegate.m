//
//  AppDelegate.m
//  ECNUIKitTest
//
//  Created by dong on 2021/5/16.
//

#import "AppDelegate.h"
#import <ECNUIKit/Button.h>
#import <ECNUIKit/ECNUIKit.h>


@interface AppDelegate ()
@property (weak) IBOutlet NSView *View;

@property (strong) IBOutlet NSWindow *window;
@end



@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
//    [self.View showGreenArrowsWithHeight:10];
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


@end
