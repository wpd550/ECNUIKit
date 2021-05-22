//
//  ECNScrollView.m
//  ECNUIKit
//
//  Created by dong on 2021/5/22.
//

#import "ECNScrollView.h"
#import "ECNClipView.h"

@implementation ECNScrollView


- (instancetype)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self swapClipView];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self swapClipView];
    }
    return self;
}


- (ECNClipView*)clipView{
    if([self.contentView isKindOfClass:ECNClipView.class]){
        return (ECNClipView*)self.contentView;
    }
    return nil;
}


- (void)swapClipView{
    self.layer = [CAScrollLayer layer];
    self.wantsLayer = YES;
    
    self.layerContentsRedrawPolicy = NSViewLayerContentsRedrawOnSetNeedsDisplay;
    self.layer.opaque = YES;
    id documentView = self.documentView;
    ECNClipView *clipView = [[ECNClipView alloc] initWithFrame:self.contentView.frame
                             ];
    [clipView.layer setOpaque:YES];
    self.contentView = clipView;
    self.documentView = documentView;
}

@end
