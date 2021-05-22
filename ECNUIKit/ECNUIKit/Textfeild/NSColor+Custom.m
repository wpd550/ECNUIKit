//
//  NSColor+Custom.m
//  iKIGAI_Download
//
//  Created by dong on 2020/6/22.
//  Copyright © 2020 IKDong. All rights reserved.
//

#import "NSColor+Custom.h"




static void drawCGImagePattern (void *info, CGContextRef context) {
    CGImageRef image = info;

    size_t width = CGImageGetWidth(image);
    size_t height = CGImageGetHeight(image);

    CGContextDrawImage(context, CGRectMake(0, 0, width, height), image);
}

static void releasePatternInfo (void *info) {
    CFRelease(info);
}



@implementation NSColor (Custom)




+ (NSColor*)colorWithHex:(int)rgbValue
{
   
    
    return [NSColor colorWithRed:((int)((rgbValue & 0xFF0000) >> 16))/255.0f green:((float)((rgbValue & 0xFF00) >> 8))/255.0f blue:((float)(rgbValue & 0xFF))/255.0f alpha:1.0];
}

+ (NSColor *)rbl_colorWithCGColor:(CGColorRef)color {
    if (color == nil) {
        return nil;
    }

    CGColorSpaceRef colorSpaceRef = CGColorGetColorSpace(color);

    NSColorSpace *colorSpace = [[NSColorSpace alloc] initWithCGColorSpace:colorSpaceRef];
    NSColor *result = [self colorWithColorSpace:colorSpace components:CGColorGetComponents(color) count:(size_t)CGColorGetNumberOfComponents(color)];

    return result;
}

- (CGColorRef)rbl_CGColor {
    if ([self.colorSpaceName isEqualToString:NSPatternColorSpace]) {
        CGImageRef patternImage = [self.patternImage CGImageForProposedRect:NULL context:nil hints:nil];
        if (patternImage == NULL) {
            return NULL;
        }

        size_t width = CGImageGetWidth(patternImage);
        size_t height = CGImageGetHeight(patternImage);

        CGRect patternBounds = CGRectMake(0, 0, width, height);
        CGPatternRef pattern = CGPatternCreate(
            // Released in releasePatternInfo().
            (void *)CFRetain(patternImage),
            patternBounds,
            CGAffineTransformIdentity,
            width,
            height,
            kCGPatternTilingConstantSpacingMinimalDistortion,
            YES,
            &(CGPatternCallbacks){
                .version = 0,
                .drawPattern = &drawCGImagePattern,
                .releaseInfo = &releasePatternInfo
            }
        );

        CGColorSpaceRef colorSpaceRef = CGColorSpaceCreatePattern(NULL);

        CGColorRef result = CGColorCreateWithPattern(colorSpaceRef, pattern, (CGFloat[]){ 1.0 });

        CGColorSpaceRelease(colorSpaceRef);
        CGPatternRelease(pattern);

        return (__bridge CGColorRef)CFBridgingRelease(result);
    }

    NSColorSpace *colorSpace = NSColorSpace.genericRGBColorSpace;
    NSColor *color = [self colorUsingColorSpace:colorSpace];

    CGFloat components[color.numberOfComponents];
    [color getComponents:components];

    CGColorSpaceRef colorSpaceRef = colorSpace.CGColorSpace;
    CGColorRef result = CGColorCreate(colorSpaceRef, components);

    return (__bridge CGColorRef)CFBridgingRelease(result);
}



@end
