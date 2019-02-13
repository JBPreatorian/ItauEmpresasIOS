//
//  LegacyMenuData.h
//  SDKiOSCore
//
//  Created by Jonas Tomaz on 10/16/15.
//  Copyright © 2015 Concrete Solutions. All rights reserved.
//

#import "LegacyMenuLink.h"
#import "IMBaseModel.h"

@interface LegacyMenuData: IMBaseModel

@property (nonatomic, copy) NSString *idu;
@property (nonatomic, copy) NSString *opu;
@property (nonatomic, copy) NSArray  *links;

@end
