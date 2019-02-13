//
//  IMRouterFlow.h
//  SDKiOSCore
//
//  Created by Alexandre Garrefa on 8/6/15.
//  Copyright (c) 2015 Concrete Solutions. All rights reserved.
//

#import "IMFlowResponse.h"
#import "IMBaseModel.h"

@interface IMRouterFlow: IMBaseModel<IMFlowResponse>

@property (nonatomic, copy) NSString *target;
@property (nonatomic, copy) NSString *op;

@end
