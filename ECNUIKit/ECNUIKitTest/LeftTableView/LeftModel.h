//
//  leftModel.h
//  ECNUIKit
//
//  Created by dong on 2021/5/22.
//

#import <Foundation/Foundation.h>
#import <AppKit/AppKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LeftModel : NSObject

@property(copy) NSString* name;
@property(copy) NSString* xibName;
@property(copy) NSString* iconName;

@property(strong) NSViewController* controller;
- (instancetype)initWithName:(NSString*)name XibName:(NSString*)xibName iconName:(NSString*)iconName;
@end

NS_ASSUME_NONNULL_END
