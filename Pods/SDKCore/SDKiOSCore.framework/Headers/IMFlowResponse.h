//
//  IMFlowResponse.h
//  SDKiOSCore
//
//  Created by Alexandre Garrefa on 8/6/15.
//  Copyright (c) 2015 Concrete Solutions. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol IMFlowResponse<NSObject>

@required

@property (nonatomic, copy) NSString *target;
@property (nonatomic, copy) NSString *op;

@end
