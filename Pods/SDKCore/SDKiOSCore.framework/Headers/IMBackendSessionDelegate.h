//
//  IMBackendSessionDelegate.h
//  SDKiOSCore
//
//  Created by Bruno Santos on 10/27/17.
//  Copyright © 2017 Itau. All rights reserved.
//

@protocol IMBackendSessionDelegate<NSObject>

- (void)didStartSessionWith:(NSURLSessionConfiguration *) configuration;

@end

