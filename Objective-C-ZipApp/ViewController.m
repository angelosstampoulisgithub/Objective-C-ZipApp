//
//  ViewController.m
//  Objective-C-ZipApp
//
//  Created by Angelos Staboulis on 20/11/24.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _array=[NSMutableArray array];
    
    [_tableView  setDelegate:self];
    [_tableView setDataSource:self];
    // Do any additional setup after loading the view.
}
- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView{
    return [_array count];
}
-(NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    NSTableCellView *cell = [tableView makeViewWithIdentifier:@"cell" owner:self];
    NSString *stringValue = [NSString stringWithFormat:@"%@",[_array objectAtIndex:row]];
    [[cell textField] setStringValue:stringValue];
    return cell;
}

- (IBAction)btnFiles:(id)sender {
    [_array addObjectsFromArray:[[NSFileManager defaultManager] contentsOfDirectoryAtPath:[_txtList stringValue] error:nil]];
    [_tableView reloadData];
}
- (IBAction)btnCreateZip:(id)sender {
    NSURL *directoryURL = [NSURL fileURLWithPath:_txtList.stringValue];
    NSURL *zipURL = [NSURL fileURLWithPath:_txtZipFile.stringValue];
    NSFileCoordinator *coordinator = [[NSFileCoordinator alloc] init];
    [coordinator coordinateReadingItemAtURL:directoryURL options:NSFileCoordinatorReadingForUploading error:nil byAccessor:^(NSURL * _Nonnull newURL) {
        [[NSFileManager defaultManager] moveItemAtURL:newURL toURL:zipURL error:nil];
    }];
}
@end
