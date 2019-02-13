//
//  IMTokenAppData.h
//  SDKiOSCore
//
//  Created by Jonas Tomaz on 11/23/15.
//  Copyright © 2015 Concrete Solutions. All rights reserved.
//

#import "IMBaseModel.h"

@interface IMTokenAppData: IMBaseModel

@property (nonatomic, copy) NSString *ctf;
@property (nonatomic, copy) NSString *cancelSerialNumber;

- (instancetype)tokenAppDataWithCancelSerialNumberNormalizedTo12Char;

@end
