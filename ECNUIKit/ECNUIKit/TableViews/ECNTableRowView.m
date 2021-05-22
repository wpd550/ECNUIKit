//
//  ECNTableRowView.m
//  ECNUIKit
//
//  Created by dong on 2021/5/20.
//

#import <QuartzCore/QuartzCore.h>
#import "ECNTableRowView.h"

@implementation ECNTableRowView


- (void)updateTrackingAreas{
    NSUInteger options = (NSTrackingMouseEnteredAndExited | NSTrackingActiveAlways | NSTrackingEnabledDuringMouseDrag);
    [self addTrackingArea: [[NSTrackingArea alloc] initWithRect:self.bounds
                                                           options:options
                                                             owner:self userInfo:nil]];
}

- (void)drawSelectionInRect:(NSRect)dirtyRect {
//    NSColor *primaryColor = [[NSColor alternateSelectedControlColor] colorWithAlphaComponent:0.5];
//    NSColor *secondarySelectedControlColor = [[NSColor secondarySelectedControlColor] colorWithAlphaComponent:0.5];
    
    
    NSLog(@"drawSelectionInRect");
    NSColor *primaryColor = [NSColor orangeColor];
    NSColor *secondarySelectedControlColor = [NSColor redColor];
    // Implement our own custom alpha drawing.
    switch (self.selectionHighlightStyle) {
        case NSTableViewSelectionHighlightStyleRegular: {
            if (self.selected) {
                if (self.emphasized) {
                    [primaryColor set];
                } else {
                    [secondarySelectedControlColor set];
                }
                NSRect bounds = self.bounds;
                const NSRect *rects = NULL;
                NSInteger count = 0;
                [self getRectsBeingDrawn:&rects count:&count];
                for (NSInteger i = 0; i < count; i++) {
                    NSRect rect = NSIntersectionRect(bounds, rects[i]);
                    NSRectFillUsingOperation(rect, NSCompositingOperationSourceOver);
                }
            }else{
                if (self.emphasized) {
                    [[NSColor redColor] set];
                } else {
                    [[NSColor orangeColor] set];
                }
                NSRect bounds = self.bounds;
                const NSRect *rects = NULL;
                NSInteger count = 0;
                [self getRectsBeingDrawn:&rects count:&count];
                for (NSInteger i = 0; i < count; i++) {
                    NSRect rect = NSIntersectionRect(bounds, rects[i]);
                    NSRectFillUsingOperation(rect, NSCompositingOperationSourceOver);
                }
                
            }
            break;
        }
        default: {
            // Do super's drawing.
            [super drawSelectionInRect:dirtyRect];
            break;
        }
    }
}
- (void)drawBackgroundInRect:(NSRect)dirtyRect{
//    if (self.emphasized) {
        [[NSColor whiteColor] set];
//    } else {
//        [[NSColor whiteColor] set];
//    }
    NSLog(@"drawBackgroundInRect");
    NSRect bounds = self.bounds;
    const NSRect *rects = NULL;
    NSInteger count = 0;
    [self getRectsBeingDrawn:&rects count:&count];
    for (NSInteger i = 0; i < count; i++) {
        NSRect rect = NSIntersectionRect(bounds, rects[i]);
        NSRectFillUsingOperation(rect, NSCompositingOperationSourceOver);
    }
}

- (void)drawSeparatorInRect:(NSRect)dirtyRect {
    // Draw the grid.
    NSLog(@"drawSeparatorInRect");
    NSRect sepRect = self.bounds;
    sepRect.origin.y = NSMaxY(sepRect) - 1;
    sepRect.size.height = 1;
    sepRect = NSIntersectionRect(sepRect, dirtyRect);
    if (!NSIsEmptyRect(sepRect)) {
        [[NSColor gridColor] set];
        NSRectFill(sepRect);
    }
}

- (NSBackgroundStyle)interiorBackgroundStyle{
    
    return NSBackgroundStyleEmphasized;
}

- (void)mouseExited:(NSEvent *)event{
    [[NSColor greenColor] set];
    //    } else {
    //        [[NSColor whiteColor] set];
    //    }
    NSLog(@"mouseExited");
    NSRect bounds = self.bounds;
    const NSRect *rects = NULL;
    NSInteger count = 0;
    [self getRectsBeingDrawn:&rects count:&count];
    for (NSInteger i = 0; i < count; i++) {
        NSRect rect = NSIntersectionRect(bounds, rects[i]);
        NSRectFillUsingOperation(rect, NSCompositingOperationSourceOver);
    }
}

- (void)mouseEntered:(NSEvent *)event{
    [[NSColor whiteColor] set];
    //    } else {
    //        [[NSColor whiteColor] set];
    //    }
    NSLog(@"mouseEntered");
    NSRect bounds = self.bounds;
    const NSRect *rects = NULL;
    NSInteger count = 0;
//    [self getRectsBeingDrawn:&rects count:&count];
//    for (NSInteger i = 0; i < count; i++) {
//        NSRect rect = NSIntersectionRect(bounds, rects[i]);
//        NSRectFillUsingOperation(bounds, NSCompositingOperationSourceOver);
    
    [NSGraphicsContext saveGraphicsState];
    NSRectFill(bounds);
//    }
    [NSGraphicsContext  restoreGraphicsState];
}


@end
