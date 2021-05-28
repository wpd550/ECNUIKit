//
//  ECNLogFormatter.m
//  ECNUIKitTest
//
//  Created by dong on 2021/5/23.
//


#import "ECNLogFormatter.h"


@implementation ECNLogFormatter


- (NSString *)formatLogMessage:(DDLogMessage *)logMessage {
    NSString *loglevel = nil;
    switch (logMessage.flag)
    {
        case DDLogFlagError:
        {
            loglevel = @"[ERROR]--->?";
        }
            break;
        case DDLogFlagWarning:
        {
            loglevel = @"[WARN]---->?";
        }
            break;
        case DDLogFlagInfo:
        {
            loglevel = @"[INFO]---->?";
        }
            break;
        case DDLogFlagDebug:
        {
            loglevel = @"[DEBUG]--->?";
        }
            break;
        case DDLogFlagVerbose:
        {
            loglevel = @"[VBOSE]--->?";
        }
            break;
            
        default:
            break;
    }
    
    
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    // HH是24进制，hh是12进制
    formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    // formatter.locale = [[[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"] autorelease];
    NSString *date = [formatter stringFromDate:logMessage.timestamp];

    NSString *formatStr = [NSString stringWithFormat:@"[%@] %@ [line:%lu]:%@",date, logMessage->_function,(unsigned long)logMessage->_line, logMessage->_message];
//    NSString *formatStr = [NSString stringWithFormat:@"%@",logMessage.message];
    return formatStr;

}
    @end
