//
//  Helper.h
//  Objective-C-ZipApp
//
//  Created by Angelos Staboulis on 22/11/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Helper : NSObject
-(NSString*) getHomeDirectory;
-(NSString*) getTempDirectory;
-(void)createTempDirectory;
-(void)removeTempDirectory;
@end

NS_ASSUME_NONNULL_END
