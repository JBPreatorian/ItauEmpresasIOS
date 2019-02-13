//
//  SDKContext.h
//  SDKiOSCore
//
//  Created by Inacio Ferrarini on 1/31/17.
//  Copyright © 2017 Concrete Solutions. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MemoryStorageWebView;

@interface SDKContext : NSObject

@property (nonatomic, strong, readonly) MemoryStorageWebView *memoryStorageWebView;

+ (instancetype)sharedContext;

@end
