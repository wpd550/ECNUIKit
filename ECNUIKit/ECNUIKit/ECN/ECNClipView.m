//
//  ECNClipView.m
//  ECNUIKit
//
//  Created by dong on 2021/5/22.
//

#import "ECNClipView.h"
#import "NSColor+Custom.h"

@implementation ECNClipView

//@dynamic layer

- (NSColor *)backgroundColor{
    return [NSColor rbl_colorWithCGColor:self.layer.backgroundColor];
}

- (void)setBackgroundColor:(NSColor *)backgroundColor{
    self.layer.backgroundColor = backgroundColor.CGColor;
}

- (BOOL)isOpaque{
    return  self.layer.opaque;
}

- (void)setOpaque:(BOOL)opaque{
    self.layer.opaque = opaque;
}



- (instancetype)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.layer = [CAScrollLayer layer];
        self.wantsLayer = YES;
        //  重绘策略
        self.layerContentsRedrawPolicy = NSViewLayerContentsRedrawNever;
        self.backgroundColor = NSColor.clearColor;
        self.opaque = YES;
    }
    return self;
}


- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        self.layer = [CAScrollLayer layer];
        self.wantsLayer = YES;
        //  重绘策略
        self.layerContentsRedrawPolicy = NSViewLayerContentsRedrawNever;
        self.backgroundColor = NSColor.clearColor;
        self.opaque = YES;
    }
    return self;
}



@end
