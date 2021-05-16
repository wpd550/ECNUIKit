//
//  ECNView.h
//  ECNUIKit
//
//  Created by dong on 2021/5/16.
//

#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

@interface ECNView : NSView

@property (nonatomic, strong) NSTrackingArea *trackingArea;
@property (nonatomic, assign) BOOL needsTrackingArea;


@end

NS_ASSUME_NONNULL_END
