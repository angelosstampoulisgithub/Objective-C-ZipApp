//
//  Helper.m
//  Objective-C-ZipApp
//
//  Created by Angelos Staboulis on 22/11/24.
//

#import "Helper.h"
#import "Cocoa/Cocoa.h"
@implementation Helper

- (void)createTempDirectory {
    NSString *getTemp = [NSString stringWithFormat:@"%@%@",NSHomeDirectory(),@"/temp"];
    NSURL *urlTemp = [NSURL fileURLWithPath:getTemp];
    [[NSFileManager defaultManager] createDirectoryAtURL:urlTemp withIntermediateDirectories:FALSE attributes:nil error:nil];
}

- (nonnull NSString *)getTempDirectory {
     
    return [NSString stringWithFormat:@"%@%@",NSHomeDirectory(),@"/temp"];
}

- (void)removeTempDirectory {
    NSString *getTempDirectory = [NSString stringWithFormat:@"%@%@",NSHomeDirectory(),@"/temp"];
    NSURL *urlTemp = [NSURL fileURLWithPath:getTempDirectory];
    [[NSFileManager defaultManager] removeItemAtURL:urlTemp error:nil];
}

- (nonnull NSString *)getHomeDirectory {
    return NSHomeDirectory();
}

@end
