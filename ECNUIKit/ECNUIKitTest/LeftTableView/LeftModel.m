//
//  leftModel.m
//  ECNUIKit
//
//  Created by dong on 2021/5/22.
//

#import "LeftModel.h"

@implementation LeftModel

- (instancetype)initWithName:(NSString*)name XibName:(NSString*)xibName iconName:(NSString*)iconName{
    if(self = [super init]){
        _name = name;
        _xibName = xibName;
        _iconName = iconName;
    }
    return self;
}


@end
