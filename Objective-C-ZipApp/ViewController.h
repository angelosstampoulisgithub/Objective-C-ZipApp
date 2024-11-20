//
//  ViewController.h
//  Objective-C-ZipApp
//
//  Created by Angelos Staboulis on 20/11/24.
//

#import <Cocoa/Cocoa.h>

@interface ViewController : NSViewController<NSTableViewDelegate,NSTableViewDataSource>
@property (weak) IBOutlet NSTextField *txtList;
@property (weak) IBOutlet NSTextField *txtZipFile;

- (IBAction)btnFiles:(id)sender;
@property (weak) IBOutlet NSButton *btnList;
@property (weak) IBOutlet NSTableView *tableView;
@property NSMutableArray *array;

- (IBAction)btnCreateZip:(id)sender;

@end

