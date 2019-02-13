//
//  IMBackendClient+TokenCitiRequest.h
//  SDKiOSCore
//
//  Created by Carlos A Savi on 12/04/2018.
//  Copyright © 2018 Itau. All rights reserved.
//

#import "IMBackendClient.h"
#import "IMBlockTypes.h"

@interface IMBackendClient (TokenCitiRequest)

-(void)queryOlympusSituation:(IMCompletionBlock _Nullable)successBlock
                failureBlock:(IMCompletionBlock _Nullable)failure;

-(void)queryOlympusCode:(IMCompletionBlock _Nullable)successBlock
           failureBlock:(IMCompletionBlock _Nullable)failure;

-(void)sendOlympusCode:(NSString*)email successBlock:(IMCompletionBlock _Nullable)success
          failureBlock:(IMCompletionBlock _Nullable)failure;

-(void)validateOlympusCode:(NSString*)code successBlock:(IMCompletionBlock _Nullable)success
              failureBlock:(IMCompletionBlock _Nullable)failure;

@end


