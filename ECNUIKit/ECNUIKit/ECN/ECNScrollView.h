//
//  ECNScrollView.h
//  ECNUIKit
//
//  Created by dong on 2021/5/22.
//

#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

@class  ECNClipView;
@interface ECNScrollView : NSScrollView

- (ECNClipView*)clipView;

@end

NS_ASSUME_NONNULL_END
