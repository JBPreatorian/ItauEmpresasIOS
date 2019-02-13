//
//  IMBaseModel.h
//  SDKiOSCore
//
//  Created by Tales Pinheiro De Andrade on 17/01/17.
//  Copyright © 2017 Concrete Solutions. All rights reserved.
//

#import <Mantle/MTLModel.h>
#import <Mantle/MTLJSONAdapter.h>
#import <Mantle/NSDictionary+MTLMappingAdditions.h>

@interface IMBaseModel: MTLModel<MTLJSONSerializing>

-(NSDictionary*)asDictError:(NSError **)error;
+ (instancetype)parse:(NSDictionary *)dc error:(NSError **)error;
+ (NSArray*)parseArray:(NSArray *)objs error:(NSError **)error;

@end
