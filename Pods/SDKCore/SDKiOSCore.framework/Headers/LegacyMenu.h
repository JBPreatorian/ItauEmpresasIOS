//
//  LenacyMenu.h
//  SDKiOSCore
//
//  Created by Jonas Tomaz on 10/16/15.
//  Copyright © 2015 Concrete Solutions. All rights reserved.
//

#import "LegacyMenuData.h"
#import "IMBaseModel.h"

@interface LegacyMenu: IMBaseModel

@property (nonatomic, strong) LegacyMenuData *data;

@property (nonatomic, copy) NSString *idApp;
@property (nonatomic, copy) NSString *opApp;

- (NSString *)opAppWithIDServ:(NSString *)idServ;

@end
