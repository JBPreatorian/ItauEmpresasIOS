//
//  BioParameter.h
//  SDKiOSCore
//
//  Created by Filipe Henrique Souza on 26/11/2018.
//  Copyright © 2018 Itau. All rights reserved.
//

#import "IMBaseModel.h"

@interface BioParameter : IMBaseModel

@property (nonatomic, copy) NSString *parameterHash;
@property (nonatomic, copy) NSString *dataSeparator;
@property (nonatomic, copy) NSString *captureTryout;
@property (nonatomic, copy) NSString *captureTimeout;
@property (nonatomic, copy) NSDictionary *jsonClient;
@property (nonatomic, copy) NSDictionary *xmlClient;

- (BOOL)isValid;

- (NSString*)workflow;

@end
