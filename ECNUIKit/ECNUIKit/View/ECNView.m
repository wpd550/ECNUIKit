//
//  ECNView.m
//  ECNUIKit
//
//  Created by dong on 2021/5/16.
//

#import "ECNView.h"

@interface ECNView(){
    
}


@end

@implementation ECNView


- (instancetype)initWithCoder:(NSCoder *)coder{
    if(self = [super initWithCoder:coder]){
        [self setupDefault];
    }
    return  self;
    
}

- (instancetype)initWithFrame:(NSRect)frameRect
{
    if(self = [super initWithFrame:frameRect]){
        [self setupDefault];
    }
    return self;
}

- (void)setupDefault{
    _needsTrackingArea = YES;
    self.layer.masksToBounds = false;
}

- (void)setNeedsTrackingArea:(BOOL)needsTrackingArea{
    _needsTrackingArea = needsTrackingArea;
    if (!needsTrackingArea && self.trackingArea != nil) {
        [self removeTrackingArea:self.trackingArea];
        self.trackingArea = nil;
    }
}

- (void)updateTrackingAreas{
        if (!self.needsTrackingArea)
            return;
        
        if (self.trackingArea) {
            [self removeTrackingArea:self.trackingArea];
            self.trackingArea = nil;
        }
        
        // TODO: Figure out correct tracking to implement mouse drag
        NSUInteger options = (NSTrackingMouseEnteredAndExited | NSTrackingActiveAlways | NSTrackingEnabledDuringMouseDrag);
        self.trackingArea = [[NSTrackingArea alloc] initWithRect:self.bounds
                                                         options:options
                                                           owner:self
                                                        userInfo:nil];
        [self addTrackingArea:self.trackingArea];
    
}

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
//    [self drawBackground];
//    [self drawNiceBackground];
    
    [self showShadow:YES];
    
    [self drawBorder];
    // Drawing code here.
//    self.wantsLayer = YES;
//    self.layer.borderWidth = 2.0;
//    self.layer.masksToBounds = false;
//    [NSGraphicsContext saveGraphicsState];
//
//    NSShadow* theShadow = [[NSShadow alloc] init];
//    [theShadow setShadowOffset:NSMakeSize(5.0, -5.0)];
//    [theShadow setShadowBlurRadius:2.0];
//    [theShadow setShadowColor:[[NSColor blueColor]
//                                colorWithAlphaComponent:0.3]];
//    [theShadow set];
//
//    [[NSColor whiteColor] set];
//    [NSBezierPath fillRect:dirtyRect];
//
//    [NSGraphicsContext restoreGraphicsState];
//    self.shadow = theShadow;
}


- (CGContextRef)currentContext{
    return [[NSGraphicsContext currentContext] CGContext];
}

- (void)drawBackground
{
    CGContextRef context = self.currentContext;

    CGRect innerRect = CGRectInset (self.bounds, 20, 20);
    if (CGRectIsEmpty(innerRect)) return;

//    CGContextSetShadow(context, CGSizeMake(5, -5), 5.0);
    CGContextSetShadowWithColor(context, CGSizeMake(5, -1), 1.0, [NSColor redColor].CGColor);
    CGContextSetRGBFillColor (context, 0.0, 1.0, 0.0, 1.0); // Green
    CGContextFillEllipseInRect (context, innerRect);

    CGContextSetRGBStrokeColor (context, 0.0, 0.0, 1.0, 1.0); // Blue
    CGContextSetLineWidth (context, 6.0);
    CGContextStrokeEllipseInRect (context, innerRect);
}


- (void) drawNiceBackground {
    CGContextRef context = self.currentContext;
    
    CGContextSaveGState (context); {
        [[NSColor redColor] set];
        CGContextFillRect (context, self.bounds);
        CGContextSetShadowWithColor(context, CGSizeMake(5, -5), 5.0, [NSColor blueColor].CGColor);
    } CGContextRestoreGState (context);
}

- (void)drawBorder{
    CGContextSetLineWidth(self.currentContext, 2.0);
    CGContextStrokeRect (self.currentContext, self.bounds);
}

- (void)showShadow:(BOOL)isShadow{
    if(isShadow){
        [NSGraphicsContext saveGraphicsState];
        if(!self.shadow){
            NSShadow* theShadow = [[NSShadow alloc] init];
            [theShadow setShadowOffset:NSMakeSize(5.0, 5.0)];
            [theShadow setShadowBlurRadius:1.0];
            [theShadow setShadowColor:[[NSColor blueColor]
                                       colorWithAlphaComponent:0.3]];
            
            [theShadow set];

            self.shadow = theShadow;
        }
        CGContextSetShadowWithColor(self.currentContext, CGSizeMake(5, -5), 5.0, [NSColor blueColor].CGColor);
        [NSGraphicsContext restoreGraphicsState];
    }
}
#pragma mark- Action
- (void)mouseDown:(NSEvent *)event{
    
}

- (void)mouseUp:(NSEvent *)event{
    
}

- (void)mouseEntered:(NSEvent *)event{
    NSLog(@"mouseEntered");
    [self setNeedsDisplay:YES];
}

- (void)mouseExited:(NSEvent *)event{
    NSLog(@"mouseEntered");
}



@end
