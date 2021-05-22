//
//  TestTitleCell.m
//  ECNUIKitTest
//
//  Created by dong on 2021/5/22.
//

#import "TestTitleCell.h"

@implementation TestTitleCell

- (void)drawRect:(NSRect)dirtyRect
{
    if([self isSelected]) {
        [[NSColor selectedControlColor] set];
    }
    else {
        [[NSColor whiteColor] set];
    }

    //Draw the border and background
    NSBezierPath *roundedRect = [NSBezierPath bezierPathWithRoundedRect:[self bounds] xRadius:6.0 yRadius:6.0];
    [roundedRect fill];
}


@end
