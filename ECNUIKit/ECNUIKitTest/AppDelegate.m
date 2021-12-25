//
//  AppDelegate.m
//  ECNUIKitTest
//
//  Created by dong on 2021/5/16.
//

#import "AppDelegate.h"
#import <ECNUIKit/ECNUIKit.h>
#import "ECNModel.h"
#import "LeftModel.h"
#import "TestTitleCell.h"
#import "ECNLogFormatter.h"

#define DD_LEGACY_MESSAGE_TAG 0

#import <CocoaLumberjack/CocoaLumberjack.h>

#import "ECNHorizontalTableView.h"

@interface AppDelegate ()<NSTableViewDataSource,NSTableViewDelegate,PXListViewDelegate>
@property (weak) IBOutlet NSView *View;
@property (weak) IBOutlet NSBox *contentBox;

@property (strong) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSTextField *label;

@property (strong) SFBPopover *popoVer;

@property (weak) IBOutlet NSView *popoView;
@property (weak) IBOutlet NSTableView *tableView;
@property (weak) IBOutlet NSArrayController *controller;


@property (weak) IBOutlet NSSplitView *splitView;

@property (weak) IBOutlet ECNHorizontalTableView *horizonView;


@property (strong) NSMutableArray *listItems;

@end
#if DEBUG
    static const DDLogLevel ddLogLevel = DDLogLevelVerbose;
#else
    static const DDLogLevel ddLogLevel = DDLogLevelWarning;
#endif


@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    [self.View showGreenArrowsWithHeight:10];
    [self initLLog];
    self.contentArray = [NSMutableArray new];
    self.tableView.floatsGroupRows = YES;
    self.tableView.rowHeight = 50;
    for (int i =0; i <20; i++) {
        LeftModel *model = [[LeftModel alloc] initWithName:@"Test" XibName:@"ECNFirstViewController" iconName:nil];
        [self.contentArray addObject:model];
    }
    [self.controller rearrangeObjects];
    
    [self initHorizonView];
    
   

}
- (IBAction)clickbutton:(id)sender {
    
    NSButton *toggleButton = (NSButton*)sender;
    if(!self.popoVer)
        self.popoVer = [[SFBPopover alloc] initWithContentView:self.popoView];
    if([self.popoVer isVisible]){
        [self.popoVer closePopover:sender];
        return;
    }
    NSPoint attachmentPoint = toggleButton.frame.origin;
    attachmentPoint.x += toggleButton.frame.size.width / 2;
    attachmentPoint.y += toggleButton.frame.size.height / 2;
    //    popover.display(in: window, at: attachmentPoint)
    [_popoVer setDrawsArrow:NO];
    [_popoVer displayPopoverInWindow:self.window atPoint:attachmentPoint chooseBestLocation:YES];
}



- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}
//-(BOOL)tableView:(NSTableView *)tableView isGroupRow:(NSInteger)row{
//    if(row == 0 || row == 8){
//        return YES;
//    }
//    return NO;
//}
//


- (void)tableViewSelectionDidChange:(NSNotification *)notification{
   
    
   NSInteger row = [self.tableView selectedRow];
    if(row < 0 || row > self.contentArray.count){
        return;;
    }
    NSLog(@"tableViewSelectRow = %ld",(long)row);
    LeftModel* selectModel = self.contentArray[row];
    if(selectModel){
        if(!selectModel.controller){
            selectModel.controller = [[NSViewController alloc] initWithNibName:selectModel.xibName  bundle:[NSBundle bundleForClass:[self class]]];
        }
        [self.contentBox setContentView:selectModel.controller.view];
    }
}




#pragma mark-         titleBar

-(void)initHorizonView{
    [self.horizonView setCellSpacing:2.0f];
//    [self.horizonView setAllowsEmptySelection:YES];
//    [self.horizonView setAllowsMultipleSelection:YES];
    self.horizonView.delegate = self;
    
    _listItems = [[NSMutableArray alloc] init];

    //Create a bunch of rows as a test
    for( NSInteger i = 0; i < 400; i++ )
    {
        NSString *title = [[NSString alloc] initWithFormat: @"Item %d", i +1];
        [_listItems addObject:title];

    }
    
    [self.horizonView reloadData];
}


- (NSUInteger)numberOfRowsInListView: (PXListView*)aListView
{
#pragma unused(aListView)
    return [_listItems count];
}

#define LISTVIEW_CELL_IDENTIFIER        @"MyListViewCell"
- (PXListViewCell*)listView:(PXListView*)aListView cellForRow:(NSUInteger)row
{
    TestTitleCell *cell = (TestTitleCell*)[aListView dequeueCellWithReusableIdentifier:LISTVIEW_CELL_IDENTIFIER];
    
    if(!cell) {
        cell = [TestTitleCell cellLoadedFromNibNamed:@"TestTitleCell" reusableIdentifier:LISTVIEW_CELL_IDENTIFIER];
    }
    
    // Set up the new cell:
//    [[cell titleLabel] setStringValue:[_listItems objectAtIndex:row]];
    cell.label.stringValue = [NSString stringWithFormat:@"%d",row];
    
    return cell;
}

- (CGFloat)listView:(PXListView*)aListView heightOfRow:(NSUInteger)row
{
    return 80;
}

- (CGFloat)listView:(PXListView *)aListView widthOfRow:(NSUInteger)row{
    return 100;
}

- (void)listViewSelectionDidChange:(NSNotification*)aNotification
{
    NSLog(@"Selection changed");
}

- (void)initLLog{
   
    
    ECNLogFormatter *formatter = [[ECNLogFormatter alloc] init];
    [[DDOSLogger sharedInstance] setLogFormatter:formatter];
    [DDLog addLogger:[DDOSLogger sharedInstance]];
    DDFileLogger *fileLogger = [[DDFileLogger alloc] init];
    fileLogger.rollingFrequency = 60*60*24;
    fileLogger.logFileManager.maximumNumberOfLogFiles = 7;
    fileLogger.logFormatter = formatter;
    [DDLog addLogger:fileLogger];
    
    DDLogVerbose(@"DDLogVerbose");
}

@end
