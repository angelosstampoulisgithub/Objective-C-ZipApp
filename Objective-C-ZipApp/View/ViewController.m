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
    _helper = [[Helper alloc] init];
    [_tableView  setDelegate:self];
    [_tableView setDataSource:self];
    [_helper createTempDirectory];
    // Do any additional setup after loading the view.
}
- (void)viewDidDisappear{
    [_helper removeTempDirectory];
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

- (void)tableViewSelectionDidChange:(NSNotification *)notification{
    if ([notification object] == self.tableView) {
        _selectedRow = [_tableView selectedRow];
        NSString* cellValue = [NSString stringWithFormat:@"%@",[_array objectAtIndex:_selectedRow]];
        NSString *folder = [NSString stringWithFormat:@"%@%@",[_txtList stringValue],cellValue];
        NSString *tempFolder = [NSString stringWithFormat:@"%@/%@",[_helper getTempDirectory],cellValue];
        NSURL *atURL = [NSURL fileURLWithPath:folder];
        NSURL *toURL = [NSURL fileURLWithPath:tempFolder];
        [[NSFileManager defaultManager] copyItemAtURL:atURL toURL:toURL error:nil];
        _isSelected = !_isSelected;

    }
}
- (IBAction)btnFiles:(id)sender {
    [_array addObjectsFromArray:[[NSFileManager defaultManager] contentsOfDirectoryAtPath:[_txtList stringValue] error:nil]];
    [_tableView reloadData];
}
- (IBAction)btnCreateZip:(id)sender {
    if(_isSelected){
        NSURL *directoryURL = [NSURL fileURLWithPath:_helper.getTempDirectory];
        NSURL *zipURL = [NSURL fileURLWithPath:_txtZipFile.stringValue];
        NSFileCoordinator *coordinator = [[NSFileCoordinator alloc] init];
        [coordinator coordinateReadingItemAtURL:directoryURL options:NSFileCoordinatorReadingForUploading error:nil byAccessor:^(NSURL * _Nonnull newURL) {
            [[NSFileManager defaultManager] moveItemAtURL:newURL toURL:zipURL error:nil];
        }];
    }else{
        NSURL *directoryURL = [NSURL fileURLWithPath:_txtList.stringValue];
        NSURL *zipURL = [NSURL fileURLWithPath:_txtZipFile.stringValue];
        NSFileCoordinator *coordinator = [[NSFileCoordinator alloc] init];
        [coordinator coordinateReadingItemAtURL:directoryURL options:NSFileCoordinatorReadingForUploading error:nil byAccessor:^(NSURL * _Nonnull newURL) {
            [[NSFileManager defaultManager] moveItemAtURL:newURL toURL:zipURL error:nil];
        }];
    }
    NSAlert *alert = [[NSAlert alloc] init];
    alert.informativeText = @"Zip is created successfully";
    alert.messageText = @"Information Message";
    [alert runModal];
}
@end
