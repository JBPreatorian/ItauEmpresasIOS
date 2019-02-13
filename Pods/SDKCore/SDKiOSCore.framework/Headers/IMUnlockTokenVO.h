//
//  IMUnlockTokenVO.h
//  SDKiOSCore
//
//  Created by Jonas Tomaz on 10/6/15.
//  Copyright © 2015 Concrete Solutions. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IMUnlockTokenVO: NSObject

@property (nonatomic, strong) NSString *fistToken;
@property (nonatomic, strong) NSString *secondToken;

@property (nonatomic, strong, readonly) NSString *errorMessage;

- (BOOL)isValid;

@end
