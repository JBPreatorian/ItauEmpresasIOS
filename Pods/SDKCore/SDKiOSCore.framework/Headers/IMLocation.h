//
//  IMLocation.h
//  SDKiOSCore
//
//  Created by Bruno Fernandes on 10/05/17.
//  Copyright © 2017 Concrete Solutions. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IMLocation : NSObject

@property (nonatomic, readonly) double latitude;
@property (nonatomic, readonly) double longitude;

- (instancetype)initWithLatitude:(double)latitude logitude:(double)longitude NS_SWIFT_NAME(init(with:logitude:));

@end
