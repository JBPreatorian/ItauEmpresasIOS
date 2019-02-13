//
//  IMApplicationToken.h
//  SDKiOSCore
//
//  Created by Thiago Lioy on 12/1/15.
//  Copyright © 2015 Concrete Solutions. All rights reserved.
//

#import "IMBaseModel.h"

@interface IMApplicationToken: IMBaseModel

@property (nonatomic, strong) NSString *status;
@property (nonatomic, strong) NSString *serialNumber;
- (BOOL)isEnable;
- (NSString *)serialNumberNormalizedTo12Char;

@end
