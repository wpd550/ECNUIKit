//
//  ECNClipView.h
//  ECNUIKit
//
//  Created by dong on 2021/5/22.
//

#import <QuartzCore/QuartzCore.h>
#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN




/// 比NSClipView 更快的
@interface ECNClipView : NSClipView


@property (nonatomic,strong) CAScrollLayer *layer;

@property (nonatomic,getter= isOpaque) BOOL opaque;

@end

NS_ASSUME_NONNULL_END
