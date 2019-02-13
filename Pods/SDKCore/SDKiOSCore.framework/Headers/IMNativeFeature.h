//
//  IMNativeFeature.h
//  SDKiOSCore
//
//  Created by Bruno Fernandes on 24/05/17.
//  Copyright © 2017 Concrete Solutions. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IMNativeFeature : NSObject

@property (nonatomic, strong) NSString *category;
@property (nonatomic, strong) NSString *action;
@property (nonatomic, strong) NSString *data;
@property (nonatomic, strong) NSString *mimeType;

- (instancetype)initWithJson:(NSDictionary *)json;
- (instancetype)initWithCategory:(NSString*)category
                          action:(NSString*)action
                            data:(NSString*)data
                        mimeType:(NSString*)mimeType;

@end
