//
//  IMHeader.h
//  SDKiOSCore
//
//  Created by Jonas Tomaz on 10/28/15.
//  Copyright © 2015 Concrete Solutions. All rights reserved.
//

#import "IMBaseModel.h"

@interface IMHeader: IMBaseModel

@property (nonatomic, copy) NSString *key;
@property (nonatomic, copy) NSString *value;

+ (instancetype)headerWithValue:(NSString *)value forKey:(NSString *)key;

@end
