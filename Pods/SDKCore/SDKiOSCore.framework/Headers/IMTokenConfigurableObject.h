//
//  IMTokenConfigurableObject.h
//  SDKiOSCore
//
//  Created by Thiago Lioy on 1/5/16.
//  Copyright © 2016 Concrete Solutions. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IMTokenTypes.h"

@interface IMTokenConfigurableObject: NSObject

@property (nonatomic, copy) NSString      *apiMessage;
@property (nonatomic, copy) NSString      *helperMessage;
@property (nonatomic, assign) IMTokenType type;

@end
